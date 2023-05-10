#language: nl

@gba
Functionaliteit: ZoekMetNaamEnGemeenteVanInschrijving van persoonslijst met opschorting bijhouding

  Rule: Een persoonslijst met reden opschorting bijhouding "W" (wissen) wordt niet geleverd

    Scenario: persoonslijst heeft opschorting bijhouding reden "W"
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      En de persoon heeft de volgende 'inschrijving' gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | 20220829                             | W                                    |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                               |
      | type                    | ZoekMetNaamEnGemeenteVanInschrijving |
      | gemeenteVanInschrijving | 0014                                 |
      | geslachtsnaam           | Maassen                              |
      | voornamen               | Pieter                               |
      | fields                  | burgerservicenummer                  |
      Dan heeft de response 0 personen

    Scenario: persoonslijst heeft opschorting bijhouding reden "W"
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      En de persoon heeft de volgende 'inschrijving' gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | 20220829                             | W                                    |
      En de persoon met burgerservicenummer '000000048' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) | voorvoegsel (02.30) |
      | Maassen               | Pieter            | van                 |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                               |
      | type                    | ZoekMetNaamEnGemeenteVanInschrijving |
      | gemeenteVanInschrijving | 0014                                 |
      | geslachtsnaam           | Maassen                              |
      | voornamen               | Pieter                               |
      | fields                  | burgerservicenummer                  |
      Dan heeft de response 1 persoon
      En heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000048 |

  Rule: Een persoonslijst met reden opschorting bijhouding "F" (fout) wordt niet geleverd

    Scenario: persoonslijst heeft opschorting bijhouding reden "F"
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      En de persoon heeft de volgende 'inschrijving' gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | 20220829                             | F                                    |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                               |
      | type                    | ZoekMetNaamEnGemeenteVanInschrijving |
      | gemeenteVanInschrijving | 0014                                 |
      | geslachtsnaam           | Maassen                              |
      | voornamen               | Pieter                               |
      | fields                  | burgerservicenummer                  |
      Dan heeft de response 0 personen

    Scenario: persoonslijst heeft opschorting bijhouding reden "F"
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      En de persoon heeft de volgende 'inschrijving' gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | 20220829                             | F                                    |
      En de persoon met burgerservicenummer '000000048' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                               |
      | type                    | ZoekMetNaamEnGemeenteVanInschrijving |
      | gemeenteVanInschrijving | 0014                                 |
      | geslachtsnaam           | Maassen                              |
      | voornamen               | Pieter                               |
      | fields                  | burgerservicenummer                  |
      Dan heeft de response 1 persoon
      En heeft de response een persoon met de volgende gegevens
      | naam                | waarde    |
      | burgerservicenummer | 000000048 |

  Rule: Een persoonslijst met reden opschorting bijhouding ongelijk aan "O" (overleden) wordt alleen gevonden bij gebruik van parameter inclusiefOverledenPersonen met waarde true

    Scenario: persoonslijst heeft opschorting bijhouding reden "O" en inclusiefOverledenPersonen wordt niet gebruikt
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      En de persoon heeft de volgende 'inschrijving' gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | 20220829                             | O                                    |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                               |
      | type                    | ZoekMetNaamEnGemeenteVanInschrijving |
      | gemeenteVanInschrijving | 0014                                 |
      | geslachtsnaam           | Maassen                              |
      | voornamen               | Pieter                               |
      | fields                  | burgerservicenummer                  |
      Dan heeft de response 0 personen

    Abstract Scenario: persoonslijst heeft opschorting bijhouding reden "O" en inclusiefOverledenPersonen heeft waarde <inclusiefOverledenPersonen>
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      En de persoon heeft de volgende 'inschrijving' gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | 20220829                             | O                                    |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                       | waarde                               |
      | type                       | ZoekMetNaamEnGemeenteVanInschrijving |
      | gemeenteVanInschrijving    | 0014                                 |
      | geslachtsnaam              | Maassen                              |
      | voornamen                  | Pieter                               |
      | fields                     | burgerservicenummer                  |
      | inclusiefOverledenPersonen | <inclusiefOverledenPersonen>         |
      Dan heeft de response <aantal gevonden personen> persoon

      Voorbeelden:
      | inclusiefOverledenPersonen | aantal gevonden personen |
      | false                      | 0                        |
      | true                       | 1                        |

  Rule: Een persoonslijst met overige reden opschorting bijhouding kan wel worden gevonden en geleverd

    Abstract Scenario: persoonslijst heeft opschorting bijhouding reden "<opschorting>"
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
      | geslachtsnaam (02.40) | voornamen (02.10) |
      | Maassen               | Pieter            |
      En de persoon heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0014                              |
      En de persoon heeft de volgende 'inschrijving' gegevens
      | datum opschorting bijhouding (67.10) | reden opschorting bijhouding (67.20) |
      | 20220829                             | <opschorting>                        |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                               |
      | type                    | ZoekMetNaamEnGemeenteVanInschrijving |
      | gemeenteVanInschrijving | 0014                                 |
      | geslachtsnaam           | Maassen                              |
      | voornamen               | Pieter                               |
      | fields                  | burgerservicenummer                  |
      Dan heeft de response 1 persoon

      Voorbeelden:
      | opschorting | omschrijving              |
      | E           | emigratie                 |
      | M           | ministerieel besluit      |
      | R           | pl is aangelegd in de rni |
      | .           | onbekend                  |