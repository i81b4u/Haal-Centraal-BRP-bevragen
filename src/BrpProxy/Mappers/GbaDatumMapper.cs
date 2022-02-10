﻿using HaalCentraal.BrpProxy.Generated;
using System.Globalization;
using System.Text.RegularExpressions;

namespace BrpProxy.Mappers;

public static class GbaDatumMapper
{
    private static Regex GbaDatumRegex = new Regex("^(?<jaar>[0-9]{4})(?<maand>[0-9]{2})(?<dag>[0-9]{2})$");

    public static AbstractDatum Map(this GbaDatum datum)
    {
        if (GbaDatumRegex.IsMatch(datum.Datum))
        {
            var match = GbaDatumRegex.Match(datum.Datum);
            var jaar = int.Parse(match.Groups["jaar"].Value, CultureInfo.InvariantCulture);
            var maand = int.Parse(match.Groups["maand"].Value, CultureInfo.InvariantCulture);
            var dag = int.Parse(match.Groups["dag"].Value, CultureInfo.InvariantCulture);

            if (jaar != 0 && maand != 0 && dag != 0)
            {
                return new VolledigDatum { Datum = new DateTime(jaar, maand, dag) };
            }
            if (jaar == 0 && maand == 0 && dag == 0)
            {
                return new OnbekendDatum();
            }
            if (jaar != 0 && maand != 0 && dag == 0)
            {
                return new JaarMaandDatum { Jaar = jaar, Maand = maand };
            }
            if (jaar != 0 && maand == 0 && dag == 0)
            {
                return new JaarDatum { Jaar = jaar };
            }
        }
        return datum;
    }
}
