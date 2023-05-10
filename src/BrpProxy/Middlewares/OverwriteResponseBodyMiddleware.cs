﻿using HaalCentraal.BrpProxy.Generated;
using Gba = HaalCentraal.BrpProxy.Generated.Gba;
using Newtonsoft.Json;
using System.IO.Compression;
using AutoMapper;
using BrpProxy.Validators;
using Newtonsoft.Json.Linq;

namespace BrpProxy.Middlewares
{
    public class OverwriteResponseBodyMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<OverwriteResponseBodyMiddleware> _logger;
        private readonly IMapper _mapper;
        private readonly FieldsHelper _fieldsHelper;

        public OverwriteResponseBodyMiddleware(RequestDelegate next, ILogger<OverwriteResponseBodyMiddleware> logger, IMapper mapper, FieldsHelper fieldsHelper)
        {
            _next = next;
            _logger = logger;
            _mapper = mapper;
            _fieldsHelper = fieldsHelper;
        }

        public async Task Invoke(HttpContext context)
        {
            _logger.LogDebug("TimeZone: {@localTimeZone}. Now: {@now}", TimeZoneInfo.Local.StandardName, DateTime.Now);

            var orgBodyStream = context.Response.Body;
            string requestBody = string.Empty;
            try
            {
                _logger.LogDebug("request headers: {@requestHeaders}", context.Request.Headers);

                if (! await context.MethodIsAllowed(orgBodyStream, _logger))
                {
                    return;
                }
                if(! await context.AcceptIsAllowed(orgBodyStream, _logger))
                {
                    return;
                }
                if(! await context.ContentTypeIsAllowed(orgBodyStream, _logger))
                {
                    return;
                }

                requestBody = await context.Request.ReadBodyAsync();
                if(!await context.RequestBodyIsValid(requestBody, orgBodyStream, _logger))
                {
                    return;
                }

                PersonenQuery? personenQuery = null;
                try
                {
                    personenQuery = JsonConvert.DeserializeObject<PersonenQuery>(requestBody);
                }
                catch (JsonSerializationException ex)
                {
                    await context.HandleJsonSerializationException(requestBody, ex, orgBodyStream, _logger);
                    return;
                }
                catch (JsonReaderException ex)
                {
                    await context.HandleJsonReaderException(requestBody, ex, orgBodyStream, _logger);
                    return;
                }

                var result = personenQuery.Validate(context, requestBody, _fieldsHelper);
                if (!result.IsValid)
                {
                    await context.HandleValidationErrors(requestBody, result.Foutbericht!, orgBodyStream, _logger);
                    return;
                }

                _logger.LogInformation("requestBody: {@personenQuery}",
                                       _logger.IsEnabled(LogLevel.Debug) ? personenQuery : ((IRedactCloneable)personenQuery!)?.RedactClone());

                using var newBodyStream = new MemoryStream();
                context.Response.Body = newBodyStream;

                await _next(context);

                if (context.Response.StatusCode == StatusCodes.Status404NotFound)
                {
                    await context.HandleNotFound(orgBodyStream, _logger);
                    return;
                }

                var body = await context.Response.ReadBodyAsync();

                _logger.LogDebug("original responseBody: {@body}", body);

                var resultFields = personenQuery is RaadpleegMetBurgerservicenummer
                            ? _fieldsHelper.AddExtraPersoonFields(result.Fields!)
                            : _fieldsHelper.AddExtraPersoonBeperktFields(result.Fields!);

                var modifiedBody = context.Response.StatusCode == StatusCodes.Status200OK
                    ? body.Transform(_mapper, resultFields, result.Fields!, _logger)
                    : body;

                _logger.LogDebug("transformed responseBody: {@modifiedBody}", modifiedBody);

                using var bodyStream = modifiedBody.ToMemoryStream(context.Response);

                context.Response.ContentLength = bodyStream.Length;
                await bodyStream.CopyToAsync(orgBodyStream);
            }
            catch (Exception ex)
            {
                await context.HandleUnhandledException(requestBody, ex, orgBodyStream, _logger);
            }
        }
    }

    public static class BrpHelpers
    {
        public static ValidatePersonenQueryResult Validate(this PersonenQuery? personenQuery, HttpContext context, string requestBody, FieldsHelper fieldsHelper)
        {
            var result = personenQuery switch
            {
                RaadpleegMetBurgerservicenummer query => new RaadpleegMetBurgerservicenummerQueryValidator(fieldsHelper).Validate(query),
                ZoekMetGeslachtsnaamEnGeboortedatum query => new ZoekMetGeslachtsnaamEnGeboortedatumQueryValidator(fieldsHelper).Validate(query),
                ZoekMetPostcodeEnHuisnummer query => new ZoekMetPostcodeEnHuisnummerQueryValidator(fieldsHelper).Validate(query),
                ZoekMetNaamEnGemeenteVanInschrijving query => new ZoekMetNaamEnGemeenteVanInschrijvingQueryValidator(fieldsHelper).Validate(query),
                ZoekMetNummeraanduidingIdentificatie query => new ZoekMetNummeraanduidingIdentificatieQueryValidator(fieldsHelper).Validate(query),
                ZoekMetStraatHuisnummerEnGemeenteVanInschrijving query => new ZoekMetStraatHuisnummerEnGemeenteVanInschrijvingQueryValidator(fieldsHelper).Validate(query),
                _ => null
            };

            return result != null
                ? ValidatePersonenQueryResult.CreateFrom(result, personenQuery?.Fields, context)
                : ValidatePersonenQueryResult.CreateFrom(new PersonenQueryRequestBodyValidator().Validate(JObject.Parse(requestBody)), context);
        }

        public static string Transform(this string payload, IMapper mapper, ICollection<string> fields, ICollection<string> originalFields, ILogger logger)
        {
            PersonenQueryResponse retval;
            var response = JsonConvert.DeserializeObject<Gba.PersonenQueryResponse>(payload);
            logger.LogDebug("Original response body: {@response}", response);

            switch (response)
            {
                case Gba.RaadpleegMetBurgerservicenummerResponse p:
                    var result = mapper.Map<RaadpleegMetBurgerservicenummerResponse>(p);
                    result.Personen = result.Personen.FilterAfgevoerdePersoon().ExcludeAdresregelsEnVerblijfplaatsBuitenland(originalFields).FilterList(fields);
                    retval = result;
                    break;
                case Gba.ZoekMetGeslachtsnaamEnGeboortedatumResponse pb:
                    var result1 = mapper.Map<ZoekMetGeslachtsnaamEnGeboortedatumResponse>(pb);
                    result1.Personen = result1.Personen.ExcludeAfgevoerdePersoon().FilterList(fields);
                    retval = result1;
                    break;
                case Gba.ZoekMetNaamEnGemeenteVanInschrijvingResponse pb:
                    var result3 = mapper.Map<ZoekMetNaamEnGemeenteVanInschrijvingResponse>(pb);
                    result3.Personen = result3.Personen.ExcludeAfgevoerdePersoon().FilterList(fields);
                    retval = result3;
                    break;
                case Gba.ZoekMetPostcodeEnHuisnummerResponse pb:
                    var result2 = mapper.Map<ZoekMetPostcodeEnHuisnummerResponse>(pb);
                    result2.Personen = result2.Personen.ExcludeAfgevoerdePersoon().FilterList(fields);
                    retval = result2;
                    break;
                case Gba.ZoekMetNummeraanduidingIdentificatieResponse pb:
                    var result4 = mapper.Map<ZoekMetNummeraanduidingIdentificatieResponse>(pb);
                    result4.Personen = result4.Personen.ExcludeAfgevoerdePersoon().FilterList(fields);
                    retval = result4;
                    break;
                case Gba.ZoekMetStraatHuisnummerEnGemeenteVanInschrijvingResponse pb:
                    var result5 = mapper.Map<ZoekMetStraatHuisnummerEnGemeenteVanInschrijvingResponse>(pb);
                    result5.Personen = result5.Personen.ExcludeAfgevoerdePersoon().FilterList(fields);
                    retval = result5;
                    break;
                default:
                    throw new NotSupportedException();
            }

            logger.LogDebug("After fields filtering {@retval}", retval);
            return JsonConvert.SerializeObject(retval, new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore,
                DefaultValueHandling = DefaultValueHandling.Ignore
            });
        }
    }

    public static class HttpResponseHelpers
    {
        private static async Task<string> ReadCompressedBodyAsync(this HttpRequest request)
        {

            try
            {
                request.Body.Seek(0, SeekOrigin.Begin);

                var gzipStream = new GZipStream(request.Body, CompressionMode.Decompress);
                StreamReader streamReader = new(gzipStream, leaveOpen: true);

                return await streamReader.ReadToEndAsync();
            }
            finally
            {
                request.Body.Seek(0, SeekOrigin.Begin);
            }

        }

        private static async Task<string> ReadUncompressedBodyAsync(this HttpRequest request)
        {
            try
            {
                request.Body.Seek(0, SeekOrigin.Begin);

                StreamReader streamReader = new StreamReader(request.Body, leaveOpen: true);

                return await streamReader.ReadToEndAsync();
            }
            finally
            {
                request.Body.Seek(0, SeekOrigin.Begin);
            }
        }

        public static async Task<string> ReadBodyAsync(this HttpRequest request)
        {
            request.EnableBuffering();

            try
            {
                if (request.Headers.ContentEncoding.Contains("gzip"))
                {
                    return await ReadCompressedBodyAsync(request);
                }
                else
                {
                    return await ReadUncompressedBodyAsync(request);
                }
            }
            catch (InvalidDataException)
            {
                return await ReadUncompressedBodyAsync(request);
            }
        }

        public static async Task<string> ReadBodyAsync(this HttpResponse response)
        {
            response.Body.Seek(0, SeekOrigin.Begin);

            StreamReader streamReader;
            if (response.Headers.ContentEncoding.Contains("gzip"))
            {
                var gzipStream = new GZipStream(response.Body, CompressionMode.Decompress);
                streamReader = new StreamReader(gzipStream);
            }
            else
            {
                streamReader = new StreamReader(response.Body);
            }

            var retval = await streamReader.ReadToEndAsync();

            response.Body.Seek(0, SeekOrigin.Begin);

            return retval;
        }
    }

    public static class MemoryStreamHelpers
    {
        public static MemoryStream ToMemoryStream(this string data, HttpResponse response)
        {
            var retval = new MemoryStream();

            StreamWriter streamWriter;
            if (response.Headers.ContentEncoding.Contains("gzip"))
            {
                var gzipStream = new GZipStream(retval, CompressionMode.Compress);
                streamWriter = new StreamWriter(gzipStream);
            }
            else
            {
                streamWriter = new StreamWriter(retval);
            }

            streamWriter.Write(data);
            streamWriter.Flush();

            retval.Seek(0, SeekOrigin.Begin);

            return retval;
        }
    }
}