﻿using AutoMapper;
using BrpProxy.Mappers;
using HaalCentraal.BrpProxy.Generated;
using HaalCentraal.BrpProxy.Generated.Gba;

namespace BrpProxy.Profiles;

public class NaamProfile : Profile
{
    public NaamProfile()
    {
        CreateMap<GbaNaamBasis, NaamBasis>();

        CreateMap<GbaNaamBasis, NaamGerelateerde>()
            .ForMember(dest => dest.Geslachtsnaam, opt =>
            {
                opt.PreCondition(src => src.Geslachtsnaam != ".");
                opt.MapFrom(src => src.Geslachtsnaam);
            })
            ;

        CreateMap<GbaInOnderzoek, NaamInOnderzoek?>().ConvertUsing<NaamGerelateerdeInOnderzoekConverter>();

        CreateMap<GbaNaamPersoon, NaamPersoon>()
            .ForMember(dest => dest.Geslachtsnaam, opt =>
            {
                opt.PreCondition(src => src.Geslachtsnaam != ".");
                opt.MapFrom(src => src.Geslachtsnaam);
            })
            .ForMember(dest => dest.Voorletters, opt => opt.MapFrom(src => src.Voorletters()))
            .ForMember(dest => dest.VolledigeNaam, opt => opt.MapFrom(src => src.VolledigeNaam(src.Geslacht!)))
            ;

        CreateMap<GbaInOnderzoek, NaamPersoonInOnderzoek?>().ConvertUsing<NaamPersoonInOnderzoekConverter>();
    }
}
