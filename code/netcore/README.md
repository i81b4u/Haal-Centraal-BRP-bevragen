# Org.OpenAPITools - the C# library for the Bevragen Ingeschreven Personen

API voor het bevragen van ingeschreven personen uit de basisregistratie personen (BRP), inclusief de registratie niet-ingezeten (RNI). Met deze API kun je personen zoeken en actuele gegevens over personen, kinderen, partners en ouders raadplegen.

Gegevens die er niet zijn of niet actueel zijn krijg je niet terug. Heeft een persoon bijvoorbeeld geen geldige nationaliteit, en alleen een beëindigd partnerschap, dan krijg je geen gegevens over nationaliteit en partner.

Zie de [Functionele documentatie](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/tree/v1.0.0/features) voor nadere toelichting.


This C# SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0
- SDK version: 1.0.0
- Build package: org.openapitools.codegen.languages.CSharpNetCoreClientCodegen
    For more information, please visit [https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen)

<a name="frameworks-supported"></a>
## Frameworks supported
- .NET Core >=1.0
- .NET Framework >=4.6
- Mono/Xamarin >=vNext

<a name="dependencies"></a>
## Dependencies

- [RestSharp](https://www.nuget.org/packages/RestSharp) - 106.10.1 or later
- [Json.NET](https://www.nuget.org/packages/Newtonsoft.Json/) - 12.0.1 or later
- [JsonSubTypes](https://www.nuget.org/packages/JsonSubTypes/) - 1.5.2 or later
- [System.ComponentModel.Annotations](https://www.nuget.org/packages/System.ComponentModel.Annotations) - 4.5.0 or later

The DLLs included in the package may not be the latest version. We recommend using [NuGet](https://docs.nuget.org/consume/installing-nuget) to obtain the latest version of the packages:
```
Install-Package RestSharp
Install-Package Newtonsoft.Json
Install-Package JsonSubTypes
Install-Package System.ComponentModel.Annotations
```

NOTE: RestSharp versions greater than 105.1.0 have a bug which causes file uploads to fail. See [RestSharp#742](https://github.com/restsharp/RestSharp/issues/742)

<a name="installation"></a>
## Installation
Generate the DLL using your preferred tool (e.g. `dotnet build`)

Then include the DLL (under the `bin` folder) in the C# project, and use the namespaces:
```csharp
using Org.OpenAPITools.Api;
using Org.OpenAPITools.Client;
using Org.OpenAPITools.Model;
```
<a name="getting-started"></a>
## Getting Started

```csharp
using System.Collections.Generic;
using System.Diagnostics;
using Org.OpenAPITools.Api;
using Org.OpenAPITools.Client;
using Org.OpenAPITools.Model;

namespace Example
{
    public class Example
    {
        public static void Main()
        {

            Configuration config = new Configuration();
            config.BasePath = "https://www.haalcentraal.nl/haalcentraal/api/brp";
            var apiInstance = new IngeschrevenPersonenApi(config);
            var expand = expand_example;  // string | Hiermee kun je opgeven welke gerelateerde resources meegeleverd moeten worden, en hun inhoud naar behoefte aanpassen. Hele resources of enkele properties geef je in de expand parameter kommagescheiden op. Properties die je wil ontvangen geef je op met de resource-naam gevolgd door de property naam, met daartussen een punt. In de definitie van het antwoord kun je bij _embedded zien welke gerelateerde resources meegeleverd kunnen worden. Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/expand.feature). (optional) 
            var fields = fields_example;  // string | Hiermee kun je de inhoud van de resource naar behoefte aanpassen door een door komma's gescheiden lijst van property namen op te geven. Bij opgave van niet-bestaande properties wordt een 400 Bad Request teruggegeven. Wanneer de fields parameter niet is opgegeven, worden alle properties met een waarde teruggegeven. Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.1.0/features/fields.feature) (optional) 
            var burgerservicenummer = new List<string>(); // List<string> | Uniek persoonsnummer.  (optional) 
            var geboorteDatum = Thu Sep 24 00:00:00 UTC 1964;  // DateTime? | Je kunt alleen zoeken met een volledig geboortedatum. Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/blob/v1.0.0/features/parametervalidatie.feature)  (optional) 
            var geboortePlaats = Utrecht;  // string | Gemeentenaam of een buitenlandse plaats of een plaatsbepaling, die aangeeft waar de persoon is geboren. **Zoeken met tekstvelden is [case-Insensitive](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/blob/v1.0.0/features/case_insensitive.feature).**  (optional) 
            var geslachtsaanduiding = ;  // GeslachtEnum? | Geeft aan dat de persoon een man of een vrouw is, of dat het geslacht (nog) onbekend is.  (optional) 
            var inclusiefOverledenPersonen = true;  // bool? | Als je ook overleden personen in het antwoord wilt, geef dan de parameter inclusiefOverledenPersonen op met waarde True.  Zie [functionele specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/blob/v1.0.0/features/overleden_personen.feature)  (optional) 
            var naamGeslachtsnaam = Vries;  // string | De (geslachts)naam waarvan de eventueel aanwezige voorvoegsels zijn afgesplitst. **Gebruik van de wildcard is toegestaan. Zie [feature-beschrijving](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.2.0/features/wildcard.feature)** **Zoeken met tekstvelden is [case-Insensitive](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/blob/v1.0.0/features/case_insensitive.feature).**  (optional) 
            var naamVoorvoegsel = de;  // string | Deel van de geslachtsnaam dat vooraf gaat aan de rest van de geslachtsnaam. Het zoeken op het voorvoegsel is [case-Insensitive](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/blob/v1.0.0/features/case_insensitive.feature).**  (optional) 
            var naamVoornamen = Dirk;  // string | De verzameling namen die, gescheiden door spaties, aan de geslachtsnaam voorafgaat. ** Bij deze query-parameter is het gebruik van een [wildcard](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.2.0/features/wildcard.feature) toegestaan in combinatie met minimaal 2 karakters.** **Zoeken met tekstvelden is [case-Insensitive](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/blob/v1.0.0/features/case_insensitive.feature).**  (optional) 
            var verblijfplaatsGemeenteVanInschrijving = 0518;  // string | Een code die aangeeft in welke gemeente de persoon woont, of de laatste gemeente waar de persoon heeft gewoond, of de gemeente waar de persoon voor het eerst is ingeschreven.  (optional) 
            var verblijfplaatsHuisletter = a;  // string | Een toevoeging aan een huisnummer in de vorm van een letter die door de gemeente aan een adresseerbaar object is gegeven.  (optional) 
            var verblijfplaatsHuisnummer = 14;  // int? | Een nummer dat door de gemeente aan een adresseerbaar object is gegeven.  (optional) 
            var verblijfplaatsHuisnummertoevoeging = bis;  // string | Een toevoeging aan een huisnummer of een combinatie van huisnummer en huisletter die door de gemeente aan een adresseerbaar object is gegeven.  (optional) 
            var verblijfplaatsNummeraanduidingIdentificatie = 0518200000366054;  // string | Unieke identificatie van een nummeraanduiding (en het bijbehorende adres) in de BAG.  (optional) 
            var verblijfplaatsStraat = Tulpstraat;  // string | Een naam die door de gemeente aan een openbare ruimte is gegeven. **Gebruik van de wildcard is toegestaan. Zie [feature-beschrijving](https://github.com/VNG-Realisatie/Haal-Centraal-common/blob/v1.2.0/features/wildcard.feature)** **Zoeken met tekstvelden is [case-Insensitive](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/blob/v1.0.0/features/case_insensitive.feature).  (optional) 
            var verblijfplaatsPostcode = 2341SX;  // string | De door PostNL vastgestelde code die bij een bepaalde combinatie van een straatnaam en een huisnummer hoort.  (optional) 

            try
            {
                // Vindt personen
                IngeschrevenPersoonHalCollectie result = apiInstance.GetIngeschrevenPersonen(expand, fields, burgerservicenummer, geboorteDatum, geboortePlaats, geslachtsaanduiding, inclusiefOverledenPersonen, naamGeslachtsnaam, naamVoorvoegsel, naamVoornamen, verblijfplaatsGemeenteVanInschrijving, verblijfplaatsHuisletter, verblijfplaatsHuisnummer, verblijfplaatsHuisnummertoevoeging, verblijfplaatsNummeraanduidingIdentificatie, verblijfplaatsStraat, verblijfplaatsPostcode);
                Debug.WriteLine(result);
            }
            catch (ApiException e)
            {
                Debug.Print("Exception when calling IngeschrevenPersonenApi.GetIngeschrevenPersonen: " + e.Message );
                Debug.Print("Status Code: "+ e.ErrorCode);
                Debug.Print(e.StackTrace);
            }

        }
    }
}
```

<a name="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *https://www.haalcentraal.nl/haalcentraal/api/brp*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*IngeschrevenPersonenApi* | [**GetIngeschrevenPersonen**](docs/IngeschrevenPersonenApi.md#getingeschrevenpersonen) | **GET** /ingeschrevenpersonen | Vindt personen
*IngeschrevenPersonenApi* | [**GetIngeschrevenPersoon**](docs/IngeschrevenPersonenApi.md#getingeschrevenpersoon) | **GET** /ingeschrevenpersonen/{burgerservicenummer} | Raadpleeg een persoon
*IngeschrevenPersonenApi* | [**GetKind**](docs/IngeschrevenPersonenApi.md#getkind) | **GET** /ingeschrevenpersonen/{burgerservicenummer}/kinderen/{id} | Raadpleeg een kind van een persoon
*IngeschrevenPersonenApi* | [**GetKinderen**](docs/IngeschrevenPersonenApi.md#getkinderen) | **GET** /ingeschrevenpersonen/{burgerservicenummer}/kinderen | Levert de kinderen van een persoon
*IngeschrevenPersonenApi* | [**GetOuder**](docs/IngeschrevenPersonenApi.md#getouder) | **GET** /ingeschrevenpersonen/{burgerservicenummer}/ouders/{id} | Raadpleeg een ouder van een persoon
*IngeschrevenPersonenApi* | [**GetOuders**](docs/IngeschrevenPersonenApi.md#getouders) | **GET** /ingeschrevenpersonen/{burgerservicenummer}/ouders | Levert de ouders van een persoon
*IngeschrevenPersonenApi* | [**GetPartner**](docs/IngeschrevenPersonenApi.md#getpartner) | **GET** /ingeschrevenpersonen/{burgerservicenummer}/partners/{id} | Raadpleeg de partner van een persoon
*IngeschrevenPersonenApi* | [**GetPartners**](docs/IngeschrevenPersonenApi.md#getpartners) | **GET** /ingeschrevenpersonen/{burgerservicenummer}/partners | Levert de actuele partners van een persoon


<a name="documentation-for-models"></a>
## Documentation for Models

 - [Model.AanduidingBijHuisnummerEnum](docs/AanduidingBijHuisnummerEnum.md)
 - [Model.AanduidingBijzonderNederlanderschapEnum](docs/AanduidingBijzonderNederlanderschapEnum.md)
 - [Model.AangaanHuwelijkPartnerschap](docs/AangaanHuwelijkPartnerschap.md)
 - [Model.AangaanHuwelijkPartnerschapInOnderzoek](docs/AangaanHuwelijkPartnerschapInOnderzoek.md)
 - [Model.Adres](docs/Adres.md)
 - [Model.BadRequestFoutbericht](docs/BadRequestFoutbericht.md)
 - [Model.BadRequestFoutberichtAllOf](docs/BadRequestFoutberichtAllOf.md)
 - [Model.DatumOnvolledig](docs/DatumOnvolledig.md)
 - [Model.Foutbericht](docs/Foutbericht.md)
 - [Model.Geboorte](docs/Geboorte.md)
 - [Model.GeboorteAllOf](docs/GeboorteAllOf.md)
 - [Model.GeboorteInOnderzoek](docs/GeboorteInOnderzoek.md)
 - [Model.Geboortedatum](docs/Geboortedatum.md)
 - [Model.GeslachtEnum](docs/GeslachtEnum.md)
 - [Model.Gezagsverhouding](docs/Gezagsverhouding.md)
 - [Model.GezagsverhoudingInOnderzoek](docs/GezagsverhoudingInOnderzoek.md)
 - [Model.HalCollectionLinks](docs/HalCollectionLinks.md)
 - [Model.HalLink](docs/HalLink.md)
 - [Model.IndicatieGezagMinderjarigeEnum](docs/IndicatieGezagMinderjarigeEnum.md)
 - [Model.IngeschrevenPersoon](docs/IngeschrevenPersoon.md)
 - [Model.IngeschrevenPersoonEmbedded](docs/IngeschrevenPersoonEmbedded.md)
 - [Model.IngeschrevenPersoonHal](docs/IngeschrevenPersoonHal.md)
 - [Model.IngeschrevenPersoonHalAllOf](docs/IngeschrevenPersoonHalAllOf.md)
 - [Model.IngeschrevenPersoonHalBasis](docs/IngeschrevenPersoonHalBasis.md)
 - [Model.IngeschrevenPersoonHalBasisAllOf](docs/IngeschrevenPersoonHalBasisAllOf.md)
 - [Model.IngeschrevenPersoonHalCollectie](docs/IngeschrevenPersoonHalCollectie.md)
 - [Model.IngeschrevenPersoonHalCollectieEmbedded](docs/IngeschrevenPersoonHalCollectieEmbedded.md)
 - [Model.IngeschrevenPersoonLinks](docs/IngeschrevenPersoonLinks.md)
 - [Model.InvalidParams](docs/InvalidParams.md)
 - [Model.Kiesrecht](docs/Kiesrecht.md)
 - [Model.Kind](docs/Kind.md)
 - [Model.KindHalBasis](docs/KindHalBasis.md)
 - [Model.KindHalBasisAllOf](docs/KindHalBasisAllOf.md)
 - [Model.KindHalCollectie](docs/KindHalCollectie.md)
 - [Model.KindHalCollectieEmbedded](docs/KindHalCollectieEmbedded.md)
 - [Model.KindInOnderzoek](docs/KindInOnderzoek.md)
 - [Model.KindLinks](docs/KindLinks.md)
 - [Model.Naam](docs/Naam.md)
 - [Model.NaamInOnderzoek](docs/NaamInOnderzoek.md)
 - [Model.NaamPersoon](docs/NaamPersoon.md)
 - [Model.NaamPersoonAllOf](docs/NaamPersoonAllOf.md)
 - [Model.NaamgebruikEnum](docs/NaamgebruikEnum.md)
 - [Model.Nationaliteit](docs/Nationaliteit.md)
 - [Model.NationaliteitInOnderzoek](docs/NationaliteitInOnderzoek.md)
 - [Model.OpschortingBijhouding](docs/OpschortingBijhouding.md)
 - [Model.Ouder](docs/Ouder.md)
 - [Model.OuderAanduidingEnum](docs/OuderAanduidingEnum.md)
 - [Model.OuderHalBasis](docs/OuderHalBasis.md)
 - [Model.OuderHalBasisAllOf](docs/OuderHalBasisAllOf.md)
 - [Model.OuderHalCollectie](docs/OuderHalCollectie.md)
 - [Model.OuderHalCollectieEmbedded](docs/OuderHalCollectieEmbedded.md)
 - [Model.OuderInOnderzoek](docs/OuderInOnderzoek.md)
 - [Model.OuderLinks](docs/OuderLinks.md)
 - [Model.Overlijden](docs/Overlijden.md)
 - [Model.OverlijdenInOnderzoek](docs/OverlijdenInOnderzoek.md)
 - [Model.Partner](docs/Partner.md)
 - [Model.PartnerHalBasis](docs/PartnerHalBasis.md)
 - [Model.PartnerHalBasisAllOf](docs/PartnerHalBasisAllOf.md)
 - [Model.PartnerHalCollectie](docs/PartnerHalCollectie.md)
 - [Model.PartnerHalCollectieEmbedded](docs/PartnerHalCollectieEmbedded.md)
 - [Model.PartnerInOnderzoek](docs/PartnerInOnderzoek.md)
 - [Model.PartnerLinks](docs/PartnerLinks.md)
 - [Model.PersoonInOnderzoek](docs/PersoonInOnderzoek.md)
 - [Model.RedenOpschortingBijhoudingEnum](docs/RedenOpschortingBijhoudingEnum.md)
 - [Model.SoortAdresEnum](docs/SoortAdresEnum.md)
 - [Model.SoortVerbintenisEnum](docs/SoortVerbintenisEnum.md)
 - [Model.Verblijfplaats](docs/Verblijfplaats.md)
 - [Model.VerblijfplaatsAllOf](docs/VerblijfplaatsAllOf.md)
 - [Model.VerblijfplaatsInOnderzoek](docs/VerblijfplaatsInOnderzoek.md)
 - [Model.Verblijfstitel](docs/Verblijfstitel.md)
 - [Model.VerblijfstitelInOnderzoek](docs/VerblijfstitelInOnderzoek.md)
 - [Model.Waardetabel](docs/Waardetabel.md)


<a name="documentation-for-authorization"></a>
## Documentation for Authorization

All endpoints do not require authorization.