# language: nl

Functionaliteit: in onderzoek
  Wanneer de juistheid van een gegeven onderzocht wordt, en daardoor de waarde van een geleverd gegeven mogelijk onjuist is, wordt naast het betreffende veld ook in inOnderzoek een veld met dezelfde naam opgenomen. Deze krijgt dan de boolean waarde true.

  Een categorie kan in zijn geheel in onderzoek zijn, maar er kunnen ook individuele groepen of elementen binnen de categorie in onderzoek zijn.
  
  Een veld dat niet in onderzoek is, wordt niet in inOnderzoek opgenomen, ook niet met de waarde false of null.

  Een overzicht van de vertaling van een inOnderzoek elementwaarde (gegeven 83.10) naar inOnderzoek velden in het antwoord staat in /features/in onderzoek.xlsx

  Ook wanneer een gegeven geen waarde heeft en daardoor niet in het antwoord opgenomen wordt kan het in onderzoek zijn. In dat geval wordt alleen in inOnderzoek een veld opgenomen met die naam en de waarde true.

  Rule: wanneer een element in de bron in onderzoek is, wordt het gegeven in het antwoord dat daaruit gevuld wordt ook in inOnderzoek opgenomen met de waarde true

    Abstract Scenario: persoon heeft <veld> in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft de volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | <veld>                          |
      Dan heeft de persoon met burgerservicenummer '555550001' de volgende 'inOnderzoek' gegevens
      | naam                 | waarde     |
      | <veld>               | true       |
      | datumIngangOnderzoek | 2022-03-07 |

      Voorbeelden:
      | waarde | veld                    |
      | 010120 | burgerservicenummer     |
      | 010410 | geslachtsaanduiding     |

    Abstract Scenario: persoon heeft <groep> <veld> in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft de volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | <groep>.<veld>                     |
      Dan heeft de persoon met burgerservicenummer '555550001' de volgende '<groep>.inOnderzoek' gegevens
      | naam                 | waarde     |
      | <veld>               | true       |
      | datumIngangOnderzoek | 2022-03-07 |

      Voorbeelden:
      | waarde | veld                      | groep            |
      | 010220 | adellijkeTitelPredicaat   | naam             |
      | 016110 | aanduidingNaamgebruik     | naam             |
      | 010310 | datum                     | geboorte         |

    Abstract Scenario: persoon heeft <veld> van <groep> in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft de volgende '<groep>.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | <groep>.<veld>                  |
      Dan heeft de persoon met burgerservicenummer '555550001' de volgende '<groep>.inOnderzoek' gegevens
      | naam                 | waarde     |
      | <veld>               | true       |
      | datumIngangOnderzoek | 2022-03-07 |

      Voorbeelden:
      | waarde | veld                      | groep            |
      | 081120 | huisnummer                | verblijfplaats   |
      | 081130 | huisletter                | verblijfplaats   |
      | 081140 | huisnummertoevoeging      | verblijfplaats   |
      | 081150 | aanduidingBijHuisnummer   | verblijfplaats   |
      | 081160 | postcode                  | verblijfplaats   |
      | 081170 | woonplaats                | verblijfplaats   |
      | 081210 | locatiebeschrijving       | verblijfplaats   |
      | 081310 | land                      | verblijfplaats   |
      | 081350 | adresregel3               | verblijfplaats   |
      | 103910 | aanduiding                | verblijfstitel   |
      | 113310 | indicatieCurateleRegister | gezagsverhouding |

    Scenario: persoon heeft <veld> van ouder in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft een ouder met de volgende gegevens
      | naam            | waarde |
      | ouderAanduiding | ouder1 |
      En de persoon heeft een ouder met de volgende gegevens
      | naam            | waarde |
      | ouderAanduiding | ouder2 |
      En de ouder met ouderAanduiding '<ouder>' heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      En ouder met ouderAanduiding '<andere ouder>' heeft GEEN 'inOnderzoek' gegevens
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | ouders.<veld>                   |
      Dan heeft de ouder met ouderAanduiding '<ouder>' de volgende 'inOnderzoek' gegevens
      | naam                 | waarde     |
      | <in onderzoek>       | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft de ouder met ouderAanduiding '<andere ouder>' GEEN 'inOnderzoek' gegevens
      En heeft de persoon GEEN 'inOnderzoek' gegevens

      Voorbeelden:
      | waarde | veld                                    | ouder  | andere ouder |
      | 020220 | burgerservicenummer                     | ouder1 | ouder2       |
      | 030410 | geslachtsaanduiding                     | ouder2 | ouder1       |
      | 026210 | datumIngangFamilierechtelijkeBetrekking | ouder1 | ouder2       |

    Abstract Scenario: persoon heeft <groep> <veld> van partner in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft een partner met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550002 |
      En de partner met burgerservicenummer '555550002' heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | partners.<veld>                 |
      Dan heeft de partner met burgerservicenummer '555550002' de volgende '<groep>.inOnderzoek' gegevens
      | naam                 | waarde     |
      | <in onderzoek>       | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft de partner met burgerservicenummer '555550002' GEEN 'inOnderzoek' gegevens

      Voorbeelden:
      | waarde | veld                        | groep    |
      | 050240 | geslachtsnaam               | naam     |
      | 050310 | plaats                      | geboorte |
      | 050610 | aangaanHuwelijkPartnerschap | datum    |


  Rule: wanneer een groep in de bron in onderzoek is, wordt elk gegeven in het antwoord dat gevuld wordt uit een van de elementen in die groep ook in inOnderzoek opgenomen met de waarde true
    - de elementcode voor onderzoek eindigt op 00

    Scenario: persoon heeft hele groep naam in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft de volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 010200   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                                                                                              |
      | type                | RaadpleegMetBurgerservicenummer                                                                                     |
      | burgerservicenummer | 555550001                                                                                                           |
      | fields              | naam.voornamen,naam.adellijkeTitelPredicaat,naam.voorvoegsel,naam.geslachtsnaam,naam.aanduidingNaamgebruik,geboorte |
      Dan heeft de persoon met burgerservicenummer '555550001' alleen de volgende 'naam.inOnderzoek' gegevens
      | naam                    | waarde     |
      | voornamen               | true       |
      | adellijkeTitelPredicaat | true       |
      | voorvoegsel             | true       |
      | geslachtsnaam           | true       |
      | datumIngangOnderzoek    | 2022-03-07 |
      En heeft de persoon GEEN 'inOnderzoek' gegevens
      En heeft de persoon GEEN 'geboorte.inOnderzoek' gegevens

    Scenario: kind heeft hele groep geboorte in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft een kind met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550002 |
      En het kind met burgerservicenummer '555550002' heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 090300   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | kinderen                        |
      Dan heeft het kind met burgerservicenummer '555550002' alleen de volgende 'geboorte.inOnderzoek' gegevens
      | naam                 | waarde     |
      | datum                | true       |
      | plaats               | true       |
      | land                 | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft het kind met burgerservicenummer '555550002' GEEN 'inOnderzoek' gegevens
      En heeft het kind met burgerservicenummer '555550002' GEEN 'naam.inOnderzoek' gegevens
      En heeft de persoon met burgerservicenummer '555550001' GEEN 'inOnderzoek' gegevens
      En heeft de persoon met burgerservicenummer '555550001' GEEN 'geboorte.inOnderzoek' gegevens

    Scenario: partner heeft hele groep soort verbintenis in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft een partner met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550002 |
      En de partner met burgerservicenummer '555550002' heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 051500   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | partners                        |
      Dan heeft de partner met burgerservicenummer '555550002' alleen de volgende 'inOnderzoek' gegevens
      | naam                 | waarde     |
      | soortVerbintenis     | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft de partner met burgerservicenummer '555550002' GEEN 'naam.inOnderzoek' gegevens
      En heeft de partner met burgerservicenummer '555550002' GEEN 'geboorte.inOnderzoek' gegevens
      En heeft de persoon met burgerservicenummer '555550001' GEEN 'inOnderzoek' gegevens

  Rule: wanneer een categorie in de bron in onderzoek is, wordt elk gegeven in het antwoord dat gevuld wordt uit een van de elementen in die categorie ook in inOnderzoek opgenomen met de waarde true
    - de elementcode voor onderzoek eindigt op 0000

    Scenario: hele categorie persoon is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft de volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 010000   |
      | datumIngangOnderzoek          | 20220307 |
      En de persoon heeft GEEN 'verblijfplaats.inOnderzoek' gegevens
      En de persoon heeft een partner met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550002 |
      En de partner met burgerservicenummer '555550002' heeft GEEN 'inOnderzoek' gegevens
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                                                        |
      | type                | RaadpleegMetBurgerservicenummer                                               |
      | burgerservicenummer | 555550001                                                                     |
      | fields              | burgerservicenummer,naam,geboorte,geslachtsaanduiding,verblijfplaats,partners |
      Dan heeft de persoon met burgerservicenummer '555550001' alleen de volgende 'inOnderzoek' gegevens
      | naam                 | waarde     |
      | burgerservicenummer  | true       |
      | geslachtsaanduiding  | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft de persoon met burgerservicenummer '555550001' de volgende 'naam.inOnderzoek' gegevens
      | naam                    | waarde     |
      | voornamen               | true       |
      | adellijkeTitelPredicaat | true       |
      | voorvoegsel             | true       |
      | geslachtsnaam           | true       |
      | aanduidingNaamgebruik   | true       |
      | datumIngangOnderzoek    | 2022-03-07 |
      En heeft de persoon met burgerservicenummer '555550001' de volgende 'geboorte.inOnderzoek' gegevens
      | naam                 | waarde     |
      | datum                | true       |
      | plaats               | true       |
      | land                 | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft de persoon met burgerservicenummer '555550001' GEEN 'verblijfplaats.inOnderzoek' gegevens
      En heeft de partner met burgerservicenummer '555550002' GEEN 'inOnderzoek' gegevens
      En heeft de partner met burgerservicenummer '555550002' GEEN 'naam.inOnderzoek' gegevens
      En heeft de partner met burgerservicenummer '555550002' GEEN 'geboorte.inOnderzoek' gegevens

    Scenario: hele categorie kind is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft GEEN 'inOnderzoek' gegevens
      En de persoon heeft een kind met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550002 |
      En het kind met burgerservicenummer '555550002' heeft de volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 090000   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                                                           |
      | type                | RaadpleegMetBurgerservicenummer                                                  |
      | burgerservicenummer | 555550001                                                                        |
      | fields              | burgerservicenummer,kinderen.burgerservicenummer,kinderen.naam,kinderen.geboorte |
      Dan heeft het kind met burgerservicenummer '555550002' de volgende 'inOnderzoek' gegevens
      | naam                 | waarde     |
      | burgerservicenummer  | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft het kind met burgerservicenummer '555550002' de volgende 'naam.inOnderzoek' gegevens
      | naam                    | waarde     |
      | voornamen               | true       |
      | adellijkeTitelPredicaat | true       |
      | voorvoegsel             | true       |
      | geslachtsnaam           | true       |
      | datumIngangOnderzoek    | 2022-03-07 |
      En heeft het kind met burgerservicenummer '555550002' de volgende 'geboorte.inOnderzoek' gegevens
      | naam                 | waarde     |
      | datum                | true       |
      | plaats               | true       |
      | land                 | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft de persoon met burgerservicenummer '555550001' GEEN 'inOnderzoek' gegevens
      En heeft de persoon met burgerservicenummer '555550001' GEEN 'naam.inOnderzoek' gegevens
      En heeft de persoon met burgerservicenummer '555550001' GEEN 'geboorte.inOnderzoek' gegevens

    Scenario: hele categorie verblijfplaats van een adres is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft GEEN 'inOnderzoek' gegevens
      En persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats' gegevens
      | naam       | waarde |
      | straat     | spui   |
      | huisnummer | 70     |
      En persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 080000   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                             |
      | type                | RaadpleegMetBurgerservicenummer    |
      | burgerservicenummer | 555550001                          |
      | fields              | burgerservicenummer,verblijfplaats |
      Dan heeft het kind met burgerservicenummer '555550002' de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                             | waarde     |
      | aanduidingBijHuisnummer          | true       |
      | datumIngangGeldigheid            | true       |
      | datumInschrijvingInGemeente      | true       |
      | datumVestigingInNederland        | true       |
      | functieAdres                     | true       |
      | gemeenteVanInschrijving          | true       |
      | huisletter                       | true       |
      | huisnummer                       | true       |
      | huisnummertoevoeging             | true       |
      | nummeraanduidingIdentificatie    | true       |
      | adresseerbaarObjectIdentificatie | true       |
      | landVanwaarIngeschreven          | true       |
      | straat                           | true       |
      | postcode                         | true       |
      | korteNaam                        | true       |
      | woonplaats                       | true       |
      | datumIngangOnderzoek             | 2022-03-07 |

    Scenario: hele categorie verblijfplaats van een locatiebeschrijving is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft GEEN 'inOnderzoek' gegevens
      En persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats' gegevens
      | naam                | waarde                     |
      | locatiebeschrijving | Woonboot in de Grote Sloot |
      En persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 080000   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                             |
      | type                | RaadpleegMetBurgerservicenummer    |
      | burgerservicenummer | 555550001                          |
      | fields              | burgerservicenummer,verblijfplaats |
      Dan heeft het kind met burgerservicenummer '555550002' de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                             | waarde     |
      | datumInschrijvingInGemeente      | true       |
      | datumVestigingInNederland        | true       |
      | functieAdres                     | true       |
      | gemeenteVanInschrijving          | true       |
      | landVanwaarIngeschreven          | true       |
      | locatiebeschrijving              | true       |
      | datumIngangOnderzoek             | 2022-03-07 |

    Scenario: hele categorie verblijfplaats van een verblijfplaats buitenland is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft GEEN 'inOnderzoek' gegevens
      En persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats' gegevens
      | naam        | waarde          |
      | land        | 5010            |
      | adresregel1 | Rue du pomme 25 |
      | adresregel2 | Bruxelles       |
      En persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 080000   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                             |
      | type                | RaadpleegMetBurgerservicenummer    |
      | burgerservicenummer | 555550001                          |
      | fields              | burgerservicenummer,verblijfplaats |
      Dan heeft het kind met burgerservicenummer '555550002' de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                        | waarde     |
      | adresregel1                 | true       |
      | adresregel2                 | true       |
      | adresregel3                 | true       |
      | datumInschrijvingInGemeente | true       |
      | gemeenteVanInschrijving     | true       |
      | land                        | true       |
      | datumIngangGeldigheid       | true       |
      | datumIngangOnderzoek        | 2022-03-07 |

  Rule: in onderzoek wordt niet opgenomen wanneer het onderzoek beëindigd is
    - Datum einde onderzoek (83.30) heeft een waarde

    @gba
    Scenario: onderzoek is beëindigd
      Gegeven de persoon met burgerservicenummer 999994888 heeft de volgende persoonsgegevens in de registratie
      | categorie | burgerservicenummer (01.20) | voornamen (02.10) | geboortedatum (03.10) | aanduiding in onderzoek (83.10) | datum ingang onderzoek (83.20) | datum einde onderzoek (83.30) |
      | 1         | 999994888                   | Arnitta           | 19231213              | 010000                          | 20120920                       | 20120922                      |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                            |
      | type                | RaadpleegMetBurgerservicenummer                   |
      | burgerservicenummer | 999994888                                         |
      | fields              | burgerservicenummer,naam.voornamen,geboorte.datum |
      Dan heeft de persoon met burgerservicenummer '999994888' GEEN 'inOnderzoek' gegevens
      En heeft de persoon met burgerservicenummer '999994888' GEEN 'naam.inOnderzoek' gegevens
      En heeft de persoon met burgerservicenummer '999994888' GEEN 'geboorte.inOnderzoek' gegevens

  Rule: in onderzoek wordt niet opgenomen wanneer het gegeven of de groep die onderzocht wordt niet wordt gevraagd
    Dit is het geval wanneer gegevens in onderzoek zijn die:
    - niet in de resource voorkomen
    - niet gevraagd zijn met fields

    Scenario: persoon heeft EU-persoonsnummer van nationaliteit in onderzoek die niet voorkomt in de resource
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de nationaliteit heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 047310   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 555550001                           |
      | fields              | burgerservicenummer,nationaliteiten |
      Dan heeft de persoon met burgerservicenummer '555550001' GEEN 'inOnderzoek' gegevens
      En heeft de nationaliteit GEEN 'inOnderzoek' gegevens

    Abstract Scenario: persoon heeft <gegeven in onderzoek> in onderzoek dat niet is gevraagd met fields
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | <fields>                        |
      Dan heeft de persoon GEEN 'inOnderzoek' gegevens

      Voorbeelden:
      | waarde | gegeven in onderzoek   | fields                             |
      | 010000 | hele categorie persoon | kinderen                           |
      | 010200 | hele groep naam        | geslachtsaanduiding,geboorte.datum |
      | 010210 | voornamen              | geboorte,naam.geslachtsnaam        |

  
  Rule: een afgeleid gegeven wordt in inOnderzoek opgenomen wanneer ten minste één van de gegevens waaruit het wordt afgeleid in onderzoek staat
  
    Abstract Scenario: leeftijd van de persoon in onderzoek omdat <gegeven in onderzoek> is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | leeftijd                        |
      Dan heeft de persoon met burgerservicenummer '555550001' de volgende 'inOnderzoek' gegevens
      | naam                 | waarde     |
      | leeftijd             | true       |
      | datumIngangOnderzoek | 2022-03-07 |

      Voorbeelden:
      | reden                        | waarde |
      | geboortedatum van de persoon | 010310 |
      | groep geboorte               | 010300 |
      | categorie persoon            | 010000 |

    Abstract Scenario: indicatieOverleden van de persoon in onderzoek omdat <gegeven in onderzoek> is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon heeft volgende 'overlijden' gegevens
      | naam  | waarde   |
      | datum | 20220218 |
      En de persoon heeft volgende 'overlijden.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | overlijden.indicatieOverleden   |
      Dan heeft de persoon met burgerservicenummer '555550001' de volgende 'overlijden.inOnderzoek' gegevens
      | naam                 | waarde     |
      | indicatieOverleden   | true       |
      | datumIngangOnderzoek | 2022-03-07 |

      Voorbeelden:
      | reden                | waarde |
      | datum overlijden     | 060810 |
      | groep overlijden     | 060800 |
      | categorie overlijden | 060000 |

    Abstract Scenario: voorletters van een ouder in onderzoek omdat <gegeven in onderzoek> is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon heeft een ouder met de volgende gegevens
      | naam            | waarde |
      | ouderAanduiding | ouder1 |
      En de persoon heeft een ouder met de volgende gegevens
      | naam            | waarde |
      | ouderAanduiding | ouder2 |
      En de ouder met ouderAanduiding '<ouder>' heeft de volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      En de ouder met ouderAanduiding '<andere ouder>' heeft GEEN 'inOnderzoek' gegevens
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                         |
      | type                | RaadpleegMetBurgerservicenummer                |
      | burgerservicenummer | 555550001                                      |
      | fields              | ouders.ouderAanduiding,ouders.naam.voorletters |
      Dan heeft de ouder met ouderAanduiding '<ouder>' de volgende 'naam.inOnderzoek' gegevens
      | naam                 | waarde     |
      | voorletters          | true       |
      | datumIngangOnderzoek | 2022-03-07 |
      En heeft de ouder met ouderAanduiding '<andere ouder>' GEEN 'naam.inOnderzoek' gegevens
      En heeft de ouder met ouderAanduiding '<ouder>' GEEN 'inOnderzoek' gegevens
      En heeft de ouder met ouderAanduiding '<andere ouder>' GEEN 'inOnderzoek' gegevens
    
      Voorbeelden:
      | gegeven in onderzoek   | waarde | ouder  | andere ouder |
      | voornamen van ouder 1  | 020210 | ouder1 | ouder2       |
      | groep naam van ouder 1 | 020200 | ouder1 | ouder2       |
      | categorie ouder 1      | 020000 | ouder1 | ouder2       |
      | voornamen van ouder 2  | 030210 | ouder2 | ouder1       |
      | groep naam van ouder 2 | 030200 | ouder2 | ouder1       |
      | categorie ouder 2      | 030000 | ouder2 | ouder1       |

    Abstract Scenario: verblijfplaats datumVan in onderzoek omdat <gegeven in onderzoek> is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | naam                                | waarde                        |
      | datumAanvangAdreshouding (10.30)    | <datumAanvangAdreshouding>    |
      | straat (11.10)                      | <straat>                      |
      | huisnummer (11.20)                  | <huisnummer>                  |
      | locatiebeschrijving (12.10)         | <locatiebeschrijving>         |
      | land (13.10)                        | <land>                        |
      | datumAanvangAdresBuitenland (13.20) | <datumAanvangAdresBuitenland> |
      | adresregel1 (13.30)                 | <adresregel1>                 |
      | adresregel2 (13.40)                 | <adresregel2>                 |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | verblijfplaats.datumVan         |
      Dan heeft persoon met burgerservicenummer '555550001' de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                 | waarde     |
      | datumVan             | true       |
      | datumIngangOnderzoek | 2022-03-07 |

      Voorbeelden:
      | gegeven in onderzoek        | waarde | straat | huisnummer | locatiebeschrijving        | datumAanvangAdreshouding | adresregel1     | adresregel2 | land | datumAanvangAdresBuitenland |
      | datumAanvangAdreshouding    | 081030 | Spui   | 70         |                            | 20040701                 |                 |             |      |                             |
      | groep adreshouding          | 081000 | Spui   | 70         |                            | 20040701                 |                 |             |      |                             |
      | categorie verblijfplaats    | 081000 | Spui   | 70         |                            | 20040701                 |                 |             |      |                             |
      | datumAanvangAdreshouding    | 081030 |        |            | Woonboot in de Grote Sloot | 20040701                 |                 |             |      |                             |
      | datumAanvangAdresBuitenland | 081320 |        |            |                            |                          | Rue du pomme 25 | Bruxelles   | 5010 | 20040701                    |
      | verblijf buitenland         | 081320 |        |            |                            |                          | Rue du pomme 25 | Bruxelles   | 5010 | 20040701                    |
      | datumAanvangAdresBuitenland | 081320 |        |            |                            |                          |                 |             | 0000 | 20040701                    |
      
    Scenario: indicatieVestigingVanuitBuitenland in onderzoek omdat landVanWaarIngeschreven is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 081410   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                 |
      | type                | RaadpleegMetBurgerservicenummer        |
      | burgerservicenummer | 555550001                              |
      | fields              | verblijfplaats.indicatieVestigingVanuitBuitenland |
      Dan heeft persoon met burgerservicenummer '555550001' de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                               | waarde     |
      | indicatieVestigingVanuitBuitenland | true       |
      | datumIngangOnderzoek               | 2022-03-07 |

    Abstract Scenario: verblijfplaats adresregel1 en adresregel2 in onderzoek bij <gegeven in onderzoek> is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                                |
      | type                | RaadpleegMetBurgerservicenummer                       |
      | burgerservicenummer | 555550001                                             |
      | fields              | verblijfplaats.adresregel1,verblijfplaats.adresregel2 |
      Dan heeft persoon met burgerservicenummer '555550001' de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                 | waarde        |
      | adresregel1          | <adresregel1> |
      | adresregel2          | <adresregel2> |
      | datumIngangOnderzoek | 2022-03-07    |

      #hier betekent leeg dat het inOnderzoek gegeven niet is opgenomen in het antwoord
      Voorbeelden:
      | gegeven in onderzoek      | waarde | adresregel1 | adresregel2 |
      | straat                    | 081110 | true        |             |
      | huisnummer                | 081120 | true        |             |
      | woonplaats                | 081170 |             | true        |
      | locatiebeschrijving       | 081210 | true        |             |
      | adresregel1               | 081330 | true        |             |
      | groep adres               | 081100 | true        | true        |
      | groep locatiebeschrijving | 081200 | true        | true        |
      | groep verblijf buitenland | 081300 | true        | true        |
      | categorie verblijfplaats  | 080000 |             | true        |

  Rule: onderzoek van gemeenteVanInschrijving (09.10) leidt alleen tot inOnderzoek van woonplaats en adresregel2 wanneer daarin de gemeenteVanInschrijving is gebruikt
    Veld woonplaats wordt gevuld met de omschrijving van gemeenteVanInschrijving wanneer woonplaats (11.70) geen waarde heeft

    Abstract Scenario: verblijfplaats woonplaats en adresregel2 zijn <in onderzoek> in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats' gegevens
      | naam                            | waarde       |
      | gemeenteVanInschrijving (09.10) | 0518         |
      | straat (11.10)                  | Spui         |
      | huisnummer (11.20)              | 70           |
      | woonplaats (11.70)              | <woonplaats> |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | <waarde> |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | verblijfplaats.woonplaats       |
      Dan heeft persoon met burgerservicenummer '555550001' <in onderzoek> 'verblijfplaats.inOnderzoek' gegevens

      Voorbeelden:
      | gegeven in onderzoek    | waarde | woonplaats    | in onderzoek |
      | woonplaatsnaam          | 081170 | 's-Gravenhage | WEL          |
      | woonplaatsnaam          | 081170 |               | WEL          |
      | gemeenteVanInschrijving | 080910 | 's-Gravenhage | GEEN         |
      | gemeenteVanInschrijving | 080910 |               | WEL          |
      | groep adres             | 081100 | 's-Gravenhage | WEL          |
      | groep adres             | 081100 |               | WEL          |
      | groep gemeente          | 080900 | 's-Gravenhage | GEEN         |
      | groep gemeente          | 080900 |               | WEL          |

  Rule: onderzoek van straatnaam (11.10) leidt alleen tot inOnderzoek van straat wanneer daarin de straatnaam is gebruikt
    Veld straat wordt gevuld met straatnaam (11.10) wanneer naamOpenbareRuimte (11.15) geen waarde heeft en straatnaam (11.10) wel een waarde heeft

    Abstract Scenario: verblijfplaats straat is <in onderzoek> in onderzoek omdat <reden>
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550001 |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats' gegevens
      | naam                            | waarde                |
      | gemeenteVanInschrijving (09.10) | 0518                  |
      | straat (11.10)                  | <straat>              |
      | naamOpenbareRuimte (11.15)      | <naamOpenbareRuimte>  |
      | huisnummer (11.20)              | <huisnummer>          |
      | locatiebeschrijving (12.10)     | <locatiebeschrijving> |
      | land (13.10)                    | <land>                |
      | adresregel1 (13.30)             | <adresregel1>         |
      | adresregel2 (13.40)             | <adresregel2>         |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 081110 |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                         |
      | type                | RaadpleegMetBurgerservicenummer                |
      | burgerservicenummer | 555550001                                      |
      | fields              | verblijfplaats.straat,verblijfplaats.korteNaam |
      Dan heeft persoon met burgerservicenummer '555550001' de volgende 'verblijfplaats.inOnderzoek' gegevens
      | naam                 | waarde         |
      | straat               | <in onderzoek> |
      | korteNaam            | true           |
      | datumIngangOnderzoek | 2022-03-07     |

      #hier betekent leeg dat het inOnderzoek gegeven niet is opgenomen in het antwoord
      Voorbeelden:
      | straat | naamOpenbareRuimte | huisnummer | locatiebeschrijving        | adresregel1     | adresregel2 | land | in onderzoek | reden                                             |
      | Spui   |                    | 70         |                            |                 |             |      | true         | naamOpenbareRuimte heeft geen waarde              |
      | Spui   | Spui               | 70         |                            |                 |             |      |              | naamOpenbareRuimte heeft wel een waarde           |
      |        |                    |            | Woonboot in de Grote Sloot |                 |             |      |              | locatiebeschrijving, dus straat heeft geen waarde |
      |        |                    |            |                            | Rue du pomme 25 | Bruxelles   | 5010 |              | verblijf buitenland, dus straat heeft geen waarde |

  Rule: onderzoek van een partnergegeven leidt alleen tot inOnderzoek van een samengesteld naamgegeven wanneer daarin de partnernaam wordt gebruikt
    - naam.aanduidingNaamgebruik is ongelijk aan 'E'
    - een of meerdere van de partner naamgegevens voorvoegsel, adellijkeTitelPredicaat of geslachtsnaam zijn in onderzoek
    - betreft aanhef, aanschrijfwijze en gebruikInLopendeTekst

    Abstract Scenario: samengestelde namen bij <omschrijving>
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon met burgerservicenummer '555550001' heeft de volgende 'naam' gegevens
      | naam                          | waarde                  |
      | voornamen (02.10)             | Piet                    |
      | geslachtsnaam (02.40)         | Groenen                 |
      | aanduidingNaamgebruik (61.10) | <aanduidingNaamgebruik> |
      En de persoon heeft een partner met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 555550002 |
      En de partner met burgerservicenummer '555550002' heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 050200   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                                                      |
      | type                | RaadpleegMetBurgerservicenummer                             |
      | burgerservicenummer | 555550001                                                   |
      | fields              | naam.aanhef,naam.aanschrijfwijze,naam.gebruikInLopendeTekst |
      Dan heeft persoon met burgerservicenummer '555550001' <in onderzoek> 'naam.inOnderzoek' gegevens

      Voorbeelden:
      | omschrijving                                            | waarde | aanduidingNaamgebruik | in onderzoek |
      | partner in onderzoek en gebruik eigen naam              | 050000 | E                     | GEEN         |
      | partner in onderzoek en gebruik partner naam            | 050000 | P                     | WEL          |
      | partner in onderzoek en gebruik partner na eigen naam   | 050000 | N                     | WEL          |
      | partner in onderzoek en gebruik partner voor eigen naam | 050000 | V                     | WEL          |
      | groep naam van partner in onderzoek                     | 050200 | P                     | WEL          |
      | voornamen in onderzoek                                  | 050210 | P                     | GEEN         |
      | voorvoegsel in onderzoek                                | 050210 | P                     | WEL          |
      | adellijkeTitelPredicaat in onderzoek                    | 050210 | P                     | WEL          |
      | geslachtsnaam in onderzoek                              | 050210 | P                     | WEL          |
      | aangaanHuwelijkPartnerschap in onderzoek                | 050600 | P                     | GEEN         |


    Abstract Scenario: hele categorie nationaliteit is in onderzoek
      Gegeven het systeem heeft een persoon met de volgende gegevens
      | naam                        | waarde    |
      | burgerservicenummer         | 555550001 |
      En de persoon heeft een nationaliteit met de volgende gegevens
      | naam                                        | waarde                                |
      | nationaliteit (05.10)                       | <nationaliteit>                       |
      | aanduidingBijzonderNederlanderschap (65.10) | <aanduidingBijzonderNederlanderschap> |
      | datumIngangGeldigheid (85.10)               | <datumIngangGeldigheid>               |
      En de nationaliteit heeft volgende 'inOnderzoek' gegevens
      | naam                          | waarde   |
      | aanduidingGegevensInOnderzoek | 040000   |
      | datumIngangOnderzoek          | 20220307 |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 555550001                       |
      | fields              | nationaliteiten                 |
      Dan heeft de nationalieteit de volgende 'inOnderzoek' gegevens
      | naam                 | waarde     |
      | <in onderzoek>       | true       |
      | redenOpname          | true       |
      | datumIngangOnderzoek | 2022-03-07 |

      Voorbeelden:
      | nationaliteit | aanduidingBijzonderNederlanderschap | datumIngangGeldigheid | in onderzoek  |
      | 0052          |                                     | 19560317              | nationaliteit |
      | 0000          |                                     | 00000000              | nationaliteit |
      |               | V                                   | 19710417              | type          |
      |               | B                                   | 19520831              | type          |