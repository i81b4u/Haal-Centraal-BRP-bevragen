#language: nl

Functionaliteit: Persoon: adresregel velden in onderzoek

  Abstract Scenario: '<type>' is in onderzoek en alle adresregel velden worden gevraagd
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'verblijfplaats' gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <aanduiding in onderzoek> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                                                                   |
    | type                | RaadpleegMetBurgerservicenummer                                                          |
    | burgerservicenummer | 000000152                                                                                |
    | fields              | adressering.adresregel1,adressering.adresregel2,adressering.adresregel3,adressering.land |
    Dan heeft de response een persoon met de volgende 'adressering' gegevens
    | naam                                                       | waarde           |
    | inOnderzoek.adresregel1                                    | <adresregel1 io> |
    | inOnderzoek.adresregel2                                    | <adresregel2 io> |
    | inOnderzoek.adresregel3                                    | <adresregel3 io> |
    | inOnderzoek.land                                           | <land io>        |
    | inOnderzoek.datumIngangOnderzoekVerblijfplaats.type        | <datum type>     |
    | inOnderzoek.datumIngangOnderzoekVerblijfplaats.datum       | <datum>          |
    | inOnderzoek.datumIngangOnderzoekVerblijfplaats.langFormaat | <lang formaat>   |

    Voorbeelden:
    | aanduiding in onderzoek | adresregel1 io | adresregel2 io | adresregel3 io | land io | datum type | datum      | lang formaat | type                               |
    | 080000                  | true           | true           | true           | true    | Datum      | 2002-07-01 | 1 juli 2002  | hele categorie verblijfplaats      |
    | 080900                  |                | true           |                |         | Datum      | 2002-07-01 | 1 juli 2002  | hele groep gemeente                |
    | 080910                  |                | true           |                |         | Datum      | 2002-07-01 | 1 juli 2002  | gemeente van inschrijving          |
    | 080920                  |                |                |                |         |            |            |              | datum inschrijving                 |
    | 081000                  |                |                |                |         |            |            |              | hele groep adreshouding            |
    | 081010                  |                |                |                |         |            |            |              | functie adres                      |
    | 081030                  |                |                |                |         |            |            |              | datum aanvang adreshouding         |
    | 081100                  | true           | true           |                |         | Datum      | 2002-07-01 | 1 juli 2002  | hele groep adres                   |
    | 081110                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | straatnaam                         |
    | 081115                  |                |                |                |         |            |            |              | naam openbare ruimte               |
    | 081120                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | huisnummer                         |
    | 081130                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | huisletter                         |
    | 081140                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | huinummertoevoeging                |
    | 081150                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | aanduiding bij huisnummer          |
    | 081160                  |                | true           |                |         | Datum      | 2002-07-01 | 1 juli 2002  | postcode                           |
    | 081170                  |                | true           |                |         | Datum      | 2002-07-01 | 1 juli 2002  | woonplaatsnaam                     |
    | 081180                  |                |                |                |         |            |            |              | identificatiecode verblijfplaats   |
    | 081190                  |                |                |                |         |            |            |              | identificatiecode nummeraanduiding |
    | 081200                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | hele groep locatie                 |
    | 081210                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | locatiebeschrijving                |
    | 081300                  | true           | true           | true           | true    | Datum      | 2002-07-01 | 1 juli 2002  | hele groep adres buitenland        |
    | 081310                  |                |                |                | true    | Datum      | 2002-07-01 | 1 juli 2002  | land adres buitenland              |
    | 081320                  |                |                |                |         |            |            |              | datum aanvang adres buitenland     |
    | 081330                  | true           |                |                |         | Datum      | 2002-07-01 | 1 juli 2002  | regel 1 adres buitenland           |
    | 081340                  |                | true           |                |         | Datum      | 2002-07-01 | 1 juli 2002  | regel 2 adres buitenland           |
    | 081350                  |                |                | true           |         | Datum      | 2002-07-01 | 1 juli 2002  | regel 3 adres buitenland           |
    | 081400                  |                |                |                |         |            |            |              | hele groep immigratie              |
    | 081410                  |                |                |                |         |            |            |              | land vanwaar ingeschreven          |
    | 081420                  |                |                |                |         |            |            |              | datum vestiging in Nederland       |
    | 088500                  |                |                |                |         |            |            |              | hele groep geldigheid              |
    | 088510                  |                |                |                |         |            |            |              | datum ingang geldigheid            |
