#language: nl

Functionaliteit: Persoon

  Abstract Scenario: persoon heeft veld: 'indicatie geheim (70.10)' met waarde <waarde>
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'inschrijving' gegevens
    | naam                     | waarde   |
    | indicatie geheim (70.10) | <waarde> |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | geheimhoudingPersoonsgegevens   |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                          | waarde   |
    | geheimhoudingPersoonsgegevens | <waarde> |

    Voorbeelden:
    | waarde |
    | 1      |
    | 2      |
    | 3      |
    | 4      |
    | 5      |
    | 6      |
    | 7      |

  Scenario: persoon heeft veld: 'indicatie geheim (70.10)' met waarde 0
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'inschrijving' gegevens
    | naam                     | waarde |
    | indicatie geheim (70.10) | 0      |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | geheimhoudingPersoonsgegevens   |
    Dan heeft de response een leeg persoon object

  Abstract Scenario: gemeente van inschrijving is in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'verblijfplaats' gegevens
    | naam                              | waarde                    |
    | gemeente van inschrijving (09.10) | 0518                      |
    | aanduiding in onderzoek (83.10)   | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)    | 20020701                  |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | gemeenteVanInschrijving         |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                                 | waarde        |
    | gemeenteVanInschrijving.code         | 0518          |
    | gemeenteVanInschrijving.omschrijving | 's-Gravenhage |
    En heeft de persoon de volgende 'verblijfplaats' gegevens
    | naam                                      | waarde                    |
    | inOnderzoek.aanduidingGegevensInOnderzoek | <gba in onderzoek waarde> |
    | inOnderzoek.datumIngangOnderzoek          | 20020701                  |

    Voorbeelden:
    | gba in onderzoek waarde |
    | 080000                  |
    | 080900                  |
    | 080910                  |

  Abstract Scenario: datum inschrijving in de gemeente is in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'verblijfplaats' gegevens
    | naam                                      | waarde                    |
    | datum inschrijving in de gemeente (09.20) | 20020101                  |
    | aanduiding in onderzoek (83.10)           | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)            | 20020701                  |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | datumInschrijvingInGemeente     |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                        | waarde   |
    | datumInschrijvingInGemeente | 20020101 |
    En heeft de persoon de volgende 'verblijfplaats' gegevens
    | naam                                      | waarde                    |
    | inOnderzoek.aanduidingGegevensInOnderzoek | <gba in onderzoek waarde> |
    | inOnderzoek.datumIngangOnderzoek          | 20020701                  |

    Voorbeelden:
    | gba in onderzoek waarde |
    | 080000                  |
    | 080900                  |
    | 080920                  |

  Abstract Scenario: geboorte veld(en) van persoon is/zijn in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    | geboortedatum (03.10)           | 19630405                  |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | geboorte.inOnderzoek            |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                                             | waarde                    |
    | persoonInOnderzoek.aanduidingGegevensInOnderzoek | <gba in onderzoek waarde> |
    | persoonInOnderzoek.datumIngangOnderzoek          | 20020701                  |

    Voorbeelden:
    | gba in onderzoek waarde |
    | 010000                  |

  Abstract Scenario: persoon heeft 'overlijden' datum veld: 'datum overlijden (08.10)'
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'overlijden' gegevens
    | naam                     | waarde   |
    | datum overlijden (08.10) | 20020701 |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | <field>                         |
    Dan heeft de response een persoon met de volgende 'overlijden' gegevens
    | naam  | waarde   |
    | datum | 20020701 |

    Voorbeelden:
    | field            |
    | overlijden.datum |

  Abstract Scenario: overlijden veld(en) van persoon is/zijn in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'overlijden' gegevens
    | naam                            | waarde                    |
    | datum overlijden (08.10)        | 19630405                  |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | overlijden.inOnderzoek          |
    Dan heeft de response een persoon met de volgende 'overlijden' gegevens
    | naam                                      | waarde                    |
    | inOnderzoek.aanduidingGegevensInOnderzoek | <gba in onderzoek waarde> |
    | inOnderzoek.datumIngangOnderzoek          | 20020701                  |

    Voorbeelden:
    | gba in onderzoek waarde |
    | 060000                  |

  Abstract Scenario: datum overlijden is in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'overlijden' gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    | datum overlijden (08.10)        | 19630405                  |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | overlijden.datum                |
    Dan heeft de response een persoon met de volgende 'overlijden' gegevens
    | naam                                      | waarde                    |
    | datum                                     | 19630405                  |
    | inOnderzoek.aanduidingGegevensInOnderzoek | <gba in onderzoek waarde> |
    | inOnderzoek.datumIngangOnderzoek          | 20020701                  |

    Voorbeelden:
    | gba in onderzoek waarde |
    | 060000                  |
