﻿using BrpProxy.Validators;
using FluentAssertions;
using Xunit;

namespace BrpProxy.Tests
{
    public class AddInOnderzoekFieldsTests
    {
        [Theory]
        [InlineData(new[] { "burgerservicenummer" },
                    new[]
                        {
                            "burgerservicenummer",
                            "inOnderzoek.burgerservicenummer",
                            "inOnderzoek.datumIngangOnderzoekPersoon"
                        })]
        [InlineData(new[] { "aNummer" },
                    new[] { "aNummer" })]
        [InlineData(new[] { "aNummer", "leeftijd" },
                    new[]
                        {
                            "aNummer",
                            "leeftijd",
                            "inOnderzoek.leeftijd",
                            "inOnderzoek.datumIngangOnderzoekPersoon"
                        })]


        [InlineData(new[] { "datumEersteInschrijvingGBA" },
                    new[] { "datumEersteInschrijvingGBA" })]
        [InlineData(new[] { "gemeenteVanInschrijving", "datumInschrijvingInGemeente" },
                    new[]
                        {
                            "gemeenteVanInschrijving",
                            "inOnderzoek.gemeenteVanInschrijving",
                            "datumInschrijvingInGemeente",
                            "inOnderzoek.datumInschrijvingInGemeente",
                            "inOnderzoek.datumIngangOnderzoekGemeente"
                        })]


        [InlineData(new[] { "indicatieGezagMinderjarige" },
                    new[]
                        {
                            "indicatieGezagMinderjarige",
                            "inOnderzoek.indicatieGezagMinderjarige",
                            "inOnderzoek.datumIngangOnderzoekGezag"
                        })]
        [InlineData(new[] { "indicatieCurateleRegister" },
                    new[]
                        {
                            "indicatieCurateleRegister",
                            "inOnderzoek.indicatieCurateleRegister",
                            "inOnderzoek.datumIngangOnderzoekGezag"
                        })]

        [InlineData(new[] { "verblijfplaats"},
                    new[] { "verblijfplaats", "verblijfplaats.inOnderzoek"})]
        [InlineData(new[] { "verblijfplaats.datumVan" },
                    new[]
                        {
                            "verblijfplaats.datumVan",
                            "verblijfplaats.inOnderzoek.type",
                            "verblijfplaats.inOnderzoek.datumVan",
                            "verblijfplaats.inOnderzoek.datumIngangOnderzoek"
                        })]
        [InlineData(new[] { "verblijfplaats.datumVan", "verblijfplaats.functieAdres" },
                    new[]
                        {
                            "verblijfplaats.datumVan",
                            "verblijfplaats.inOnderzoek.datumVan",
                            "verblijfplaats.functieAdres",
                            "verblijfplaats.inOnderzoek.functieAdres",
                            "verblijfplaats.inOnderzoek.type",
                            "verblijfplaats.inOnderzoek.datumIngangOnderzoek"
                        })]
        [InlineData(new[] { "verblijfplaats.verblijfadres" },
                    new[]
                        {
                            "verblijfplaats.inOnderzoek.type",
                            "verblijfplaats.inOnderzoek.datumIngangOnderzoek",
                            "verblijfplaats.verblijfadres",
                            "verblijfplaats.verblijfadres.inOnderzoek"
                        })]
        [InlineData(new[] { "verblijfplaats.verblijfadres.officieleStraatnaam" },
                    new[]
                        {
                            "verblijfplaats.inOnderzoek.type",
                            "verblijfplaats.inOnderzoek.datumIngangOnderzoek",
                            "verblijfplaats.verblijfadres.officieleStraatnaam",
                            "verblijfplaats.verblijfadres.inOnderzoek.officieleStraatnaam",
                            "verblijfplaats.verblijfadres.inOnderzoek.datumIngangOnderzoek"
                        })]
        [InlineData(new[] { "verblijfplaats.verblijfadres.officieleStraatnaam", "verblijfplaats.verblijfadres.huisnummer" },
                    new[]
                        {
                            "verblijfplaats.inOnderzoek.type",
                            "verblijfplaats.inOnderzoek.datumIngangOnderzoek",
                            "verblijfplaats.verblijfadres.officieleStraatnaam",
                            "verblijfplaats.verblijfadres.inOnderzoek.officieleStraatnaam",
                            "verblijfplaats.verblijfadres.huisnummer",
                            "verblijfplaats.verblijfadres.inOnderzoek.huisnummer",
                            "verblijfplaats.verblijfadres.inOnderzoek.datumIngangOnderzoek"
                        })]
        public void Verblijfplaats(string[] input, string[] expected)
        {
            input.AddInOnderzoekFields().Should().BeEquivalentTo(expected);
        }
    }
}
