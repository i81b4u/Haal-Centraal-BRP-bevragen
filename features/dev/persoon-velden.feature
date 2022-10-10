#language: nl

Functionaliteit: Persoon

  Abstract Scenario: persoon heeft veld: '<gba naam>'
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam       | waarde       |
    | <gba naam> | <gba waarde> |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | <naam>                          |
    Dan heeft de response een persoon met de volgende gegevens
    | naam   | waarde   |
    | <naam> | <waarde> |

    Voorbeelden:
    | gba naam                    | naam                  | gba waarde | waarde     |
    | anummer (01.10)             | aNummer               | 1234567890 | 1234567890 |
    | geslachtsaanduiding (04.10) | geslacht.code         | M          | M          |
    | geslachtsaanduiding (04.10) | geslacht.omschrijving | M          | man        |

  Abstract Scenario: persoon heeft veld: '<gba naam>'
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'verblijfplaats' gegevens
    | naam       | waarde       |
    | <gba naam> | <gba waarde> |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | <naam>                          |
    Dan heeft de response een persoon met de volgende gegevens
    | naam   | waarde   |
    | <naam> | <waarde> |

    Voorbeelden:
    | gba naam                          | naam                                 | gba waarde | waarde    |
    | gemeente van inschrijving (09.10) | gemeenteVanInschrijving.code         | 0518       | 0518      |
    | gemeente van inschrijving (09.10) | gemeenteVanInschrijving.omschrijving | 0599       | Rotterdam |

  Abstract Scenario: persoon heeft veld: 'indicatie geheim (70.10)' met waarde <gba waarde>
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'inschrijving' gegevens
    | naam                     | waarde       |
    | indicatie geheim (70.10) | <gba waarde> |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | geheimhoudingPersoonsgegevens   |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                          | waarde   |
    | geheimhoudingPersoonsgegevens | <waarde> |

    Voorbeelden:
    | gba waarde | waarde |
    | 1          | true   |
    | 2          | true   |
    | 3          | true   |
    | 4          | true   |
    | 5          | true   |
    | 6          | true   |
    | 7          | true   |

  Scenario: persoon heeft veld: 'indicatie geheim (70.10)' met waarde 0
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'inschrijving' gegevens
    | naam                     | waarde |
    | indicatie geheim (70.10) | 0      |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | geheimhoudingPersoonsgegevens   |
    Dan heeft de response een leeg persoon object

  Abstract Scenario: persoon heeft datum veld: '<gba naam>'
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'inschrijving' gegevens
    | naam       | waarde       |
    | <gba naam> | <gba waarde> |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | <naam>                          |
    Dan heeft de response een persoon met de volgende gegevens
    | naam               | waarde         |
    | <naam>.type        | Datum          |
    | <naam>.datum       | <waarde>       |
    | <naam>.langFormaat | <lang formaat> |

    Voorbeelden:
    | gba naam                              | gba waarde | naam                       | waarde     | lang formaat |
    | datum eerste inschrijving GBA (68.10) | 20020701   | datumEersteInschrijvingGBA | 2002-07-01 | 1 juli 2002  |

  Abstract Scenario: persoon heeft datum veld: '<gba naam>'
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'verblijfplaats' gegevens
    | naam       | waarde       |
    | <gba naam> | <gba waarde> |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | <naam>                          |
    Dan heeft de response een persoon met de volgende gegevens
    | naam               | waarde         |
    | <naam>.type        | Datum          |
    | <naam>.datum       | <waarde>       |
    | <naam>.langFormaat | <lang formaat> |

    Voorbeelden:
    | gba naam                                  | gba waarde | naam                        | waarde     | lang formaat |
    | datum inschrijving in de gemeente (09.20) | 20020701   | datumInschrijvingInGemeente | 2002-07-01 | 1 juli 2002  |

  Abstract Scenario: veld(en) van persoon is/zijn in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | inOnderzoek                     |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                                                | waarde                             |
    | inOnderzoek.burgerservicenummer                     | <burgerservicenummer in onderzoek> |
    | inOnderzoek.geslacht                                | <geslacht in onderzoek>            |
    | inOnderzoek.leeftijd                                | <leeftijd in onderzoek>            |
    | inOnderzoek.datumIngangOnderzoekPersoon.type        | Datum                              |
    | inOnderzoek.datumIngangOnderzoekPersoon.datum       | 2002-07-01                         |
    | inOnderzoek.datumIngangOnderzoekPersoon.langFormaat | 1 juli 2002                        |

    Voorbeelden:
    | gba in onderzoek waarde | burgerservicenummer in onderzoek | geslacht in onderzoek | leeftijd in onderzoek |
    | 010000                  | true                             | true                  | true                  |
    | 010100                  | true                             |                       |                       |
    | 010120                  | true                             |                       |                       |
    | 010300                  |                                  |                       | true                  |
    | 010310                  |                                  |                       | true                  |
    | 010400                  |                                  | true                  |                       |
    | 010410                  |                                  | true                  |                       |

  Abstract Scenario: naam veld(en) van persoon is/zijn in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    | geslachtsnaam (02.40)           | Groen                     |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | naam                            |
    Dan heeft de response een persoon met de volgende 'naam' gegevens
    | naam                                         | waarde                                      |
    | geslachtsnaam                                | Groen                                       |
    | volledigeNaam                                | Groen                                       |
    | inOnderzoek.voornamen                        | <voornamen in onderzoek>                    |
    | inOnderzoek.adellijkeTitelPredicaat          | <adellijke titel of predicaat in onderzoek> |
    | inOnderzoek.voorvoegsel                      | <voorvoegsel in onderzoek>                  |
    | inOnderzoek.geslachtsnaam                    | <geslachtsnaam in onderzoek>                |
    | inOnderzoek.aanduidingNaamgebruik            | <aanduiding naamgebruik in onderzoek>       |
    | inOnderzoek.voorletters                      | <voorletters in onderzoek>                  |
    | inOnderzoek.volledigeNaam                    | <volledige naam in onderzoek>               |
    | inOnderzoek.datumIngangOnderzoek.type        | Datum                                       |
    | inOnderzoek.datumIngangOnderzoek.datum       | 2002-07-01                                  |
    | inOnderzoek.datumIngangOnderzoek.langFormaat | 1 juli 2002                                 |

    Voorbeelden:
    | gba in onderzoek waarde | voornamen in onderzoek | adellijke titel of predicaat in onderzoek | voorvoegsel in onderzoek | geslachtsnaam in onderzoek | aanduiding naamgebruik in onderzoek | voorletters in onderzoek | volledige naam in onderzoek |
    | 010000                  | true                   | true                                      | true                     | true                       | true                                | true                     | true                        |
    | 010200                  | true                   | true                                      | true                     | true                       |                                     | true                     | true                        |
    | 010210                  | true                   |                                           |                          |                            |                                     | true                     | true                        |
    | 010220                  |                        | true                                      |                          |                            |                                     |                          | true                        |
    | 010230                  |                        |                                           | true                     |                            |                                     |                          | true                        |
    | 010240                  |                        |                                           |                          | true                       |                                     |                          | true                        |
    | 016100                  |                        |                                           |                          |                            | true                                |                          |                             |
    | 016110                  |                        |                                           |                          |                            | true                                |                          |                             |

  Abstract Scenario: geboorte veld(en) van persoon is/zijn in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    | geboortedatum (03.10)           | 19630405                  |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | geboorte                        |
    Dan heeft de response een persoon met de volgende 'geboorte' gegevens
    | naam                                         | waarde                |
    | datum.type                                   | Datum                 |
    | datum.datum                                  | 1963-04-05            |
    | datum.langFormaat                            | 5 april 1963          |
    | inOnderzoek.datum                            | <datum in onderzoek>  |
    | inOnderzoek.plaats                           | <plaats in onderzoek> |
    | inOnderzoek.land                             | <land in onderzoek>   |
    | inOnderzoek.datumIngangOnderzoek.type        | Datum                 |
    | inOnderzoek.datumIngangOnderzoek.datum       | 2002-07-01            |
    | inOnderzoek.datumIngangOnderzoek.langFormaat | 1 juli 2002           |

    Voorbeelden:
    | gba in onderzoek waarde | datum in onderzoek | plaats in onderzoek | land in onderzoek |
    | 010000                  | true               | true                | true              |
    | 010300                  | true               | true                | true              |
    | 010310                  | true               |                     |                   |
    | 010320                  |                    | true                |                   |
    | 010330                  |                    |                     | true              |

  Abstract Scenario: 'gemeente van inschrijving (09.10)' en/of 'datum inschrijving in de gemeente (09.20)' veld(en) van persoon is/zijn in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'verblijfplaats' gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | inOnderzoek                     |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                                                 | waarde                                     |
    | inOnderzoek.gemeenteVanInschrijving                  | <gemeenteVanInschrijving in onderzoek>     |
    | inOnderzoek.datumInschrijvingInGemeente              | <datumInschrijvingInGemeente in onderzoek> |
    | inOnderzoek.datumIngangOnderzoekGemeente.type        | Datum                                      |
    | inOnderzoek.datumIngangOnderzoekGemeente.datum       | 2002-07-01                                 |
    | inOnderzoek.datumIngangOnderzoekGemeente.langFormaat | 1 juli 2002                                |

    Voorbeelden:
    | gba in onderzoek waarde | gemeenteVanInschrijving in onderzoek | datumInschrijvingInGemeente in onderzoek |
    | 080000                  | true                                 | true                                     |
    | 080900                  | true                                 | true                                     |
    | 080910                  | true                                 |                                          |
    | 080920                  |                                      | true                                     |

  Abstract Scenario: 'gemeente van inschrijving (09.10)' en/of 'datum inschrijving in de gemeente (09.20)' veld(en) van persoon is/zijn niet in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'verblijfplaats' gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | inOnderzoek                     |
    Dan heeft de response een leeg persoon object

    Voorbeelden:
    | gba in onderzoek waarde |
    | 081100                  |
    | 081200                  |
    | 081300                  |
    | 081400                  |
    | 088500                  |

  Abstract Scenario: leeftijd bepaling: geboortedatum is een volledig datum
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde  |
    | geboortedatum (03.10) | <datum> |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | leeftijd                        |
    Dan heeft de response een persoon met alleen de volgende gegevens
    | naam     | waarde     |
    | leeftijd | <leeftijd> |

    Voorbeelden:
    | datum              | leeftijd |
    | vandaag - 10 jaar  | 10       |
    | gisteren - 15 jaar | 15       |
    | morgen - 20 jaar   | 19       |

  Scenario: leeftijd bepaling: geboortedatum is een onbekend datum
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde   |
    | geboortedatum (03.10) | 00000000 |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | leeftijd                        |
    Dan heeft de response een persoon zonder gegevens

  Scenario: leeftijd bepaling: maand en dag van geboortedatum is onbekend
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde   |
    | geboortedatum (03.10) | 20000000 |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | leeftijd                        |
    Dan heeft de response een persoon zonder gegevens

  Abstract Scenario: leeftijd bepaling: dag van geboortedatum is onbekend en geboorte maand is niet deze maand
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde          |
    | geboortedatum (03.10) | <geboortedatum> |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | leeftijd                        |
    Dan heeft de response een persoon met alleen de volgende gegevens
    | naam     | waarde     |
    | leeftijd | <leeftijd> |

    Voorbeelden:
    | geboortedatum            | leeftijd |
    | volgende maand - 10 jaar | 9        |
    | vorige maand - 10 jaar   | 10       |

  Abstract Scenario: leeftijd bepaling: dag van geboortedatum is onbekend en geboorte maand is deze maand
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde               |
    | geboortedatum (03.10) | deze maand - 10 jaar |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | leeftijd                        |
    Dan heeft de response een persoon zonder gegevens

  Scenario: leeftijd bepaling: persoon is overleden
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde   |
    | geboortedatum (03.10) | 19830526 |
    En de persoon heeft de volgende 'overlijden' gegevens
    | naam                     | waarde   |
    | datum overlijden (08.10) | 20040319 |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | leeftijd                        |
    Dan heeft de response een persoon zonder gegevens
