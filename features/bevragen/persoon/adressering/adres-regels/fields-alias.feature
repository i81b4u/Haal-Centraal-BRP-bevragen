#language: nl

Functionaliteit: Persoon: adressering velden vragen met fields/fields alias

  Wanneer een consumer van de BRP API niet is geautoriseerd voor het bevragen van de adresregel velden voor een verblijfplaats buitenland
  Dan moet de consumer de adresseringBinnenland fields alias gebruiken om aan te geven dat hij adresregel velden voor een verblijfplaats binnenland vraagt

Rule: de standaard adresregel veld paden kunnen worden gebruikt door een consumer die is geautoriseerd voor het vragen van adresregels horende bij verblijfplaats binnenland (adres, locatie) en verblijfplaats buitenland

  Abstract Scenario: afnemer is geautoriseerd voor 'adressering buitenland' en vraagt <sub titel>
    Gegeven de afnemer met indicatie '000008' is geautoriseerd voor 'adressering' gegevens
    En de persoon met burgerservicenummer '000000097' heeft de volgende 'verblijfplaats' gegevens
    | naam                             | waarde                      |
    | land adres buitenland (13.10)    | 6014                        |
    | regel 1 adres buitenland (13.30) | 1600 Pennsylvania Avenue NW |
    | regel 2 adres buitenland (13.40) | Washington, DC 20500        |
    | regel 3 adres buitenland (13.50) | Selangor                    |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000097                       |
    | fields              | <fields>                        |
    Dan heeft de response een persoon met de volgende 'adressering' gegevens
    | naam              | waarde                       |
    | adresregel1       | 1600 Pennsylvania Avenue NW  |
    | adresregel2       | Washington, DC 20500         |
    | adresregel3       | Selangor                     |
    | land.code         | 6014                         |
    | land.omschrijving | Verenigde Staten van Amerika |

    Voorbeelden:
    | fields                                                                                   | sub titel                                   |
    | adressering                                                                              | de adressering gegevensgroep veld           |
    | adressering.adresregel1,adressering.adresregel2,adressering.adresregel3,adressering.land | alle adresregel velden met hun volledig pad |

  Abstract Scenario: afnemer is geautoriseerd voor 'adressering buitenland' en vraagt het <field> veld van de adressering gegevensgroep
    Gegeven de afnemer met indicatie '000008' is geautoriseerd voor 'adressering' gegevens
    En de persoon met burgerservicenummer '000000097' heeft de volgende 'verblijfplaats' gegevens
    | naam                             | waarde                      |
    | land adres buitenland (13.10)    | 6014                        |
    | regel 1 adres buitenland (13.30) | 1600 Pennsylvania Avenue NW |
    | regel 2 adres buitenland (13.40) | Washington, DC 20500        |
    | regel 3 adres buitenland (13.50) | Selangor                    |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000097                       |
    | fields              | adressering.<field>             |
    Dan heeft de response een persoon met de volgende 'adressering' gegevens
    | naam    | waarde   |
    | <field> | <waarde> |

    Voorbeelden:
    | field       | waarde                      |
    | adresregel1 | 1600 Pennsylvania Avenue NW |
    | adresregel2 | Washington, DC 20500        |
    | adresregel3 | Selangor                    |

  Scenario: afnemer is geautoriseerd voor 'adressering buitenland' en vraagt het land veld van de adressering gegevensgroep
    Gegeven de afnemer met indicatie '000008' is geautoriseerd voor 'adressering' gegevens
    En de persoon met burgerservicenummer '000000097' heeft de volgende 'verblijfplaats' gegevens
    | naam                             | waarde                      |
    | land adres buitenland (13.10)    | 6014                        |
    | regel 1 adres buitenland (13.30) | 1600 Pennsylvania Avenue NW |
    | regel 2 adres buitenland (13.40) | Washington, DC 20500        |
    | regel 3 adres buitenland (13.50) | Selangor                    |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000097                       |
    | fields              | adressering.land                |
    Dan heeft de response een persoon met de volgende 'adressering' gegevens
    | naam              | waarde                       |
    | land.code         | 6014                         |
    | land.omschrijving | Verenigde Staten van Amerika |

Rule: de 'adresseringBinnenland' field alias moet worden gebruikt door een consumer die niet is geautoriseerd voor het vragen van adresregels horende bij verblijfplaats buitenland

  Scenario: afnemer is niet geautoriseerd voor 'adressering buitenland' en vraagt met de fields alias de adresregel velden van een verblijfplaats buitenland
    Gegeven de afnemer met indicatie '000008' is geautoriseerd voor 'adressering binnenland' gegevens
    En de persoon met burgerservicenummer '000000097' heeft de volgende 'verblijfplaats' gegevens
    | naam                             | waarde                      |
    | land adres buitenland (13.10)    | 6014                        |
    | regel 1 adres buitenland (13.30) | 1600 Pennsylvania Avenue NW |
    | regel 2 adres buitenland (13.40) | Washington, DC 20500        |
    | regel 3 adres buitenland (13.50) | Selangor                    |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000097                       |
    | fields              | <fields>                        |
    Dan heeft de response een persoon zonder gegevens

    Voorbeelden:
    | fields                                                              |
    | adresseringBinnenland.adresregel1,adresseringBinnenland.adresregel2 |

  Scenario: afnemer is niet geautoriseerd voor 'adressering buitenland' en vraagt met de fields alias de adresregel velden van een adres
    Gegeven de afnemer met indicatie '000008' is geautoriseerd voor 'adressering binnenland' gegevens
    En de persoon met burgerservicenummer '000000097' heeft de volgende 'verblijfplaats' gegevens
    | naam                  | waarde |
    | functie adres (10.10) | W      |
    En de 'verblijfplaats' heeft de volgende 'adres' gegevens
    | naam                 | waarde          |
    | gemeentecode (92.10) | 0518            |
    | straatnaam (11.10)   | Borgesiusstraat |
    | huisnummer (11.20)   | 103             |
    | postcode (11.60)     | 2497BV          |
    | woonplaats (11.70)   | Scheveningen    |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000097                       |
    | fields              | <fields>                        |
    Dan heeft de response een persoon met de volgende 'adressering' gegevens
    | naam        | waarde                |
    | adresregel1 | Borgesiusstraat 103   |
    | adresregel2 | 2497 BV  SCHEVENINGEN |

    Voorbeelden:
    | fields                                                              |
    | adresseringBinnenland.adresregel1,adresseringBinnenland.adresregel2 |

  Abstract Scenario: afnemer is niet geautoriseerd voor 'adressering buitenland' en vraagt met de fields alias een adresregel veld van een verblijfplaats buitenland
    Gegeven de afnemer met indicatie '000008' is geautoriseerd voor 'adressering binnenland' gegevens
    En de persoon met burgerservicenummer '000000097' heeft de volgende 'verblijfplaats' gegevens
    | naam                             | waarde                      |
    | land adres buitenland (13.10)    | 6014                        |
    | regel 1 adres buitenland (13.30) | 1600 Pennsylvania Avenue NW |
    | regel 2 adres buitenland (13.40) | Washington, DC 20500        |
    | regel 3 adres buitenland (13.50) | Selangor                    |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000097                       |
    | fields              | adresseringBinnenland.<field>   |
    Dan heeft de response een persoon zonder gegevens

    Voorbeelden:
    | field       |
    | adresregel1 |
    | adresregel2 |
