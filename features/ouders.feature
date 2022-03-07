# language: nl


Functionaliteit: Ouders van een persoon raadplegen
  Van een persoon kunnen ouders worden geleverd.
  Dit bevat gegevens over de familierechtelijke betrekking plus enkele identificerende eigenschappen van de ouder.

Rule: "ouder1" is de ouder in categorie 2 en "ouder2" is de ouder in categorie 3

  @gba
  Scenario: Persoon heeft twee ouders
    Gegeven de persoon met burgerservienummer 999993653 heeft de volgende ouders in de registratie
    | Categorie | Voornamen (02.10)  |
    | 2         | Lisette            |
    | 3         | Guîllaumé          |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                       |
    | type                | RaadpleegMetBurgerservicenummer              |
    | burgerservicenummer | 999993653                                    |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen |
    Dan heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder1 |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende naam gegevens
    | naam      | waarde  |
    | voornamen | Lisette |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder2 |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende naam gegevens
    | naam      | waarde    |
    | voornamen | Guîllaumé |

Rule: de actuele gegevens van ouders worden geleverd

  @gba
  Scenario: oudergegevens gecorrigeerd
    Gegeven de persoon met burgerservienummer 999996186 heeft de volgende ouders in de registratie
    | Categorie | Voornamen (02.10)  | Onjuist (84.10) |
    | 2         | Chantal            |                 |
    | 3         | Mark               |                 |
    | 53        | Christiaan         | O               |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                       |
    | type                | RaadpleegMetBurgerservicenummer              |
    | burgerservicenummer | 999996186                                    |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen |
    Dan heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder1 |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende naam gegevens
    | naam      | waarde  |
    | voornamen | Chantal |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder2 |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende naam gegevens
    | naam      | waarde    |
    | voornamen | Mark      |

  @gba
  Scenario: geslachtswijziging ouder
    Gegeven de persoon met burgerservienummer 555550001 heeft de volgende ouders in de registratie
    | Categorie | Voornamen (02.10)  | Geslachtsaanduiding (04.10) |
    | 2         | Noa                | V                           |
    | 3         | Johanna            | V                           |
    | 53        | John               | M                           |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                                                  |
    | type                | RaadpleegMetBurgerservicenummer                                         |
    | burgerservicenummer | 555550001                                                               |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen,ouders.geslachtsaanduiding |
    Dan heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder1 |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende naam gegevens
    | naam      | waarde  |
    | voornamen | Noa     |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder2 |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende naam gegevens
    | naam      | waarde    |
    | voornamen | Johanna   |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende geslachtsaanduiding gegevens
    | naam         | waarde |
    | code         | V      |
    | omschrijving | vrouw  |

  @gba
  Scenario: adoptie
    Gegeven de persoon met burgerservienummer 999996629 heeft de volgende ouders in de registratie
    | Categorie | Voornamen (02.10)  | Datum ingang familierechtelijke betrekking (62.10) | Onjuist (84.10) |
    | 2         | Olivia Ghislaine   | 20190317                                           |                 |
    | 52        | Me'Lisa            | 20170106                                           |                 |
    | 52        |                    | 00000000                                           | O               |
    | 3         | Kevin              | 20190317                                           |                 |
    | 53        |                    |                                                    |                 |
    | 53        |                    | 00000000                                           | O               |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                                                                      |
    | type                | RaadpleegMetBurgerservicenummer                                                             |
    | burgerservicenummer | 999996629                                                                                   |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen,ouders.datumIngangFamilierechtelijkeBetrekking |
    Dan heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam                                          | waarde     |
    | type                                          | Ouder      |
    | ouderAanduiding                               | ouder1     |
    | datumIngangFamilierechtelijkeBetrekking.datum | 2019-03-17 |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende naam gegevens
    | naam      | waarde           |
    | voornamen | Olivia Ghislaine |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende gegevens
    | naam                                          | waarde     |
    | type                                          | Ouder      |
    | ouderAanduiding                               | ouder2     |
    | datumIngangFamilierechtelijkeBetrekking.datum | 2019-03-17 |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende naam gegevens
    | naam      | waarde    |
    | voornamen | Kevin     |

  @gba
  Scenario: ontkenning gevolgd door erkenning
    Gegeven de persoon met burgerservienummer 999996162 heeft de volgende ouders in de registratie
    | Categorie | Voornamen (02.10)  | Onjuist (84.10) |
    | 2         | Chantal            |                 |
    | 3         | Wieger             |                 |
    | 53        |                    |                 |
    | 53        | Mark               | O               |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                              |
    | type                | RaadpleegMetBurgerservicenummer                     |
    | burgerservicenummer | 999996162                                           |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen,ouders |
    Dan heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder1 |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende naam gegevens
    | naam      | waarde  |
    | voornamen | Chantal |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende gegevens
    | naam            | waarde |
    | type            | Ouder  |
    | ouderAanduiding | ouder2 |
    En heeft de ouder met ouderAanduiding 'ouder2' de volgende naam gegevens
    | naam      | waarde    |
    | voornamen | Wieger    |

Rule: de geleverde oudergegevens zijn de gegevens zoals die staan op de persoonslijst van de gevraagde persoon
  # Bij het raadplegen van een persoon worden alleen gegevens uit de persoonslijst van de gevraagde persoon gebruikt, en nooit gegevens van de persoonslijst van de ouder

  @gba
  Scenario: De ouder heeft geslachtswijziging ondergaan, maar de gevraagde persoon erkent dit niet
    Gegeven de persoon met burgerservicenummer 555550003 heeft de volgende ouders in de registratie
    | Categorie | Burgerservicenummer (01.20) | Voornamen | Geslachtsaanduiding (04.10) |
    | 2         | 555550004                   | Karel     | M                           |
    | 3         | 555550005                   | Ellen     | V                           |
    En de ouder met burgerservicenummer 555550004 heeft haar geslachtsaanduiding en voornamen gewijzigd zodat de volgende persoonsgegevens in de registratie op haar persoonslijst staan:
    | Categorie | Voornamen | Geslachtsaanduiding (04.10) |
    | 1         | Charlotte | V                           |
    | 51        | Karel     | M                           |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                                                                             |
    | type                | RaadpleegMetBurgerservicenummer                                                                    |
    | burgerservicenummer | 555550003                                                                                          |
    | fields              | ouders.ouderAanduiding,ouders.burgerservicenummer,ouders.geslachtsaanduiding,ouders.naam.voornamen |
    Dan heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam                             | waarde    |
    | ouderAanduiding                  | ouder1    |
    | burgerservicenummer              | 555550004 |
    | geslachtsaanduiding.code         | M         |
    | geslachtsaanduiding.omschrijving | man       |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende naam gegevens
    | naam      | waarde |
    | voornamen | Karel  |

Rule: Wanneer alleen gegevens in groep 81, 82, 83, 84, 85 en/of 86 zijn opgenomen en geen gegevens in groep 1, 2, 3, 4 of 62, dan wordt de ouder niet opgenomen

  @gba
  Scenario: vondeling (onbekende ouder1 en geen ouder2)
    Gegeven de persoon met burgerservienummer 999993008 heeft de volgende ouders in de registratie
    | Categorie | Voornamen (02.10)  | Geslachtsnaam | Geboortedatum (03.10) | Geslachtsaanduiding (04.10) | Datum ingang familierechtelijke betrekking (62.10) |
    | 2         |                    | .             |                       | V                           | 20190614                                           |
    | 3         |                    |               |                       |                             |                                                    |
    En in categorie 3 komt alleen groep 81 en groep 85 voor
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 999993008                       |
    | fields              | ouders                          |
    Dan bevat de persoon alleen ouders met de volgende gegevens
    | naam                                    | waarde   |
    | ouderAanduiding                         | ouder1   |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam                                    | waarde   |
    | type                                    | GbaOuder |
    | ouderAanduiding                         | ouder1   |
    | geslachtsaanduiding.code                | V        |
    | geslachtsaanduiding.omschrijving        | vrouw    |
    | datumIngangFamilierechtelijkeBetrekking | 20190614 |
    En de ouder met ouderAanduiding 'ouder1' heeft GEEN 'geboorte' gegevens
    En heeft de ouder met ouderAanduiding 'ouder1' alleen de volgende naam gegevens
    | naam          | waarde |
    | geslachtsnaam | .      |

  @gba
  Scenario: vondeling (onbekende ouder1 en geen ouder2)
    Gegeven de persoon met burgerservienummer 555550001 heeft de volgende ouders in de registratie
    | Categorie | Voornamen (02.10)  | Geslachtsnaam | Geboortedatum (03.10) | Geslachtsaanduiding (04.10) | Datum ingang familierechtelijke betrekking (62.10) |
    | 2         |                    | .             |                       |                             | 00000000                                           |
    | 3         |                    |               |                       |                             |                                                    |
    En in categorie 3 komt alleen groep 81 en groep 85 voor
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 555550001                       |
    | fields              | ouders                          |
    Dan bevat de persoon alleen ouders met de volgende gegevens
    | naam                                    | waarde   |
    | ouderAanduiding                         | ouder1   |
    En heeft de ouder met ouderAanduiding 'ouder1' de volgende gegevens
    | naam                                    | waarde   |
    | type                                    | GbaOuder |
    | ouderAanduiding                         | ouder1   |
    | datumIngangFamilierechtelijkeBetrekking | 00000000 |
    En de ouder met ouderAanduiding 'ouder1' heeft GEEN 'geslachtsaanduiding' gegevens
    En de ouder met ouderAanduiding 'ouder1' heeft GEEN 'geboorte' gegevens
    En heeft de ouder met ouderAanduiding 'ouder1' alleen de volgende naam gegevens
    | naam          | waarde |
    | geslachtsnaam | .      |

Rule: Wanneer alleen ouderAanduiding en datumIngangFamilierechtelijkeBetrekking een waarde hebben, wordt de ouder geleverd met type "OnbekendOuder" en indicatieOnbekend met waarde true
  Dit geldt wanneer na toepassen van onbekend_waardes.feature er geen enkel gegeven behalve ouderAanduiding en datumIngangFamilierechtelijkeBetrekking is opgenomen voor de ouder

  Wanneer van de ouder wel gegevens geregistreerd zijn, maar geen van de met fields gevraagde gegevens heeft een waarde, dan is het type "Ouder" en wordt indicatieOnbekend NIET opgenomen

  @proxy
  Scenario: vondeling
    Gegeven het systeem heeft een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999993008 |
    En de persoon heeft een ouder met de volgende gegevens
    | naam                                    | waarde   |
    | ouderAanduiding                         | ouder1   |
    | datumIngangFamilierechtelijkeBetrekking | 20190614 |
    En de ouder met ouderAanduiding 'ouder1' heeft alleen de volgende 'naam' gegevens
    | naam          | waarde |
    | geslachtsnaam | .      |
    En de ouder met ouderAanduiding 'ouder1' heeft de volgende 'geslachtsaanduiding' gegevens
    | naam         | waarde |
    | code         | V      |
    | omschrijving | vrouw  |
    En de ouder met ouderAanduiding 'ouder1' heeft GEEN 'geboorte' gegevens
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 999993008                       |
    | fields              | ouders                          |
    Dan heeft de ouder met ouderAanduiding 'ouder1' alleen de volgende gegevens
    | naam                                          | waarde        |
    | type                                          | OnbekendOuder |
    | indicatieOnbekend                             | true          |
    | ouderAanduiding                               | ouder1        |
    | geslachtsaanduiding.code                      | V             |
    | geslachtsaanduiding.omschrijving              | vrouw         |
    | datumIngangFamilierechtelijkeBetrekking.datum | 2019-06-14    |
