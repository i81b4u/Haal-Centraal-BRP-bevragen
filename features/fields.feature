#language: nl

@post-assert
Functionaliteit: Fields
  Als consumer van de BRP API
  Wil ik kunnen aangeven welke gegevens van de gevonden personen ik terug wil krijgen
  Zodat ik alleen de gegevens terug krijg waarvoor ik doelbinding heb

  Achtergrond:
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                                  | waarde     |
      | aNummer (01.10)                       | 5875306514 |
      | burgerservicenummer                   | 999991929  |
      | geslachtsaanduiding (04.10)           | V          |
      | geslacht.omschrijving                 | vrouw      |
      | geheimhoudingPersoonsgegevens (70.10) | 0          |
      | inOnderzoek (83.10)                   |            |
      En de persoon heeft de volgende 'naam' gegevens
      | naam                                 | waarde         |
      | voornamen (02.10)                    | Yvonne Johanna |
      | naam.adellijkeTitelPredicaat (02.20) |                |
      | voorvoegsel (02.30)                  |                |
      | geslachtsnaam (02.40)                | Kierkegaard    |
      | aanduidingNaamgebruik (61.10)        | V              |
      En de persoon heeft de volgende 'geboorte' gegevens
      | naam                | waarde        |
      | datum               | 1956-11-15    |
      | plaats.code         | 0518          |
      | plaats.omschrijving | 's-Gravenhage |
      | land.code           | 6030          |
      | land.omschrijving   | Nederland     |
      En de persoon heeft een partner met de volgende gegevens
      | naam                       | waarde    |
      | burgerservicenummer        | 999992971 |
      | naam.voornamen (02.10)     | Robert    |
      | naam.geslachtsnaam (02.40) | Bronwaßer |
      | geslacht.omschrijving      | man       |
      En de persoon heeft GEEN 'overlijden' gegevens
      En de persoon heeft de volgende 'kiesrecht' gegevens
      | naam                            | waarde |
      | uitgeslotenVanKiesrecht (38.10) | true   |

  Rule: De API levert alleen velden die gevraagd zijn met de fields parameter
    - gebruik van de fields parameter is verplicht
    - een veld wordt gevraagd door de veldnaam op te nemen in fields
    - vraag meerdere velden door de veldnamen door een komma gescheiden op te nemen
    - veldnamen zijn case sensitive
    - een veld in een groep of collectie kan worden gevraagd door het pad met punt gescheiden op te geven
    - alle velden van een groep kunnen worden gevraagd door de veldnaam van de groep in fields op te nemen
    - de volgorde van veldnamen in fields heeft geen invloed op de volgorde van velden in de response
    - wanneer een gevraagd veld geen waarde heeft voor de persoon, wordt het veld niet opgenomen in de response

    Scenario: Gevraagd veld is een 'root' gegeven van de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999991929                       |
      | fields              | burgerservicenummer             |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 999991929 |

    Scenario: Gevraagde velden zijn 'root' gegevens van de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999991929                       |
      | fields              | burgerservicenummer,aNummer     |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                | waarde     |
      | burgerservicenummer | 999991929  |
      | aNummer             | 5875306514 |

    Scenario: Gevraagd veld is een gegeven van een gegevensgroep van de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                            |
      | type                | RaadpleegMetBurgerservicenummer   |
      | burgerservicenummer | 999991929                         |
      | fields              | burgerservicenummer,geslacht.code |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 999991929 |
      | geslacht.code       | V         |

    Scenario: Gevraagd veld is een gegevensgroep van de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999991929                       |
      | fields              | burgerservicenummer,geslacht    |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                  | waarde    |
      | burgerservicenummer   | 999991929 |
      | geslacht.code         | V         |
      | geslacht.omschrijving | vrouw     |

    Scenario: Gevraagde velden zijn gegevens van één gegevengroep van de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                            |
      | type                | RaadpleegMetBurgerservicenummer   |
      | burgerservicenummer | 999991929                         |
      | fields              | naam.geslachtsnaam,naam.voornamen |
      Dan heeft de response een persoon met alleen de volgende 'naam' gegevens
      | naam          | waarde         |
      | voornamen     | Yvonne Johanna |
      | geslachtsnaam | Kierkegaard    |

    Scenario: Gevraagde velden zijn gegevens van meerdere gegevensgroepen van de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                               |
      | type                | RaadpleegMetBurgerservicenummer                      |
      | burgerservicenummer | 999991929                                            |
      | fields              | burgerservicenummer,geslacht.code,naam.geslachtsnaam |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 999991929 |
      | geslacht.code       | V         |
      En heeft de persoon met burgerservicenummer '999991929' alleen de volgende 'naam' gegevens
      | naam          | waarde      |
      | geslachtsnaam | Kierkegaard |

    Scenario: Gevraagd veld is een gegeven van een gegevensgroep collectie van de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                     |
      | type                | RaadpleegMetBurgerservicenummer            |
      | burgerservicenummer | 999991929                                  |
      | fields              | partners.type,partners.burgerservicenummer |
      Dan heeft de response een persoon met alleen de volgende 'partner' gegevens
      | naam                | waarde    |
      | type                | Partner   |
      | burgerservicenummer | 999992971 |

    Abstract Scenario: Gevraagd veld heeft geen waarde voor de persoon
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999991929                       |
      | fields              | burgerservicenummer,<veld>      |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 999991929 |

      Voorbeelden:
      | veld                          | opmerking                                                       |
      | naam.adellijkeTitelPredicaat  |                                                                 |
      | inOnderzoek.geslacht          |                                                                 |
      | geheimhoudingPersoonsgegevens | geheimhoudingPersoonsgegevens wordt niet opgenomen bij waarde 0 |

  Rule: optioneel mag je (het begin van) het pad weglaten wanneer dit uniek verwijst naar 1 veld in de resource
    - wanneer het opgegeven pad exact verwijst naar een veld en tegelijkertijd als deel van een pad verwijst naar een ander veld, wordt alleen het veld met het exacte pad opgenomen in de response
    - wanneer het opgegeven pad niet exact verwijst naar een veld en tegelijkertijd als deel van een pad verwijst naar meerdere ander velden, wordt een foutmelding gegeven
    - wanneer het opgegeven pad verwijst naar een veld en tegelijkertijd naar het gelijknamige veld in inOnderzoek, worden beide velden opgenomen in de response wanneer ze een waarde hebben

    # zie fields-mapping-Persoon.csv (raadpleeg op burgerservicenummer) en fields-mapping-PersoonBeperkt.csv (zoeken) voor een overzicht van alle mogelijke gehele of gedeeltelijke paden voor het aanwijzen van de personen velden:
    #  een fields veld(pad) in de linker kolom wordt vertaald naar het volledig pad in de tweede kolom
    #  wanneer een in fields opgegeven veld(pad) niet voorkomt in de linker kolom, geeft dat een foutmelding

    Abstract Scenario: opgeven <pad> levert het veld
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999991929                       |
      | fields              | burgerservicenummer,<pad>       |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                            | waarde    |
      | burgerservicenummer             | 999991929 |
      | naam.aanduidingNaamgebruik.code | V         |

      Voorbeelden:
      | pad                             |
      | naam.aanduidingNaamgebruik.code |
      | aanduidingNaamgebruik.code      |

    Abstract Scenario: opgegeven pad is volledig pad én deel van pad
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999991929                       |
      | fields              | burgerservicenummer,<pad>       |
      Dan heeft de persoon met burgerservicenummer '999991929' alleen de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 999991929 |
      | <pad>               | <waarde>  |

      Voorbeelden:
      | pad                   | waarde      | opmerking                                                         |
      | geslacht.omschrijving | vrouw       | levert geslacht.omschrijving, niet partners.geslacht.omschrijving |
      | naam.voornamen        | Kierkegaard | levert naam.voornamen, niet partners.naam.voornamen               |

  Rule: Wanneer velden van polymorfe gegevensgroep wordt gevraagd, wordt altijd het 'type' veld van de gegevensgroep terug gegeven
    - wanneer het gegeven geen waarde heeft (ook niet onbekend) wordt de gegevensgroep niet geleverd en dus ook 'type' niet teruggegeven

    Abstract Scenario: Gevraagd veld zit in een polymorfe gegevensgroep
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | naam                             | waarde                |
      | straatnaam (11.10)               | <straat>              |
      | huisnummer (11.20)               | <huisnummer>          |
      | postcode (11.60)                 | <postcode>            |
      | locatiebeschrijving (12.10)      | <locatiebeschrijving> |
      | land.code                        | <land>                |
      | regel 1 adres buitenland (13.30) | <regel1>              |
      | regel 2 adres buitenland (13.40) | <regel2>              |
      | regel 3 adres buitenland (13.50) |                       |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | <burgerservicenummer>               |
      | fields              | verblijfplaats.verblijfadres.regel3 |
      Dan heeft de response een persoon met alleen de volgende 'verblijfplaats' gegevens
      | naam                 | waarde   |
      | type                 | <type>   |

      Voorbeelden:
      | burgerservicenummer | straat    | huisnummer | postcode | locatiebeschrijving        | land | regel1            | regel2       | type                     |
      | 999993653           | Boterdiep | 31         | 3077AW   |                            |      |                   |              | Adres                    |
      | 000009921           |           |            |          | Woonboot in de Grote Sloot |      |                   |              | Locatie                  |
      | 999995121           |           |            |          |                            | 5002 | 14 Rue Camulogene | 75015 Parijs | VerblijfplaatsBuitenland |
      | 999993586           |           |            |          |                            |      |                   |              | VerblijfplaatsOnbekend   |

  Rule: Wanneer een persoon geheimhouding heeft, wordt dit bij elke vraag terug gegeven
    - wanneer geheimhoudingPersoonsgegevens de waarde true heeft (indicatie geheim 07.70.10 heeft een waarde groter dan 0), wordt deze geleverd ook wanneer daar niet om gevraagd is
    - wanneer geheimhoudingPersoonsgegevens de waarde false heeft (indicatie geheim 07.70.10 heeft een waarde gelijk aan 0), wordt deze niet geleverd, ook niet wanneer er specifiek om gevraagd is

    Abstract Scenario: Persoon heeft <titel>
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                                  | waarde                |
      | burgerservicenummer                   | <burgerservicenummer> |
      | geheimhoudingPersoonsgegevens (70.10) | <gba geheimhouding>   |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | <burgerservicenummer>           |
      | fields              | burgerservicenummer             |
      Dan heeft de persoon met burgerservicenummer '<burgerservicenummer>' alleen de volgende gegevens
      | naam                          | waarde                |
      | burgerservicenummer           | <burgerservicenummer> |
      | geheimhoudingPersoonsgegevens | <geheimhouding>       |

      Voorbeelden:
      | burgerservicenummer | titel              | gba geheimhouding | geheimhouding |
      | 999994608           | wel geheimhouding  | 7                 | true          |
      | 999995492           | wel geheimhouding  | 6                 | true          |
      | 999995480           | wel geheimhouding  | 5                 | true          |
      | 555550001           | wel geheimhouding  | 4                 | true          |
      | 999993872           | wel geheimhouding  | 3                 | true          |
      | 999992715           | wel geheimhouding  | 2                 | true          |
      | 999991802           | wel geheimhouding  | 1                 | true          |
      | 999991929           | geen geheimhouding | 0                 |               |

  Rule: Wanneer de bijhouding van een persoon is opgeschort en de reden hiervan is bekend, dan wordt dit bij elke vraag terug gegeven
    - wanneer er een reden opschorting bijhouding is, wordt deze reden geleverd, ook wanneer hier niet om gevraagd is
    - de datum opschorting bijhouding wordt alleen geleverd wanneer daarom gevraagd is met fields

    Scenario: persoon heeft opschorting bijhouding
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 999992077 |
      Gegeven de persoon heeft de volgende 'opschortingBijhouding' gegevens
      | naam               | waarde     |
      | reden.code         | O          |
      | reden.omschrijving | overlijden |
      | datum              | 20151001   |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999992077                       |
      | fields              | burgerservicenummer             |
      Dan heeft de persoon met burgerservicenummer '999992077' alleen de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 999992077 |
      En heeft de persoon met burgerservicenummer '999992077' alleen de volgende 'opschortingBijhouding' gegevens
      | naam               | waarde     |
      | reden.code         | O          |
      | reden.omschrijving | overlijden |

  Rule: Wanneer een specifiek veld van een datum wordt gevraagd, dan worden velden die bij dat datumtype required zijn ook geleverd

    Abstract Scenario: vragen om enkel(e) veld(en) van een datum
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde                |
      | burgerservicenummer | <burgerservicenummer> |
      En de persoon heeft de volgende 'geboorte' gegevens
      | naam  | waarde      |
      | datum | <GBA datum> |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | <burgerservicenummer>           |
      | fields              | <fields>                        |
      Dan heeft de response een persoon met alleen de volgende 'geboorte' gegevens
      | naam              | waarde        |
      | datum.type        | <type>        |
      | datum.datum       | <datum>       |
      | datum.jaar        | <jaar>        |
      | datum.maand       | <maand>       |
      | datum.onbekend    | <onbekend>    |
      | datum.langFormaat | <langFormaat> |

      Voorbeelden:
      | burgerservicenummer | GBA datum | type           | datum      | jaar | maand | onbekend | langFormaat      | fields                                          |
      | 999991929           | 19561115  | Datum          | 1956-11-15 |      |       |          | 15 november 1956 | geboorte.datum                                  |
      | 999991929           | 19561115  | Datum          | 1956-11-15 |      |       |          | 15 november 1956 | geboorte.datum.datum                            |
      | 999991929           | 19561115  | Datum          | 1956-11-15 |      |       |          | 15 november 1956 | geboorte.datum.type                             |
      | 999991929           | 19561115  | Datum          | 1956-11-15 |      |       |          | 15 november 1956 | geboorte.datum.langFormaat                      |
      | 999991929           | 19561115  | Datum          | 1956-11-15 |      |       |          | 15 november 1956 | geboorte.datum.jaar                             |
      | 999991929           | 19561115  | Datum          | 1956-11-15 |      |       |          | 15 november 1956 | geboorte.datum.datum,geboorte.datum.onbekend    |
      | 999992351           | 19780300  | JaarMaandDatum |            | 1978 | 3     |          | maart 1978       | geboorte.datum                                  |
      | 999992351           | 19780300  | JaarMaandDatum |            | 1978 | 3     |          | maart 1978       | geboorte.datum.datum                            |
      | 999992351           | 19780300  | JaarMaandDatum |            | 1978 | 3     |          | maart 1978       | geboorte.datum.jaar                             |
      | 999992351           | 19780300  | JaarMaandDatum |            | 1978 | 3     |          | maart 1978       | geboorte.datum.langFormaat                      |
      | 999992806           | 19680000  | JaarDatum      |            | 1968 |       |          | 1968             | geboorte.datum                                  |
      | 999992806           | 19680000  | JaarDatum      |            | 1968 |       |          | 1968             | geboorte.datum.datum                            |
      | 999992806           | 19680000  | JaarDatum      |            | 1968 |       |          | 1968             | geboorte.datum.maand                            |
      | 999992806           | 19680000  | JaarDatum      |            | 1968 |       |          | 1968             | geboorte.datum.maand,geboorte.datum,langFormaat |
      | 999994220           | 00000000  | DatumOnbekend  |            |      |       | true     | onbekend         | geboorte.datum                                  |
      | 999994220           | 00000000  | DatumOnbekend  |            |      |       | true     | onbekend         | geboorte.datum.datum                            |
      | 999994220           | 00000000  | DatumOnbekend  |            |      |       | true     | onbekend         | geboorte.datum.type                             |
      | 999994220           | 00000000  | DatumOnbekend  |            |      |       | true     | onbekend         | geboorte.datum.langFormaat                      |

    Scenario: vragen om geen enkel veld van een datum levert niet de required velden van die datum
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 999991929                       |
      | fields              | geboorte.plaats                 |
      Dan heeft de response een persoon met alleen de volgende 'geboorte' gegevens
      | naam                | waarde        |
      | plaats.code         | 0518          |
      | plaats.omschrijving | 's-Gravenhage |

  Rule: Wanneer een gevraagd veld in onderzoek is, dan wordt het corresponderende in onderzoek veld altijd terug gegeven
    # Scenario's worden toegevoegd als in onderzoek feature is geïmplementeerd
