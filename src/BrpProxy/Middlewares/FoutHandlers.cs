﻿using HaalCentraal.BrpProxy.Generated;
using Newtonsoft.Json;
using System.Text.RegularExpressions;

namespace BrpProxy.Middlewares
{
    public static class FoutHandlers
    {
        private const string ProblemJsonContentType = "application/problem+json";

        private const string BadRequestIdentifier = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.1";
        private const string NotFoundIdentifier = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.4";
        private const string MethodNotAllowedIdentifier = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.5";
        private const string NotAcceptableIdentifier = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.6";
        private const string UnsupportedMediaTypeIdentifier = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.13";
        private const string InternalServerErrorIdentifier = "https://datatracker.ietf.org/doc/html/rfc7231#section-6.6.1";

        private static readonly Regex ConvertPropertyValueRegex = new(@"^Could not convert string to (?<code>.*):(.*). Path '(?<name>.*)'.$", RegexOptions.None, TimeSpan.FromMilliseconds(100));
        private static readonly Regex RequiredPropertyRegex = new(@"^Required property '(?<name>.*)' expects a non-null value. Path ''.$", RegexOptions.None, TimeSpan.FromMilliseconds(100));
        private static readonly Regex ConvertValueToCollectionRegex = new(@"^Error converting value ""(.*)"" to type '(.*)'. Path '(?<name>.*)'.$", RegexOptions.None, TimeSpan.FromMilliseconds(100));

        private static Foutbericht CreateNotFoundFoutbericht(this HttpContext context)
        {
            return new Foutbericht
            {
                Status = StatusCodes.Status404NotFound,
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Title = "Opgevraagde resource bestaat niet.",
                Type = new Uri(NotFoundIdentifier)
            };
        }

        private static Foutbericht CreateMethodNotAllowedFoutbericht(this HttpContext context)
        {
            return new Foutbericht
            {
                Status = StatusCodes.Status405MethodNotAllowed,
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Title = "Method not allowed.",
                Type = new Uri(MethodNotAllowedIdentifier)
            };
        }

        private static Foutbericht CreateNotAcceptableFoutbericht(this HttpContext context)
        {
            return new Foutbericht
            {
                Code = "notAcceptable",
                Detail = "Ondersteunde content type: application/json; charset=utf-8.",
                Status = StatusCodes.Status406NotAcceptable,
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Title = "Gevraagde content type wordt niet ondersteund.",
                Type = new Uri(NotAcceptableIdentifier)
            };
        }

        private static Foutbericht CreateNotSupportedMediaTypeFoutbericht(this HttpContext context)
        {
            return new Foutbericht
            {
                Code = "unsupportedMediaType",
                Detail = "Ondersteunde content type: application/json; charset=utf-8.",
                Status = StatusCodes.Status415UnsupportedMediaType,
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Title = "Media Type wordt niet ondersteund.",
                Type = new Uri(UnsupportedMediaTypeIdentifier)
            };
        }

        private static Foutbericht CreateInternalServerErrorFoutbericht(this HttpContext context)
        {
            return new Foutbericht
            {
                Status = StatusCodes.Status500InternalServerError,
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Title = "Internal Server error.",
                Type = new Uri(InternalServerErrorIdentifier)
            };
        }

        private static BadRequestFoutbericht CreateJsonSerializationExceptionFoutbericht(this HttpContext context, JsonSerializationException ex)
        {
            var name = string.Empty;
            var code = string.Empty;
            var reason = string.Empty;

            var match = ConvertValueToCollectionRegex.Match(ex.Message);
            if (match.Success)
            {
                name = match.Groups["name"].Value;
                if(new []{ "fields", "burgerservicenummer" }.Contains(name))
                {
                    code = "array";
                    reason = "Parameter is geen array.";
                }
            }
            match = RequiredPropertyRegex.Match(ex.Message);
            if (match.Success)
            {
                name = match.Groups["name"].Value;
                if (name == "inclusiefOverledenPersonen")
                {
                    code = "boolean";
                    reason = "Waarde is geen boolean.";
                }
                else
                {
                    code = "required";
                    reason = "Parameter is verplicht.";
                }
            }

            return new BadRequestFoutbericht
            {
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Status = StatusCodes.Status400BadRequest,
                Title = "Een of meerdere parameters zijn niet correct.",
                Type = new Uri(BadRequestIdentifier),
                Code = "paramsValidation",
                Detail = $"De foutieve parameter(s) zijn: {name}.",
                InvalidParams = new List<InvalidParams>
                {
                    new InvalidParams
                    {
                        Code = code,
                        Name = name,
                        Reason = reason
                    }
                }
            };
        }

        private static BadRequestFoutbericht CreateJsonReaderExceptionFoutbericht(this HttpContext context, JsonReaderException? ex)
        {
            var name = string.Empty;
            var code = string.Empty;
            var reason = string.Empty;

            var match = ConvertPropertyValueRegex.Match(ex != null ? ex.Message : string.Empty);
            if (match.Success)
            {
                name = match.Groups["name"].Value;
                code = match.Groups["code"].Value;
                reason = $"Waarde is geen {match.Groups["code"].Value}.";
            }

            var retval = new BadRequestFoutbericht
            {
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Status = StatusCodes.Status400BadRequest,
                Title = "Een of meerdere parameters zijn niet correct.",
                Type = new Uri(BadRequestIdentifier),
                Code = "paramsValidation",
                Detail = $"De foutieve parameter(s) zijn: {name}."
            };
            if (!string.IsNullOrEmpty(name) ||
                !string.IsNullOrEmpty(code) ||
                !string.IsNullOrEmpty(reason))
            {
                retval.InvalidParams = new List<InvalidParams>
                    {
                        new InvalidParams
                        {
                            Code = code,
                            Name = name,
                            Reason = reason
                        }
                    };
            }
            return retval;
        }

        public static BadRequestFoutbericht CreateBadRequestFoutbericht(this HttpContext context, string titel, string code, IEnumerable<InvalidParams> invalidParams)
        {
            return new BadRequestFoutbericht
            {
                Instance = new Uri(context.Request.Path, UriKind.Relative),
                Status = StatusCodes.Status400BadRequest,
                Title = titel,
                Type = new Uri(BadRequestIdentifier),
                Code = code,
                Detail = $"De foutieve parameter(s) zijn: {string.Join(", ", invalidParams.Select(x => x.Name))}.",
                InvalidParams = new List<InvalidParams>(invalidParams)
            };
        }

        private static void SetResponseProperties(this HttpContext context, Foutbericht foutbericht, Stream bodyStream)
        {
            context.Response.StatusCode = foutbericht.Status!.Value;
            context.Response.ContentLength = bodyStream.Length;
            context.Response.ContentType = ProblemJsonContentType;
        }

        public static async Task<bool> HandleNotFound(this HttpContext context, Stream orgResponseBodyStream, ILogger logger)
        {
            logger.LogWarning("resource not found: {@requestPath}", context.Request.Path);

            var foutbericht = context.CreateNotFoundFoutbericht();

            using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

            context.SetResponseProperties(foutbericht, bodyStream);

            await bodyStream.CopyToAsync(orgResponseBodyStream);

            return false;
        }

        public static async Task<bool> MethodIsAllowed(this HttpContext context, Stream orgResponseBodyStream, ILogger logger)
        {
            if (context.Request.Method == HttpMethod.Post.Method) return true;

            logger.LogWarning("method not allowed: {@requestMethod}", context.Request.Method);

            var foutbericht = context.CreateMethodNotAllowedFoutbericht();

            using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

            context.SetResponseProperties(foutbericht, bodyStream);

            await bodyStream.CopyToAsync(orgResponseBodyStream);

            return false;
        }

        private static string RemoveWhitespace(this string str)
        {
            return string.Join("", str.Split(default(string[]), StringSplitOptions.RemoveEmptyEntries));
        }

        public static async Task<bool> AcceptIsAllowed(this HttpContext context, Stream orgResponseBodyStream, ILogger logger)
        {
            foreach(var acceptValue in context.Request.Headers.Accept)
            {
                if (!string.IsNullOrWhiteSpace(acceptValue) &&
                    !new[]
                    {
                        "*/*",
                        "*/*;charset=utf-8",
                        "application/json",
                        "application/json;charset=utf-8"
                    }.Contains(acceptValue.ToLowerInvariant().RemoveWhitespace()))
                {
                    logger.LogWarning("Not supported Accept values: {@acceptHeader}", context.Request.Headers.Accept);

                    var foutbericht = context.CreateNotAcceptableFoutbericht();

                    using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

                    context.SetResponseProperties(foutbericht, bodyStream);

                    await bodyStream.CopyToAsync(orgResponseBodyStream);

                    return false;
                }
            }
            return true;
        }

        public static async Task<bool> ContentTypeIsAllowed(this HttpContext context, Stream orgResponseBodyStream, ILogger logger)
        {
            foreach(var contentType in context.Request.Headers.ContentType)
            {
                if (!string.IsNullOrWhiteSpace(contentType) &&
                    !new[]
                    {
                        "application/json",
                        "application/json;charset=utf-8"
                    }.Contains(contentType.ToLowerInvariant().RemoveWhitespace()))
                {
                    logger.LogWarning("Not supported Content-Type values: {@contentTypeHeader}", context.Request.Headers.ContentType);

                    var foutbericht = context.CreateNotSupportedMediaTypeFoutbericht();

                    using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

                    context.SetResponseProperties(foutbericht, bodyStream);

                    await bodyStream.CopyToAsync(orgResponseBodyStream);

                    return false;
                }
            }
            return true;
        }

        public static async Task<bool> RequestBodyIsValid(this HttpContext context, string requestBody, Stream orgResponseBodyStream, ILogger logger)
        {
            if(!string.IsNullOrWhiteSpace(requestBody))
            {
                return true;
            }

            logger.LogWarning("Not supported requestBody: {@requestBody}", requestBody);

            var foutbericht = context.CreateJsonReaderExceptionFoutbericht(null);

            using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

            context.SetResponseProperties(foutbericht, bodyStream);

            await bodyStream.CopyToAsync(orgResponseBodyStream);

            return false;
        }

        public static async Task HandleJsonSerializationException(this HttpContext context, string requestBody, JsonSerializationException ex, Stream orgResponseBodyStream, ILogger logger)
        {
            logger.LogWarning("JsonSerializationException. requestBody: {@requestBody}, exception: {@exception}", requestBody, ex);

            var foutbericht = context.CreateJsonSerializationExceptionFoutbericht(ex);

            using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

            context.SetResponseProperties(foutbericht, bodyStream);

            await bodyStream.CopyToAsync(orgResponseBodyStream);
        }

        public static async Task HandleJsonReaderException(this HttpContext context, string requestBody, JsonReaderException ex, Stream orgResponseBodyStream, ILogger logger)
        {
            logger.LogWarning("JsonReaderException. requestBody: {@requestBody}, exception: {@exception}", requestBody, ex);

            var foutbericht = context.CreateJsonReaderExceptionFoutbericht(ex);

            using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

            context.SetResponseProperties(foutbericht, bodyStream);

            await bodyStream.CopyToAsync(orgResponseBodyStream);
        }

        public static async Task HandleValidationErrors(this HttpContext context, string requestBody, BadRequestFoutbericht foutbericht, Stream orgResponseBodyStream, ILogger logger)
        {
            logger.LogWarning("Validation errors. requestBody: {@requestBody}, foutbericht: {@foutbericht}", requestBody, foutbericht);

            using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

            context.SetResponseProperties(foutbericht, bodyStream);

            await bodyStream.CopyToAsync(orgResponseBodyStream);
        }

        public static async Task HandleUnhandledException(this HttpContext context, string requestBody, Exception ex, Stream orgResponseBodyStream, ILogger logger)
        {
            logger.LogError(ex, message: "requestBody: {@requestBody}", requestBody);

            var foutbericht = context.CreateInternalServerErrorFoutbericht();

            using var bodyStream = foutbericht.ToJson().ToMemoryStream(context.Response);

            context.SetResponseProperties(foutbericht, bodyStream);

            await bodyStream.CopyToAsync(orgResponseBodyStream);
        }
    }
}