# language: nl

Functionaliteit: volledige naam

Rule: de volledige naam wordt samengesteld door achter elkaar plaatsen van voornamen, voorvoegsels en geslachtsnaam

    Abstract Scenario: volledige naam van persoon
        Gegeven het systeem heeft een persoon met de volgende gegevens
        | burgerservicenummer   |
        | <burgerservicenummer> |
        En de persoon heeft de volgende naam gegevens
        | voornamen (02.10) | adellijke titel of predikaat (02.20) | voorvoegsel (02.30) | geslachtsnaam (02.40) |
        | <voornamen>       |                                      | <voorvoegsel>       | <geslachtsnaam>       |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                     |
        | type                | ZoekMetBurgerservicenummer |
        | burgerservicenummer | <burgerservicenummer>      |
        | fields              | naam.volledigeNaam         |
        Dan bevat de persoon met burgerservicenummer '<burgerservicenummer>' de volgende naam gegevens
        | volledigeNaam   |
        | <volledigeNaam> |

        Voorbeelden:
        | burgerservicenummer | voornamen       | voorvoegsel | geslachtsnaam | volledigeNaam           |
        | 999995078           | Christina Maria |             | Maassen       | Christina Maria Maassen |
        | 999994542           | Gerrit          | den         | Braber        | Gerrit den Braber       |
        | 999994074           |                 |             | Obbadah       | Obbadah                 |

    @skip-verify
    Abstract Scenario: volledige naam van ouder
        Gegeven de persoon met burgerservicenummer "{burgerservicenummer}" heeft de volgende gegevens van ouder 1:
        | voornamen (02.10)                    | {voornamen}               |
        | adellijke titel of predikaat (02.20) | {adellijkeTitelPredikaat} |
        | voorvoegsel (02.30)                  | {voorvoegsel}             |
        | geslachtsnaam (02.40)                | {geslachtsnaam}           |
        Als persoon met burgerservicenummer "{burgerservicenummer}" wordt opgevraagd met fields=ouders.naam.volledigeNaam
        Dan is in het antwoord in de ouder met ouderAanduiding gelijk aan "ouder1" de naam.volledigeNaam gelijk aan "{volledigeNaam}"

        Voorbeelden:
        | burgerservicenummer | voornamen     | adellijkeTitelPredikaat | voorvoegsel | geslachtsnaam | volledigeNaam          |
        | 999991711           | Barbara       |                         |             | Bultenaar     | Barbara Bultenaar      |
        | 999995078           | Karin Monique |                         | du          | Burck         | Karin Monique du Burck |
        | 999992077           |               |                         |             |               |                        |

Rule: een predikaat wordt opgenomen voor de voornamen met de omschrijving horend bij de waarde in tabel 38 en geschreven in kleine letters

    Abstract Scenario: volledige naam van persoon met predikaat
        Gegeven het systeem heeft een persoon met de volgende gegevens
        | burgerservicenummer   |
        | <burgerservicenummer> |
        En de persoon heeft de volgende naam gegevens
        | voornamen (02.10) | adellijke titel of predikaat (02.20) | voorvoegsel (02.30) | geslachtsnaam (02.40) |
        | <voornamen>       | <adellijkeTitelPredikaat>            | <voorvoegsel>       | <geslachtsnaam>       |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                     |
        | type                | ZoekMetBurgerservicenummer |
        | burgerservicenummer | <burgerservicenummer>      |
        | fields              | naam.volledigeNaam         |
        Dan bevat de persoon met burgerservicenummer '<burgerservicenummer>' de volgende naam gegevens
        | volledigeNaam   |
        | <volledigeNaam> |

        Voorbeelden:
        | burgerservicenummer | voornamen            | adellijkeTitelPredikaat | voorvoegsel | geslachtsnaam | volledigeNaam                               |
        | 999994669           | Żáïŀëñøŕ Åłéèç Đëļŧå | JV                      | 'S          | Streeveld     | jonkvrouw Żáïŀëñøŕ Åłéèç Đëļŧå 'S Streeveld |

Rule: een adellijke titel wordt opgenomen tussen de voornamen en het voorvoegsel met de omschrijving horend bij de waarde in tabel 38 en geschreven in kleine letters

    Abstract Scenario: volledige naam van persoon met adellijke titel
        Gegeven het systeem heeft een persoon met de volgende gegevens
        | burgerservicenummer   |
        | <burgerservicenummer> |
        En de persoon heeft de volgende naam gegevens
        | voornamen (02.10) | adellijke titel of predikaat (02.20) | voorvoegsel (02.30) | geslachtsnaam (02.40) |
        | <voornamen>       | <adellijkeTitelPredikaat>            | <voorvoegsel>       | <geslachtsnaam>       |
        Als personen wordt gezocht met de volgende parameters
        | naam                | waarde                     |
        | type                | ZoekMetBurgerservicenummer |
        | burgerservicenummer | <burgerservicenummer>      |
        | fields              | naam.volledigeNaam         |
        Dan bevat de persoon met burgerservicenummer '<burgerservicenummer>' de volgende naam gegevens
        | volledigeNaam   |
        | <volledigeNaam> |

        Voorbeelden:
        | burgerservicenummer | voornamen   | adellijkeTitelPredikaat | voorvoegsel | geslachtsnaam | volledigeNaam                |
        | 999993951           | Carolina    | BS                      | Van         | Naersen       | Carolina barones Van Naersen |
        | 999990160           | Hendrik Jan | R                       | de          | Brink         | Hendrik Jan ridder de Brink  |
