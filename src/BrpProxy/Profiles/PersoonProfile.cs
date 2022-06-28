﻿using AutoMapper;
using BrpProxy.Mappers;
using HaalCentraal.BrpProxy.Generated;
using HaalCentraal.BrpProxy.Generated.Gba;

namespace BrpProxy.Profiles;

public class PersoonProfile : Profile
{
    public PersoonProfile()
    {
        CreateMap<GbaPersoonBeperkt, PersoonBeperkt>()
            .ForMember(dest => dest.Leeftijd, opt =>
            {
                opt.PreCondition(src => src.Overlijden == null);
                opt.MapFrom(src => src.Geboorte.Datum.Map().Leeftijd());
            })
            .AfterMap((src, dest) =>
            {
                if(dest.Verblijfplaats != null)
                {
                    dest.Adressering = new AdresseringBeperkt
                    {
                        Adresregel1 = dest.Verblijfplaats.Adresregel1(),
                        Adresregel2 = dest.Verblijfplaats.Adresregel2(dest.GemeenteVanInschrijving),
                        Adresregel3 = dest.Verblijfplaats.Adresregel3(),
                        Land = dest.Verblijfplaats.Land()
                    };
                }
            })
            ;

        CreateMap<GbaPersoon, Persoon>()
            .BeforeMap((src, dest) =>
            {
                if(src.Naam != null)
                {
                    if(src.Geslacht != null)
                    {
                        src.Naam.Geslacht = src.Geslacht;
                    }
                    if(src.Partners != null)
                    {
                        src.Naam.Partners = src.Partners;
                    }
                    src.Naam.InOnderzoek = src.PersoonInOnderzoek;
                }
                if (src.Geboorte != null)
                {
                    src.Geboorte.InOnderzoek = src.PersoonInOnderzoek;
                }
                if(src.Immigratie != null && src.Verblijfplaats != null)
                {
                    src.Immigratie.InOnderzoek = src.Verblijfplaats.InOnderzoek;
                }
            })
            .AfterMap((src, dest) =>
            {
                if(dest.Naam != null)
                {
                    dest.Adressering = new Adressering
                    {
                        Aanhef = dest.Naam.Aanhef(),
                        // Aanschrijfwijze = dest.Naam.Aanschrijfwijze()
                        GebruikInLopendeTekst = dest.Naam.GebruikInLopendeTekst()
                    };
                }
                if(dest.Verblijfplaats != null)
                {
                    if (dest.Adressering == null) { dest.Adressering = new Adressering(); }

                    dest.Adressering.Adresregel1 = dest.Verblijfplaats.Adresregel1();
                    dest.Adressering.Adresregel2 = dest.Verblijfplaats.Adresregel2(dest.GemeenteVanInschrijving);
                    dest.Adressering.Adresregel3 = dest.Verblijfplaats.Adresregel3();
                    dest.Adressering.Land = dest.Verblijfplaats.Land();
                }
                if(src.PersoonInOnderzoek != null ||
                    (src.Partners != null && src.Partners.Any(p => p.InOnderzoek != null))||
                    src.Verblijfplaats?.InOnderzoek != null)
                {
                    if (dest.Adressering == null) { dest.Adressering = new Adressering(); }

                    dest.Adressering.InOnderzoek = src.AdresseringInOnderzoek();
                }
            })
            .ForMember(dest => dest.DatumEersteInschrijvingGBA, opt => opt.MapFrom(src => src.DatumEersteInschrijvingGBA.Map()))
            .ForMember(dest => dest.GeheimhoudingPersoonsgegevens, opt => opt.MapFrom(src => src.Geheimhouding()))
            .ForMember(dest => dest.Leeftijd, opt =>
            {
                opt.PreCondition(src => src.Overlijden == null);
                opt.MapFrom(src => src.Geboorte.Datum.Map().Leeftijd());
            })
            .ForMember(dest => dest.DatumInschrijvingInGemeente, opt => opt.MapFrom(src => src.DatumInschrijvingInGemeente.Map()))
            .ForMember(dest => dest.GemeenteVanInschrijving, opt =>
            {
                opt.Condition(src => src.GemeenteVanInschrijving?.Code != "0000");
            })
            .ForMember(dest => dest.InOnderzoek, opt => opt.MapFrom(src => src.InOnderzoek()))
            ;
    }
}
