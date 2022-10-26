# language: nl

Functionaliteit: leveren van een datum

  een datum wordt geleverd met een type op basis van de nauwkeurigheid van de waarde

  Rule: een datum krijgt type "Datum" wanneer de laatste twee cijfers in de GBA datum ongelijk zijn aan "00".
        Hierbij geldt dat:
        - de datum wordt geleverd in veld "datum", in full-date formaat als gedefinieerd in RFC 3339, sectie 5.6
        - veld "type" krijgt de waarde "Datum"

    Abstract Scenario: laatste twee cijfers van de GBA datum is ongelijk aan "00"
      Gegeven de persoon met burgerservicenummer '000000103' heeft de volgende 'inschrijving' gegevens
        | naam                                  | waarde      |
        | datum eerste inschrijving GBA (68.10) | <gba datum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000103                       |
        | fields              | datumEersteInschrijvingGBA      |
        Dan heeft de response een persoon met de volgende gegevens
        | naam                                   | waarde         |
        | datumEersteInschrijvingGBA.type        | Datum          |
        | datumEersteInschrijvingGBA.datum       | <datum>        |
        | datumEersteInschrijvingGBA.langFormaat | <lang formaat> |

        Voorbeelden:
        | gba datum | datum      | lang formaat      |
        | 19350110  | 1935-01-10 | 10 januari 1935   |
        | 20200229  | 2020-02-29 | 29 februari 2020  |
        | 20200308  | 2020-03-08 | 8 maart 2020      |
        | 19390401  | 1939-04-01 | 1 april 1939      |
        | 19780914  | 1978-09-14 | 14 september 1978 |
        | 20021102  | 2002-11-02 | 2 november 2002   |

  Rule: een datum krijgt type "JaarMaandDatum" wanneer de laatste twee cijfers in de GBA datum gelijk zijn aan "00".
        Hierbij geldt dat:
        - het jaar, dat staat in de eerste 4 cijfers, wordt geleverd in veld "jaar" als integer (getal)
        - de maand, dat staat in posities 5 en 6, wordt geleverd in veld "maand" als integer (getal)
        - veld "type" krijgt de waarde "JaarMaandDatum"

    Abstract Scenario: laatste twee cijfers van de GBA datum is gelijk aan "00"
      Gegeven de persoon met burgerservicenummer '000000115' heeft de volgende gegevens
        | naam                  | waarde      |
        | geboortedatum (03.10) | <gba datum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000115                       |
        | fields              | geboorte.datum                  |
        Dan heeft de response een persoon met de volgende 'geboorte' gegevens
        | naam              | waarde         |
        | datum.type        | JaarMaandDatum |
        | datum.jaar        | <jaar>         |
        | datum.maand       | <maand>        |
        | datum.langFormaat | <lang formaat> |


        Voorbeelden:
        | gba datum | jaar | maand | lang formaat  |
        | 20200500  | 2020 | 5     | mei 2020      |
        | 20080600  | 2008 | 6     | juni 2008     |
        | 19680700  | 1968 | 7     | juli 1968     |
        | 19720800  | 1972 | 8     | augustus 1972 |
        | 19501000  | 1950 | 10    | oktober 1950  |
        | 19991200  | 1999 | 12    | december 1999 |

  Rule: een datum krijgt type "JaarDatum" wanneer de laatste vier cijfers in de GBA datum gelijk zijn aan "0000".
        Hierbij geldt dat:
        - het jaar, dat staat in de eerste 4 cijfers, wordt geleverd in veld "jaar" als integer (getal)
        - veld "type" krijgt de waarde "JaarDatum"

    Scenario: laatste vier cijfers van de GBA datum is gelijk aan "0000"
      Gegeven de persoon met burgerservicenummer '000000127' heeft een ouder '1' met de volgende gegevens
        | naam                                               | waarde   |
        | datum ingang familierechtelijke betrekking (62.10) | 19630000 |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                                         |
        | type                | RaadpleegMetBurgerservicenummer                |
        | burgerservicenummer | 000000127                                      |
        | fields              | ouders.datumIngangFamilierechtelijkeBetrekking |
        Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
        | naam                                                | waarde    |
        | datumIngangFamilierechtelijkeBetrekking.type        | JaarDatum |
        | datumIngangFamilierechtelijkeBetrekking.jaar        | 1963      |
        | datumIngangFamilierechtelijkeBetrekking.langFormaat | 1963      |

  Rule: een datum krijgt type "DatumOnbekend" wanneer de GBA datum gelijk is aan "00000000".
        Hierbij geldt dat:
        - veld "type" krijgt de waarde "DatumOnbekend"
        - veld "onbekend" wordt opgenomen met de boolean waarde true

    Scenario: GBA datum is gelijk aan "00000000"
      Gegeven de persoon met burgerservicenummer '000000139' heeft de volgende 'overlijden' gegevens
        | naam                     | waarde   |
        | datum overlijden (08.10) | 00000000 |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000139                       |
        | fields              | overlijden.datum                |
        Dan heeft de response een persoon met de volgende 'overlijden' gegevens
        | naam              | waarde        |
        | datum.type        | DatumOnbekend |
        | datum.onbekend    | true          |
        | datum.langFormaat | onbekend      |

    Abstract Scenario: <type> in geboortedatum
      Gegeven de persoon met burgerservicenummer '000000140' heeft de volgende gegevens
        | naam                  | waarde     |
        | geboortedatum (03.10) | <GbaDatum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000140                       |
        | fields              | geboorte.datum                  |
        Dan heeft de response een persoon met de volgende 'geboorte' gegevens
        | naam              | waarde        |
        | datum.type        | <type>        |
        | datum.datum       | <datum>       |
        | datum.jaar        | <jaar>        |
        | datum.maand       | <maand>       |
        | datum.onbekend    | <onbekend>    |
        | datum.langFormaat | <langFormaat> |

        Voorbeelden:
        | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     |
        | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         |
        | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   |

    Abstract Scenario: <type> in overlijden.datum
      Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'overlijden' gegevens
        | datum overlijden (08.10) |
        | <GbaDatum>               |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000152                       |
        | fields              | overlijden.datum                |
        Dan heeft de response een persoon met de volgende 'overlijden' gegevens
        | naam               | waarde        |
        | indicatieOverleden | true          |
        | datum.type         | <type>        |
        | datum.datum        | <datum>       |
        | datum.jaar         | <jaar>        |
        | datum.maand        | <maand>       |
        | datum.onbekend     | <onbekend>    |
        | datum.langFormaat  | <langFormaat> |

        Voorbeelden:
        | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     |
        | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         |
        | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   |


    Abstract Scenario: <type> in <groep> <veld>
      Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende '<e2e-tabel>' gegevens
        | naam       | waarde     |
        | <Lo3-naam> | <GbaDatum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000152                       |
        | fields              | <groep>.<veld>                  |
        Dan heeft de response een persoon met de volgende '<groep>' gegevens
        | naam               | waarde        |
        | <veld>.type        | <type>        |
        | <veld>.datum       | <datum>       |
        | <veld>.jaar        | <jaar>        |
        | <veld>.maand       | <maand>       |
        | <veld>.onbekend    | <onbekend>    |
        | <veld>.langFormaat | <langFormaat> |

        Voorbeelden:
        | groep                 | veld                      | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  | Lo3-naam                                         | e2e-tabel      |
        | opschortingBijhouding | datum                     | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 | datum opschorting bijhouding (67.10)             | inschrijving   |
        | verblijfstitel        | datumIngang               | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 | datum ingang verblijfstitel (39.30)              | verblijfstitel |
        | verblijfstitel        | datumEinde                | Datum          | 20300701 | 2030-07-01 |      |       |          | 1 juli 2030  | datum einde verblijfstitel (39.20)               | verblijfstitel |
        | europeesKiesrecht     | einddatumUitsluiting      | Datum          | 20300701 | 2030-07-01 |      |       |          | 1 juli 2030  | einddatum uitsluiting Europees kiesrecht (31.30) | inschrijving   |
        | uitsluitingKiesrecht  | einddatum                 | Datum          | 20300701 | 2030-07-01 |      |       |          | 1 juli 2030  | einddatum uitsluiting kiesrecht (38.20)          | inschrijving   |
        | opschortingBijhouding | datum                     | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | datum opschorting bijhouding (67.10)             | inschrijving   |
        | verblijfstitel        | datumIngang               | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | datum ingang verblijfstitel (39.30)              | verblijfstitel |
        | uitsluitingKiesrecht  | einddatum                 | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | einddatum uitsluiting kiesrecht (38.20)          | inschrijving   |
        | opschortingBijhouding | datum                     | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         | datum opschorting bijhouding (67.10)             | inschrijving   |
        | verblijfstitel        | datumIngang               | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         | datum ingang verblijfstitel (39.30)              | verblijfstitel |
        | europeesKiesrecht     | einddatumUitsluiting      | JaarDatum      | 20300000 |            | 2030 |       |          | 2030         | einddatum uitsluiting Europees kiesrecht (31.30) | inschrijving   |
        | uitsluitingKiesrecht  | einddatum                 | JaarDatum      | 20300000 |            | 2030 |       |          | 2030         | einddatum uitsluiting kiesrecht (38.20)          | inschrijving   |
        | opschortingBijhouding | datum                     | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   | datum opschorting bijhouding (67.10)             | inschrijving   |
        | verblijfstitel        | datumIngang               | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   | datum ingang verblijfstitel (39.30)              | verblijfstitel |
        | verblijfstitel        | datumEinde                | JaarMaandDatum | 20300700 |            | 2030 | 7     |          | juli 2030    | datum einde verblijfstitel (39.20)               | verblijfstitel |
        | europeesKiesrecht     | einddatumUitsluiting      | JaarMaandDatum | 20300700 |            | 2030 | 7     |          | juli 2030    | einddatum uitsluiting Europees kiesrecht (31.30) | inschrijving   |
        | uitsluitingKiesrecht  | einddatum                 | JaarMaandDatum | 20300700 |            | 2030 | 7     |          | juli 2030    | einddatum uitsluiting kiesrecht (38.20)          | inschrijving   |
        | immigratie            | datumVestigingInNederland | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 | datum vestiging in Nederland (14.20)             | verblijfplaats |
        | immigratie            | datumVestigingInNederland | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | datum vestiging in Nederland (14.20)             | verblijfplaats |
        | immigratie            | datumVestigingInNederland | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         | datum vestiging in Nederland (14.20)             | verblijfplaats |
        | immigratie            | datumVestigingInNederland | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   | datum vestiging in Nederland (14.20)             | verblijfplaats |

    Abstract Scenario: <type> in datumInschrijvingInGemeente
      Gegeven de persoon met burgerservicenummer '000000164' heeft de volgende 'verblijfplaats' gegevens
        | datum inschrijving in de gemeente (09.20) |
        | <GbaDatum>                                |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000164                       |
        | fields              | datumInschrijvingInGemeente     |
        Dan heeft de response een persoon met de volgende gegevens
        | naam                                    | waarde        |
        | datumInschrijvingInGemeente.type        | <type>        |
        | datumInschrijvingInGemeente.datum       | <datum>       |
        | datumInschrijvingInGemeente.jaar        | <jaar>        |
        | datumInschrijvingInGemeente.maand       | <maand>       |
        | datumInschrijvingInGemeente.onbekend    | <onbekend>    |
        | datumInschrijvingInGemeente.langFormaat | <langFormaat> |

        Voorbeelden:
        | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     |
        | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         |
        | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   |

    Abstract Scenario: <type> in verblijfplaats datumIngangGeldigheid
      Gegeven de persoon met burgerservicenummer '000000176' heeft de volgende 'verblijfplaats' gegevens
        | naam                            | waarde     |
        | functie adres (10.10)           | W          |
        | datum ingang geldigheid (85.10) | <GbaDatum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                               |
        | type                | RaadpleegMetBurgerservicenummer      |
        | burgerservicenummer | 000000176                            |
        | fields              | verblijfplaats.datumIngangGeldigheid |
        Dan heeft de response een persoon met de volgende 'verblijfplaats' gegevens
        | naam                              | waarde                 |
        | type                              | VerblijfplaatsOnbekend |
        | datumIngangGeldigheid.type        | <type>                 |
        | datumIngangGeldigheid.datum       | <datum>                |
        | datumIngangGeldigheid.jaar        | <jaar>                 |
        | datumIngangGeldigheid.maand       | <maand>                |
        | datumIngangGeldigheid.onbekend    | <onbekend>             |
        | datumIngangGeldigheid.langFormaat | <langFormaat>          |

        Voorbeelden:
        | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     |
        | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         |
        | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   |

    Abstract Scenario: <type> in inOnderzoek datumIngangOnderzoek
      Gegeven de persoon met burgerservicenummer '000000188' heeft de volgende gegevens
        | naam                              | waarde     |
        | aanduiding in onderzoek (83.10)   | 010000     |
        | datum ingang onderzoek (83.20)    | <GbaDatum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                                  |
        | type                | RaadpleegMetBurgerservicenummer         |
        | burgerservicenummer | 000000188                               |
        | fields              | inOnderzoek.datumIngangOnderzoekPersoon |
        Dan heeft de response een persoon met de volgende 'inOnderzoek' gegevens
        | naam                                    | waarde        |
        | datumIngangOnderzoekPersoon.type        | <type>        |
        | datumIngangOnderzoekPersoon.datum       | <datum>       |
        | datumIngangOnderzoekPersoon.jaar        | <jaar>        |
        | datumIngangOnderzoekPersoon.maand       | <maand>       |
        | datumIngangOnderzoekPersoon.onbekend    | <onbekend>    |
        | datumIngangOnderzoekPersoon.langFormaat | <langFormaat> |

        Voorbeelden:
        | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     |
        | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         |
        | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   |

    Abstract Scenario: <type> in datumEersteInschrijvingGBA
      Gegeven de persoon met burgerservicenummer '000000206' heeft de volgende 'inschrijving' gegevens
        | naam                                  | waarde     |
        | datum eerste inschrijving GBA (68.10) | <GbaDatum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                                         |
        | type                | RaadpleegMetBurgerservicenummer                |
        | burgerservicenummer | 000000206                                      |
        | fields              | burgerservicenummer,datumEersteInschrijvingGBA |
        Dan heeft de response een persoon met de volgende gegevens
        | naam                                   | waarde        |
        | burgerservicenummer                    | 000000206     |
        | datumEersteInschrijvingGBA.type        | <type>        |
        | datumEersteInschrijvingGBA.datum       | <datum>       |
        | datumEersteInschrijvingGBA.jaar        | <jaar>        |
        | datumEersteInschrijvingGBA.maand       | <maand>       |
        | datumEersteInschrijvingGBA.onbekend    | <onbekend>    |
        | datumEersteInschrijvingGBA.langFormaat | <langFormaat> |

        Voorbeelden:
        | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     |
        | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         |
        | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   |

    Abstract Scenario: <type> datumIngangFamilierechtelijkeBetrekking van ouders
      Gegeven de persoon met burgerservicenummer '000000218' heeft een ouder '1' met de volgende gegevens
        | naam                                               | waarde     |
        | datum ingang familierechtelijke betrekking (62.10) | <GbaDatum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                                         |
        | type                | RaadpleegMetBurgerservicenummer                |
        | burgerservicenummer | 000000218                                      |
        | fields              | ouders.datumIngangFamilierechtelijkeBetrekking |
        Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
        | naam                                                | waarde        |
        | datumIngangFamilierechtelijkeBetrekking.type        | <type>        |
        | datumIngangFamilierechtelijkeBetrekking.datum       | <datum>       |
        | datumIngangFamilierechtelijkeBetrekking.jaar        | <jaar>        |
        | datumIngangFamilierechtelijkeBetrekking.maand       | <maand>       |
        | datumIngangFamilierechtelijkeBetrekking.onbekend    | <onbekend>    |
        | datumIngangFamilierechtelijkeBetrekking.langFormaat | <langFormaat> |

        Voorbeelden:
        | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     |
        | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         |
        | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   |

    Abstract Scenario: <type> <groep> <veld> van <relatie>
      Gegeven de persoon met burgerservicenummer '000000231' heeft een <relatie> met de volgende gegevens
        | naam       | waarde     |
        | <Lo3-naam> | <GbaDatum> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000231                       |
        | fields              | <field>.<groep>.datum          |
        Dan heeft de response een persoon met een '<danrelatie>' met de volgende '<groep>' gegevens
        | naam              | waarde        |
        | datum.type        | <type>        |
        | datum.datum       | <datum>       |
        | datum.jaar        | <jaar>        |
        | datum.maand       | <maand>       |
        | datum.onbekend    | <onbekend>    |
        | datum.langFormaat | <langFormaat> |

        Voorbeelden:
        | relatie   | danrelatie | field    | groep                       | type           | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  | Lo3-naam              |
        | ouder '1' | ouder      | ouders   | geboorte                    | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 | geboortedatum (03.10) |
        | ouder '1' | ouder      | ouders   | geboorte                    | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | geboortedatum (03.10) |
        | ouder '1' | ouder      | ouders   | geboorte                    | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         | geboortedatum (03.10) |
        | ouder '1' | ouder      | ouders   | geboorte                    | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   | geboortedatum (03.10) |
        | 'partner' | partner    | partners | geboorte                    | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 | geboortedatum (03.10) |
        | 'partner' | partner    | partners | geboorte                    | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | geboortedatum (03.10) |
        | 'partner' | partner    | partners | geboorte                    | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         | geboortedatum (03.10) |
        | 'partner' | partner    | partners | geboorte                    | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   | geboortedatum (03.10) |
        | 'partner' | partner    | partners | aangaanHuwelijkPartnerschap | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
        | 'partner' | partner    | partners | aangaanHuwelijkPartnerschap | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
        | 'partner' | partner    | partners | aangaanHuwelijkPartnerschap | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
        | 'partner' | partner    | partners | aangaanHuwelijkPartnerschap | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   | datum huwelijkssluiting/aangaan geregistreerd partnerschap (06.10) |
        | 'kind'    | kind       | kinderen | geboorte                    | Datum          | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 | geboortedatum (03.10) |
        | 'kind'    | kind       | kinderen | geboorte                    | DatumOnbekend  | 00000000 |            |      |       | true     | onbekend     | geboortedatum (03.10) |
        | 'kind'    | kind       | kinderen | geboorte                    | JaarDatum      | 20200000 |            | 2020 |       |          | 2020         | geboortedatum (03.10) |
        | 'kind'    | kind       | kinderen | geboorte                    | JaarMaandDatum | 20200300 |            | 2020 | 3     |          | maart 2020   | geboortedatum (03.10) |

    Abstract Scenario: <type> inOnderzoek datumIngangOnderzoek van <relatie>
      Gegeven de persoon met burgerservicenummer '000000243' heeft een <relatie> met de volgende gegevens
        | naam                            | waarde                   |
        | aanduiding in onderzoek (83.10) | <GBA InOnderzoek waarde> |
        | datum ingang onderzoek (83.20)  | <GbaDatum>               |
        | burgerservicenummer (01.20)     | 000000255                |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000243                       |
        | fields              | <field>.inOnderzoek             |
        Dan heeft de response een persoon met een '<danrelatie>' met de volgende 'inOnderzoek' gegevens
        | naam                              | waarde        |
        | burgerservicenummer               | true          |
        | datumIngangOnderzoek.type         | <type>        |
        | datumIngangOnderzoek.datum        | <datum>       |
        | datumIngangOnderzoek.jaar         | <jaar>        |
        | datumIngangOnderzoek.maand        | <maand>       |
        | datumIngangOnderzoek.onbekend     | <onbekend>    |
        | datumIngangOnderzoek.langFormaat  | <langFormaat> |

        Voorbeelden:
        | relatie   | danrelatie | field       | type           | GBA InOnderzoek waarde | GbaDatum | datum      | jaar | maand | onbekend | langFormaat  |
        | ouder '1' | ouder      | ouders      | Datum          | 020120                 | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | ouder '1' | ouder      | ouders      | DatumOnbekend  | 020120                 | 00000000 |            |      |       | true     | onbekend     |
        | ouder '1' | ouder      | ouders      | JaarDatum      | 020120                 | 20200000 |            | 2020 |       |          | 2020         |
        | ouder '1' | ouder      | ouders      | JaarMaandDatum | 020120                 | 20200300 |            | 2020 | 3     |          | maart 2020   |
        | 'partner' | partner    | partners    | Datum          | 050120                 | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | 'partner' | partner    | partners    | DatumOnbekend  | 050120                 | 00000000 |            |      |       | true     | onbekend     |
        | 'partner' | partner    | partners    | JaarDatum      | 050120                 | 20200000 |            | 2020 |       |          | 2020         |
        | 'partner' | partner    | partners    | JaarMaandDatum | 050120                 | 20200300 |            | 2020 | 3     |          | maart 2020   |
        | 'kind'    | kind       | kinderen    | Datum          | 090120                 | 20200308 | 2020-03-08 |      |       |          | 8 maart 2020 |
        | 'kind'    | kind       | kinderen    | DatumOnbekend  | 090120                 | 00000000 |            |      |       | true     | onbekend     |
        | 'kind'    | kind       | kinderen    | JaarDatum      | 090120                 | 20200000 |            | 2020 |       |          | 2020         |
        | 'kind'    | kind       | kinderen    | JaarMaandDatum | 090120                 | 20200300 |            | 2020 | 3     |          | maart 2020   |

  Rule: verblijfplaats datumVan wordt gevuld uit datumAanvangAdreshouding of datumAanvangAdresBuitenland

    Abstract Scenario: datum aanvang adreshouding (10.30) <titel>
      Gegeven de persoon met burgerservicenummer '000000267' heeft de volgende 'verblijfplaats' gegevens
        | naam                               | waarde                     |
        | functie adres (10.10)              | W                          |
        | datum aanvang adreshouding (10.30) | <datumAanvangAdreshouding> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000267                       |
        | fields              | verblijfplaats.datumVan         |
        Dan heeft de response een persoon met de volgende 'verblijfplaats' gegevens
        | naam                 | waarde                 |
        | type                 | VerblijfplaatsOnbekend |
        | datumVan.type        | <type>                 |
        | datumVan.datum       | <datum>                |
        | datumVan.jaar        | <jaar>                 |
        | datumVan.maand       | <maand>                |
        | datumVan.onbekend    | <onbekend>             |
        | datumVan.langFormaat | <langFormaat>          |

        Voorbeelden:
        | titel                | datumAanvangAdreshouding | type           | datum      | jaar | maand | onbekend | langFormaat  |
        | volledig bekend      | 20200308                 | Datum          | 2020-03-08 |      |       |          | 8 maart 2020 |
        | alleen jaar en maand | 20200300                 | JaarMaandDatum |            | 2020 | 3     |          | maart 2020   |
        | alleen jaar          | 20200000                 | JaarDatum      |            | 2020 |       |          | 2020         |
        | volledig onbekend    | 00000000                 | DatumOnbekend  |            |      |       | true     | onbekend     |

    Abstract Scenario: datum aanvang adres buitenland (13.20) <titel>
      Gegeven de persoon met burgerservicenummer '000000279' heeft de volgende 'verblijfplaats' gegevens
        | naam                                   | waarde                        |
        | land (13.10)                           | 0004                          |
        | datum aanvang adres buitenland (13.20) | <datumAanvangAdresBuitenland> |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                          |
        | type                | RaadpleegMetBurgerservicenummer |
        | burgerservicenummer | 000000279                       |
        | fields              | verblijfplaats.datumVan         |
        Dan heeft de response een persoon met de volgende 'verblijfplaats' gegevens
        | naam                 | waarde                   |
        | type                 | VerblijfplaatsBuitenland |
        | datumVan.type        | <type>                   |
        | datumVan.datum       | <datum>                  |
        | datumVan.jaar        | <jaar>                   |
        | datumVan.maand       | <maand>                  |
        | datumVan.onbekend    | <onbekend>               |
        | datumVan.langFormaat | <langFormaat>            |

        Voorbeelden:
        | titel                | datumAanvangAdresBuitenland | type           | datum      | jaar | maand | onbekend | langFormaat  |
        | volledig bekend      | 20200308                    | Datum          | 2020-03-08 |      |       |          | 8 maart 2020 |
        | alleen jaar en maand | 20200300                    | JaarMaandDatum |            | 2020 | 3     |          | maart 2020   |
        | alleen jaar          | 20200000                    | JaarDatum      |            | 2020 |       |          | 2020         |
        | volledig onbekend    | 00000000                    | DatumOnbekend  |            |      |       | true     | onbekend     |
