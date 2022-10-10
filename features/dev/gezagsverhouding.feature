#language: nl

Functionaliteit: Gezagsverhouding

  Abstract Scenario: persoon heeft 'gezagsverhouding' veld: '<gba naam>'
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'gezagsverhouding' gegevens
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
    | gba naam                             | naam                                    | gba waarde | waarde           |
    | indicatie gezag minderjarige (32.10) | indicatieGezagMinderjarige.code         | 12         | 12               |
    | indicatie gezag minderjarige (32.10) | indicatieGezagMinderjarige.omschrijving | 12         | ouder1 en ouder2 |
    | indicatie curateleregister (33.10)   | indicatieCurateleRegister               | 1          | true             |

  Abstract Scenario: 'gezagsverhouding' veld(en) van persoon is/zijn in onderzoek
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende 'gezagsverhouding' gegevens
    | naam                            | waarde                    |
    | aanduiding in onderzoek (83.10) | <gba in onderzoek waarde> |
    | datum ingang onderzoek (83.20)  | 20020701                  |
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | inOnderzoek                     |
    Dan heeft de response een persoon met de volgende gegevens
    | naam                                              | waarde                            |
    | inOnderzoek.indicatieCurateleRegister             | <curateleregister in onderzoek>   |
    | inOnderzoek.indicatieGezagMinderjarige            | <gezag minderjarige in onderzoek> |
    | inOnderzoek.datumIngangOnderzoekGezag.type        | Datum                             |
    | inOnderzoek.datumIngangOnderzoekGezag.datum       | 2002-07-01                        |
    | inOnderzoek.datumIngangOnderzoekGezag.langFormaat | 1 juli 2002                       |

    Voorbeelden:
    | gba in onderzoek waarde | gezag minderjarige in onderzoek | curateleregister in onderzoek |
    | 110000                  | true                            | true                          |
    | 113200                  | true                            |                               |
    | 113210                  | true                            |                               |
    | 113300                  |                                 | true                          |
    | 113310                  |                                 | true                          |
