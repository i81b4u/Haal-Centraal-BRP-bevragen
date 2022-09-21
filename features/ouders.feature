# language: nl

@post-assert
Functionaliteit: Ouders van een persoon raadplegen
  Van een persoon kunnen ouders worden geleverd.
  Dit bevat gegevens over de familierechtelijke betrekking plus enkele identificerende eigenschappen van de ouder.

@gba
Rule: De ouder in categorie 2 heeft ouderAanduiding "1" en de ouder in categorie 3 heeft ouderAanduiding "2"

  @gba
  Scenario: Persoon heeft twee ouders
    Gegeven de persoon met burgerservicenummer '000007890' heeft een ouder '1' met de volgende gegevens
    | voornamen (02.10)  |
    | Lisette            |
    En de persoon heeft een ouder '2' met de volgende gegevens
    | voornamen (02.10)  |
    | Guîllaumé          |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                       |
    | type                | RaadpleegMetBurgerservicenummer              |
    | burgerservicenummer | 000007890                                    |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam            | waarde  |
    | ouderAanduiding | 1       |
    | naam.voornamen  | Lisette |
    En heeft de persoon een 'ouder' met de volgende gegevens
    | naam            | waarde    |
    | ouderAanduiding | 2         |
    | naam.voornamen  | Guîllaumé |

@gba
Rule: de actuele gegevens van ouders worden geleverd

  @gba
  Scenario: oudergegevens gecorrigeerd
    Gegeven de persoon met burgerservicenummer '000007891' heeft een ouder '1' met de volgende gegevens
    | voornamen (02.10)  |
    | Chantal            |
    En de persoon heeft een ouder '2' met de volgende gegevens
    | voornamen (02.10)  | indicatie onjuist (84.10) |
    | Christiaan         | O                         |
    En de ouder '2' is gecorrigeerd naar de volgende gegevens
    | voornamen (02.10)  |
    | Mark               |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                       |
    | type                | RaadpleegMetBurgerservicenummer              |
    | burgerservicenummer | 000007891                                    |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam            | waarde  |
    | ouderAanduiding | 1       |
    | naam.voornamen  | Chantal |
    En heeft de persoon een 'ouder' met de volgende gegevens
    | naam            | waarde |
    | ouderAanduiding | 2      |
    | naam.voornamen  | Mark   |

  @gba
  Scenario: geslachtswijziging ouder
    Gegeven de persoon met burgerservicenummer '000007892' heeft een ouder '1' met de volgende gegevens
    | voornamen (02.10) | geslachtsaanduiding (04.10) |
    | Noa               | V                           |
    En de persoon heeft een ouder '2' met de volgende gegevens
    | voornamen (02.10)  | geslachtsaanduiding (04.10) |
    | John               | M                           |
    En de ouder '2' is gecorrigeerd naar de volgende gegevens
    | voornamen (02.10)  | geslachtsaanduiding (04.10) |
    | Johanna            | V                           |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                                       |
    | type                | RaadpleegMetBurgerservicenummer                              |
    | burgerservicenummer | 000007892                                                    |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen,ouders.geslacht |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam                  | waarde |
    | ouderAanduiding       | 1      |
    | geslacht.code         | V      |
    | geslacht.omschrijving | vrouw  |
    | naam.voornamen        | Noa    |
    En heeft de persoon een 'ouder' met de volgende gegevens
    | naam                  | waarde  |
    | ouderAanduiding       | 2       |
    | geslacht.code         | V       |
    | geslacht.omschrijving | vrouw   |
    | naam.voornamen        | Johanna |

  @gba
  Scenario: adoptie
    Gegeven de persoon met burgerservicenummer '000007893' heeft een ouder '1' met de volgende gegevens
    | datum ingang familierechtelijke betrekking (62.10) | indicatie onjuist (84.10) |
	| 00000000                                           | O                         |
    En de ouder '1' is gecorrigeerd naar de volgende gegevens
    | voornamen (02.10) | datum ingang familierechtelijke betrekking (62.10) |
    | Me'Lisa           | 20170106                                           |
    En de ouder '1' is gecorrigeerd naar de volgende gegevens
    | voornamen (02.10) | datum ingang familierechtelijke betrekking (62.10) |
    | Olivia Ghislaine  | 20190317                                           |
    En de persoon heeft een ouder '2' met de volgende gegevens
    | datum ingang familierechtelijke betrekking (62.10) | indicatie onjuist (84.10) |
	| 00000000                                           | O                         |
    En de ouder '2' is gecorrigeerd naar de volgende gegevens
    | voornamen (02.10) | datum ingang familierechtelijke betrekking (62.10) |
    | Kevin             | 20190317                                           |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                                                                      |
    | type                | RaadpleegMetBurgerservicenummer                                                             |
    | burgerservicenummer | 000007893                                                                                   |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen,ouders.datumIngangFamilierechtelijkeBetrekking |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam                                                | waarde           |
	| naam.voornamen                                      | Olivia Ghislaine |
    | ouderAanduiding                                     | 1                |
    | datumIngangFamilierechtelijkeBetrekking.type        | Datum            |
    | datumIngangFamilierechtelijkeBetrekking.datum       | 2019-03-17       |
    | datumIngangFamilierechtelijkeBetrekking.langFormaat | 17 maart 2019    |
    En heeft de persoon een 'ouder' met de volgende gegevens
    | naam                                                | waarde        |
	| naam.voornamen                                      | Kevin         |
    | ouderAanduiding                                     | 2             |
    | datumIngangFamilierechtelijkeBetrekking.type        | Datum         |
    | datumIngangFamilierechtelijkeBetrekking.datum       | 2019-03-17    |
    | datumIngangFamilierechtelijkeBetrekking.langFormaat | 17 maart 2019 |

  @gba
  Scenario: ontkenning gevolgd door erkenning
    Gegeven de persoon met burgerservicenummer '000007894' heeft een ouder '1' met de volgende gegevens
    | voornamen (02.10) | 
    | Chantal           | 
    En de persoon heeft een ouder '2' met de volgende gegevens
    | voornamen (02.10)  | indicatie onjuist (84.10) |
    | Mark               | O                         |
    En de ouder '2' is gecorrigeerd naar de volgende gegevens
    | voornamen (02.10)  | 
    |                    | 
    En de ouder '2' is gecorrigeerd naar de volgende gegevens
    | voornamen (02.10)  | 
    | Wieger             | 
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                       |
    | type                | RaadpleegMetBurgerservicenummer              |
    | burgerservicenummer | 000007894                                    |
    | fields              | ouders.ouderAanduiding,ouders.naam.voornamen |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam            | waarde  |
	| naam.voornamen  | Chantal |
    | ouderAanduiding | 1       |
    En heeft de persoon een 'ouder' met de volgende gegevens
    | naam            | waarde |
	| naam.voornamen  | Wieger |
    | ouderAanduiding | 2      |

@gba
Rule: de geleverde oudergegevens zijn de gegevens zoals die staan op de persoonslijst van de gevraagde persoon
  # Bij het raadplegen van een persoon worden alleen gegevens uit de persoonslijst van de gevraagde persoon gebruikt, en nooit gegevens van de persoonslijst van de ouder

  @gba
  Scenario: De ouder heeft geslachtswijziging ondergaan, maar de gevraagde persoon erkent dit niet
    Gegeven de persoon met burgerservicenummer '000007895' heeft een ouder '1' met de volgende gegevens
    | burgerservicenummer (01.20) | voornamen (02.10) | geslachtsaanduiding (04.10) |
    | 000007896                   | Ellen             | V                           |
    En de persoon heeft een ouder '2' met de volgende gegevens
    | burgerservicenummer (01.20) | voornamen (02.10) | geslachtsaanduiding (04.10) |
    | 000007897                   | Karel             | M                           |
    En de ouder '2' is gecorrigeerd naar de volgende gegevens
    | burgerservicenummer (01.20) | voornamen (02.10) | geslachtsaanduiding (04.10) |
    | 000007897                   | Charlotte         | V                           |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                                                                  |
    | type                | RaadpleegMetBurgerservicenummer                                                         |
    | burgerservicenummer | 000007895                                                                               |
    | fields              | ouders.ouderAanduiding,ouders.burgerservicenummer,ouders.geslacht,ouders.naam.voornamen |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam                  | waarde    |
	| burgerservicenummer   | 000007896 |
    | geslacht.code         | V         |
    | geslacht.omschrijving | vrouw     |
	| naam.voornamen        | Ellen     |
    | ouderAanduiding       | 1         |
    En heeft de persoon een 'ouder' met de volgende gegevens
    | naam                  | waarde    |
	| burgerservicenummer   | 000007897 |
    | geslacht.code         | M         |
    | geslacht.omschrijving | man       |
	| naam.voornamen        | Karel     |
    | ouderAanduiding       | 2         |

@gba
Rule: Wanneer alleen gegevens in groep 81, 82, 83, 84, 85 en/of 86 zijn opgenomen en geen gegevens in groep 1, 2, 3, 4 of 62, dan wordt de ouder niet opgenomen
  Gebruik van de fields parameter heeft geen invloed op het leveren van een ouder

  @gba
  Scenario: vondeling (onbekende ouder met ouderaanduiding "1" en geen ouder met ouderaanduiding "2")
    Gegeven de persoon met burgerservicenummer '000007896' heeft een ouder '1' met de volgende gegevens
    | datum ingang familierechtelijke betrekking (62.10) | geslachtsnaam (02.40) | geslachtsaanduiding (04.10) |
    | 20190614                                           | .                     | V                           |
    En de persoon heeft een ouder '2' met de volgende gegevens
	| aktenummer (81.20) | ingangsdatum geldigheid (85.10) |
	| 2•E0001            | 20160518                        |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000007896                       |
    | fields              | ouders                          |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam                                                | waarde       |
    | ouderAanduiding                                     | 1            |
    | geslacht.code                                       | V            |
    | geslacht.omschrijving                               | vrouw        |
    | datumIngangFamilierechtelijkeBetrekking.type        | Datum        |
    | datumIngangFamilierechtelijkeBetrekking.datum       | 2019-06-14   |
    | datumIngangFamilierechtelijkeBetrekking.langFormaat | 14 juni 2019 |

  @gba
  Scenario: volledig onbekende ouder
    Gegeven de persoon met burgerservicenummer '000007897' heeft een ouder '1' met de volgende gegevens
    | geslachtsnaam (02.40) | datum ingang familierechtelijke betrekking (62.10) |
    | .                     | 00000000                                           |
    En de persoon heeft een ouder '2' met de volgende gegevens
	| aktenummer (81.20) | ingangsdatum geldigheid (85.10) |
	| 2•E0001            | 20160518                        |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000007897                       |
    | fields              | ouders                          |
    Dan heeft de response een persoon met een 'ouder' met de volgende gegevens
    | naam                                                | waarde        |
    | ouderAanduiding                                     | 1             |
    | datumIngangFamilierechtelijkeBetrekking.type        | DatumOnbekend |
    | datumIngangFamilierechtelijkeBetrekking.onbekend    | true          |
    | datumIngangFamilierechtelijkeBetrekking.langFormaat | onbekend      |

  @gba
  Scenario: met fields vragen om gegevens zonder waarde
    Gegeven de persoon met burgerservicenummer '000007898' heeft een ouder '1' met de volgende gegevens
    | geslachtsnaam (02.40) | geslachtsaanduiding (04.10) | datum ingang familierechtelijke betrekking (62.10) |
    | Jansen                | V                           | 20190614                                           |
    En de persoon heeft een ouder '2' met de volgende gegevens
	| aktenummer (81.20) | ingangsdatum geldigheid (85.10) |
	| 2•E0001            | 20160518                        |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                 |
    | type                | RaadpleegMetBurgerservicenummer        |
    | burgerservicenummer | 000007898                              |
    | fields              | ouders.naam.voornamen,ouders.geboorte.datum |
    Dan heeft de response een persoon met een 'ouder' zonder gegevens

@proxy
Rule: Wanneer van de ouder wel gegevens geregistreerd zijn, maar geen van de met fields gevraagde gegevens heeft een waarde, dan wordt er een 'ouders' zonder gegevens geleverd

  @proxy
  Scenario: geen gegevens door fields levert een 'ouders' zonder gegevens
    Gegeven het systeem heeft een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 555550001 |
    En de persoon heeft een 'ouder' met de volgende gegevens
    | naam                                            | waarde   |
    | ouderAanduiding                                 | 1        |
    | geslachtsaanduiding (04.10)                     | V        |
    | datumIngangFamilierechtelijkeBetrekking (62.10) | 20190614 |
    En de 'ouder' heeft alleen de volgende 'naam' gegevens
    | naam                  | waarde            |
    | geslachtsnaam (02.40) | Ibin binti Yalniz |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                                      |
    | type                | RaadpleegMetBurgerservicenummer             |
    | burgerservicenummer | 555550001                                   |
    | fields              | ouders.naam.voornamen,ouders.geboorte.datum |
    Dan heeft de response een persoon met een leeg 'ouder' object
