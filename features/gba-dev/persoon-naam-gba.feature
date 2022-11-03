#language: nl

Functionaliteit: GBA persoon: naam

  Abstract Scenario: voorvoegsel naam is leeg
    Gegeven de persoon met burgerservicenummer '000000152' heeft de volgende gegevens
    | naam                  | waarde |
    | voornamen (02.10)     | Jan    |
    | voorvoegsel (02.30)   |        |
    | geslachtsnaam (02.40) | Boer   |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                | waarde                          |
    | type                | RaadpleegMetBurgerservicenummer |
    | burgerservicenummer | 000000152                       |
    | fields              | <fields>                        |
    Dan heeft de response een persoon met alleen de volgende 'naam' gegevens
    | naam          | waarde |
    | voornamen     | Jan    |
    | geslachtsnaam | Boer   |

    Voorbeelden:
    | fields                                             |
    | naam                                               |
    | naam.voornamen,naam.geslachtsnaam                  |
    | naam.voornamen,naam.voorvoegsel,naam.geslachtsnaam |
