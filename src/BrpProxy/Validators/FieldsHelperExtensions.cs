﻿using HaalCentraal.BrpProxy.Generated;
using Newtonsoft.Json;
using System.Reflection;
using System.Text.RegularExpressions;

namespace BrpProxy.Validators
{
    public static class FieldsHelperExtensions
    {
        public static bool IsInOnderzoekField(this string field)
        {
            return field.Contains("inOnderzoek");
        }

        public static List<string> GetPropertyPaths(this Type type, string baseNamespace, string path = "")
        {
            List<string> retval = new();

            var attributes = type.GetCustomAttributes(false);
            foreach (var attribute in attributes)
            {
                switch (attribute)
                {
                    case JsonConverterAttribute a:
                        var prop = a.ConverterParameters?[0] as string;
                        if (!string.IsNullOrWhiteSpace(prop))
                        {
                            retval.Add(prop.ToFullPath(path));
                        }
                        break;
                    case JsonInheritanceAttribute a:
                        retval.AddRange(a.Type.GetPropertyPaths(baseNamespace, path));
                        break;
                    default:
                        break;
                }
            }
            foreach (var property in type.GetProperties())
            {
                var name = property.JsonName();

                if (string.IsNullOrWhiteSpace(name))
                {
                    continue;
                }
                if (name != "AdditionalProperties")
                {
                    retval.Add(name.ToFullPath(path));
                }
                if (property.PropertyType.FullNameStartsWith(baseNamespace))
                {
                    retval.AddRange(property.PropertyType.GetPropertyPaths(baseNamespace, name.ToFullPath(path)));
                }
                if (property.PropertyType.IsGenericType)
                {
                    var genericType = property.PropertyType.GetGenericArguments()[0];
                    if (genericType.FullNameStartsWith(baseNamespace))
                    {
                        retval.AddRange(genericType.GetPropertyPaths(baseNamespace, name.ToFullPath(path)));
                    }
                }
            }

            return retval.Distinct().ToList();
        }

        private static string? JsonName(this PropertyInfo? property)
        {
            if (property == null) return null;

            var jsonProperty = property.GetCustomAttribute<JsonPropertyAttribute>();

            return jsonProperty != null
                ? jsonProperty.PropertyName
                : property.Name;
        }

        private static bool FullNameStartsWith(this Type? type, string baseNamespace)
        {
            return type != null &&
                   !string.IsNullOrWhiteSpace(type.FullName) &&
                   type.FullName.StartsWith(baseNamespace);
        }

        private static string ToFullPath(this string name, string path)
        {
            return string.IsNullOrWhiteSpace(path)
                    ? name
                    : $"{path}.{name}";
        }

        public static ICollection<T>? FilterList<T>(this ICollection<T> list, IEnumerable<string> fields)
        {
            if (list == null)
            {
                return default;
            }

            var retval = Activator.CreateInstance(list.GetType()) as ICollection<T>;
            if (retval == null)
            {
                return default;
            }

            foreach (var entity in list)
            {
                var newEntity = entity.Filter(fields);
                if (newEntity != null)
                {
                    retval.Add(newEntity);
                }
            }

            return retval;
        }

        public static T? Filter<T>(this T? entity, IEnumerable<string> fields)
        {
            if (entity == null)
            {
                return default;
            }

            var retval = Activator.CreateInstance(entity.GetType());

            foreach (var field in fields.Where(f => !(f.Contains("kinderen") || f.Contains("nationaliteiten") || f.Contains("ouders") || f.Contains("partners"))))
            {
                var fieldParts = field.Split('.');

                object? src = entity;
                object? dest = retval!;
                for (var index = 0; index < fieldParts.Length; index++)
                {
                    var fieldPart = fieldParts[index];

                    (var pi, var srcValue) = src.GetValue(fieldPart);
                    if (pi == null || srcValue == null)
                    {
                        // property of deel van de property heeft geen waarde. Stop met filteren van property
                        break;
                    }

                    if (index == fieldParts.Length - 1)
                    {
                        pi.SetValue(dest, srcValue);
                    }
                    else
                    {
                        var val = pi.GetValue(dest);
                        if (val == null)
                        {
                            pi.SetValue(dest, Activator.CreateInstance(srcValue != null ? srcValue.GetType() : pi.PropertyType));
                        }
                        dest = pi.GetValue(dest);
                    }
                    src = srcValue;
                }
            }

            foreach(var relatieNaam in new[] { "kinderen", "nationaliteiten", "ouders", "partners" })
            {
                (var pi, var srcValue) = entity.GetValue(relatieNaam);
                if (pi == null || srcValue == null)
                {
                    continue;
                }

                var relatieFields = from field in fields
                                   where field.StartsWith(relatieNaam)
                                   select field.Replace($"{relatieNaam}.", "");

                if (relatieFields.Any(x => x == relatieNaam))
                {
                    // alle velden van de relatie moeten worden geretourneerd
                    pi.SetValue(retval, srcValue);
                }
                else if (relatieFields.Any())
                {
                    switch (srcValue)
                    {
                        case ICollection<Kind> val:
                            pi.SetValue(retval, val.FilterList(relatieFields));
                            break;
                        case ICollection<AbstractNationaliteit> val:
                            pi.SetValue(retval, val.FilterList(relatieFields));
                            break;
                        case ICollection<Ouder> val:
                            pi.SetValue(retval, val.FilterList(relatieFields));
                            break;
                        case ICollection<Partner> val:
                            pi.SetValue(retval, val.FilterList(relatieFields));
                            break;
                        default:
                            break;
                    }
                }
            }

            return (T?)retval;
        }

        public static (PropertyInfo? pi, object? value) GetValue<T>(this T entity, string field)
        {
            if (entity == null) return (null, null);

            var pi = entity.GetType().GetProperty(field, BindingFlags.IgnoreCase | BindingFlags.Public | BindingFlags.Instance);
            if (pi == null) return (null, null);

            var val = pi.GetValue(entity);
            if (val == null) return (null, null);

            return (pi, val);
        }

        public static (PropertyInfo? pi, TResult? value) GetValue<T,TResult>(this T entity, string field)
        {
            if (entity == null) return (null, default);

            var pi = entity.GetType().GetProperty(field, BindingFlags.IgnoreCase | BindingFlags.Public | BindingFlags.Instance);
            if (pi == null) return (null, default);

            var val = pi.GetValue(entity);
            if (val == null) return (null, default);

            return (pi, (TResult)val);
        }

        public static IEnumerable<string> ReplaceDatumWaardeTabelVerblijfplaatsBinnenlandPropertyFieldPaths(this IEnumerable<string>? fields)
        {
            var retval = new List<string>();

            if(fields == null)
            {
                return retval;
            }

            foreach (var field in fields)
            {
                switch (field)
                {
                    case "geboorte.datum":
                    case "kinderen.geboorte.datum":
                    case "ouders.geboorte.datum":
                    case "overlijden.datum":
                    case "partners.aangaanHuwelijkPartnerschap.datum":
                    case "partners.geboorte.datum":
                    case "verblijfplaats.type":
                        retval.Add(field);
                        break;
                    case "verblijfplaatsBinnenland.type":
                        retval.Add("verblijfplaats.type");
                        break;
                    default:
                        retval.Add(
                            Regex.Replace(field,
                                @"(\.type|\.datum|\.langFormaat|\.jaar|\.maand|\.onbekend|\.code|\.soort|\.omschrijving)$|(Binnenland)", ""));
                        break;
                }
            }

            return retval;
        }

        private static bool HeeftGeenInOnderzoekField(this string field)
        {
            return new[]
            {
                "aNummer",
                "datumEersteInschrijvingGBA"
            }
            .Contains(field);
        }

        private static bool IsObjectField(this string field)
        {
            return new[]
            {
                "geboorte"
            }
            .Contains(field);
        }
        private static bool IsPersoonField(this string field)
        {
            return new[]
            {
                "burgerservicenummer",
                "leeftijd",
                "geslacht"
            }
            .Contains(field);
        }

        private static bool IsGemeenteField(this string field)
        {
            return new[]
            {
                "gemeenteVanInschrijving",
                "datumInschrijvingInGemeente"
            }
            .Contains(field);
        }

        private static bool IsGezagField(this string field)
        {
            return new[]
            {
                "indicatieGezagMinderjarige",
                "indicatieCurateleRegister"
            }
            .Contains(field);
        }

        private static bool IsCollectionFieldFieldPart(this string fieldPart)
        {
            return new[]
            {
                "kinderen",
                "ouders"
            }
            .Contains(fieldPart);
        }

        private static bool IsOverlijdenFieldPart(this string fieldPart)
        {
            return new[]
            {
                "overlijden"
            }
            .Contains(fieldPart);
        }

        private static bool IsVerblijfplaatsFieldPart(this string fieldPart)
        {
            return new[]
            {
                "verblijfplaats"
            }
            .Contains(fieldPart);
        }

        private static bool IsVerblijfadresFieldPart(this string fieldPart) => fieldPart == "verblijfadres";

        public static IEnumerable<string> AddInOnderzoekFields(this IEnumerable<string> fields)
        {
            var retval = new List<string>();

            foreach (var field in fields)
            {
                retval.Add(field);
                if (field.HeeftGeenInOnderzoekField())
                {
                    continue;
                }

                var fieldParts = field.Split('.');
                switch (fieldParts.Length)
                {
                    case 1:
                        if (fieldParts[0].IsVerblijfplaatsFieldPart() ||
                            fieldParts[0].IsCollectionFieldFieldPart() ||
                            fieldParts[0].IsOverlijdenFieldPart())
                        {
                            retval.Add($"{fieldParts[0]}.inOnderzoek");
                        }
                        else
                        {
                            retval.Add($"inOnderzoek.{fieldParts[0]}");
                            if (fieldParts[0].IsPersoonField())
                            {
                                retval.Add("inOnderzoek.datumIngangOnderzoekPersoon");
                            }
                            else if (fieldParts[0].IsGemeenteField())
                            {
                                retval.Add("inOnderzoek.datumIngangOnderzoekGemeente");
                            }
                            else if (fieldParts[0].IsGezagField())
                            {
                                retval.Add("inOnderzoek.datumIngangOnderzoekGezag");
                            }
                            else
                            {
                                retval.Add("inOnderzoek.datumIngangOnderzoek");
                            }
                        }
                        break;
                    case 2:
                        if (fieldParts[1].IsVerblijfadresFieldPart())
                        {
                            retval.Add($"{fieldParts[0]}.inOnderzoek.type");
                            retval.Add($"{fieldParts[0]}.inOnderzoek.datumIngangOnderzoek");
                            retval.Add($"{fieldParts[0]}.{fieldParts[1]}.inOnderzoek");
                        }
                        else if (fieldParts[0].IsCollectionFieldFieldPart() &&
                                 fieldParts[1].IsObjectField())
                        {
                            retval.Add($"{fieldParts[0]}.{fieldParts[1]}.inOnderzoek");
                        }
                        else
                        {
                            if (fieldParts[0].IsVerblijfplaatsFieldPart())
                            {
                                retval.Add($"{fieldParts[0]}.inOnderzoek.type");
                            }
                            retval.Add($"{fieldParts[0]}.inOnderzoek.{fieldParts[1]}");
                            retval.Add($"{fieldParts[0]}.inOnderzoek.datumIngangOnderzoek");
                        }
                        break;
                    case 3:
                        if (fieldParts[0].IsVerblijfplaatsFieldPart())
                        {
                            retval.Add($"{fieldParts[0]}.inOnderzoek.type");
                            retval.Add($"{fieldParts[0]}.inOnderzoek.datumIngangOnderzoek");
                        }
                        retval.Add($"{fieldParts[0]}.{fieldParts[1]}.inOnderzoek.{fieldParts[2]}");
                        retval.Add($"{fieldParts[0]}.{fieldParts[1]}.inOnderzoek.datumIngangOnderzoek");
                        break;
                    default:
                        break;
                }
            }
            return retval.Distinct();
        }

        public static IEnumerable<string> AddAlwaysReturnedFields(this IEnumerable<string> fields)
        {
            var retval = new List<string>(fields);

            retval.AddRange(new[]
            {
                "geheimhoudingPersoonsgegevens",
                "opschortingBijhouding",
                "overlijden.indicatieOverleden",
                "rni"
            });

            return retval;
        }
    }
}
