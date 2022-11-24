#language: nl

@gba
Functionaliteit: Zoek met geslachtsnaam en geboortedatum (GBA)

Rule: voorvoegsel is niet hoofdlettergevoelig

  Scenario: Zoek met volledige voorvoegsel in hoofdletters
    Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende gegevens
    | geboortedatum (03.10) | geslachtsnaam (02.40) | voornamen (02.10) |
    | 19830526              | Maassen               | Pieter            |
    En de persoon met burgerservicenummer '000000025' heeft de volgende gegevens
    | geboortedatum (03.10) | geslachtsnaam (02.40) | voornamen (02.10) | voorvoegsel (02.30) |
    | 19830526              | Maassen               | Jan Peter         | van                 |
    Als gba personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | Maassen                             |
    | voorvoegsel   | VAN                                 |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de response een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000025 |

Rule: geslacht is niet hoofdlettergevoelig

  Scenario: Zoek met geslacht in kleine letters
    Gegeven de persoon met burgerservicenummer '000000027' heeft de volgende gegevens
    | geboortedatum (03.10) | geslachtsnaam (02.40) | geslachtsaanduiding (04.10) |
    | 19830526              | Aedel                 | V                           |
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | Aedel                               |
    | geslacht      | v                                   |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de response een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000027 |

Rule: voor een overleden persoon moet datum overlijden worden geretourneerd

  Scenario: Zoek een overleden persoon
    Gegeven de persoon met burgerservicenummer '000000028' heeft de volgende gegevens
    | geboortedatum (03.10) | geslachtsnaam (02.40) |
    | 19830526              | Jansen                |
    En de persoon met burgerservicenummer '000000035' heeft de volgende gegevens
    | geboortedatum (03.10) | geslachtsnaam (02.40) |
    | 19830526              | Jansen                |
    En de persoon heeft de volgende 'overlijden' gegevens
    | datum overlijden (08.10) |
    | 20220301                 |
    Als gba personen wordt gezocht met de volgende parameters
    | naam                       | waarde                              |
    | type                       | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam              | Jansen                              |
    | inclusiefOverledenPersonen | true                                |
    | geboortedatum              | 1983-05-26                          |
    | fields                     | burgerservicenummer                 |
    Dan heeft de response 2 personen
    En heeft de response een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000028 |
    En heeft de response een persoon met de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 000000035 |
    | overlijden.datum    | 20220301  |
