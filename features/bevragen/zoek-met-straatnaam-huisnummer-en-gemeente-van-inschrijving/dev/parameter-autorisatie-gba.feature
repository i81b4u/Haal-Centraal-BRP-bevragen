# language: nl

@gba @autorisatie
Functionaliteit: autorisatie op parameters bij ZoekMetStraatHuisnummerEnGemeenteVanInschrijving

    Achtergrond:
      Gegeven de persoon met burgerservicenummer '000000024' heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0800                              |
      En de 'verblijfplaats' heeft de volgende 'adres' gegevens
      | naam                         | waarde          |
      | gemeentecode (92.10)         | 0800            |
      | straatnaam (11.10)           | Borgesiusstraat |
      | huisnummer (11.20)           | 123             |
      | huisletter (11.30)           | b               |
      | huisnummertoevoeging (11.40) | 2               |
      | postcode (11.60)             | 2497BV          |
      En de persoon met burgerservicenummer '000000048' heeft de volgende 'verblijfplaats' gegevens
      | gemeente van inschrijving (09.10) |
      | 0599                              |
      En de 'verblijfplaats' heeft de volgende 'adres' gegevens
      | naam                         | waarde     |
      | gemeentecode (92.10)         | 0599       |
      | straatnaam (11.10)           | Koolsingel |
      | huisnummer (11.20)           | 45         |
      | huisletter (11.30)           | a          |
      | huisnummertoevoeging (11.40) | III        |
      | postcode (11.60)             | 4321XY     |

  Rule: Wanneer een parameter wordt gebruikt van een veld waarvoor de gebruiker niet geautoriseerd is, wordt een foutmelding gegeven
    
    @fout-case
    Abstract Scenario: Zoeken met parameter <parameter niet toegestaan> waarvoor de afnemer niet geautoriseerd is (<ontbrekende rubriek>)
      Gegeven de afnemer met indicatie '000008' heeft de volgende 'autorisatie' gegevens
      | Rubrieknummer ad hoc (35.95.60) | Medium ad hoc (35.95.67) | Datum ingang (35.99.98) |
      | <ad hoc rubrieken>              | N                        | 20201128                |
      En de geauthenticeerde consumer heeft de volgende 'claim' gegevens
      | naam         | waarde |
      | afnemerID    | 000008 |
      | gemeenteCode | 0800   |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                                           |
      | type                    | ZoekMetStraatHuisnummerEnGemeenteVanInschrijving |
      | straat                  | Koolsingel                                       |
      | huisnummer              | 45                                               |
      | huisletter              | a                                                |
      | huisnummertoevoeging    | III                                              |
      | gemeenteVanInschrijving | 0599                                             |
      | fields                  | burgerservicenummer                              |
      Dan heeft de response een object met de volgende gegevens
      | naam     | waarde                                                                                    |
      | type     | https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.3                               |
      | title    | U bent niet geautoriseerd voor de gebruikte parameter(s).                                 |
      | status   | 403                                                                                       |
      | detail   | U bent niet geautoriseerd voor het gebruik van parameter(s): <parameter niet toegestaan>. |
      | code     | unauthorizedParameter                                                                     |
      | instance | /haalcentraal/api/brp/personen                                                            |

      Voorbeelden:
      | ad hoc rubrieken              | parameter niet toegestaan | ontbrekende rubriek |
      | 10120 81110 81120 81130 81140 | gemeenteVanInschrijving   | 80910               |
      | 10120 80910 81120 81130 81140 | straat                    | 81110               |
      | 10120 80910 81110 81130 81140 | huisnummer                | 81120               |
      | 10120 80910 81110 81120 81140 | huisletter                | 81130               |
      | 10120 80910 81110 81120 81130 | huisnummertoevoeging      | 81140               |

    @fout-case
    Scenario: Gebruik van meerdere parameters waarvoor de afnemer niet geautoriseerd is
      Gegeven de afnemer met indicatie '000008' heeft de volgende 'autorisatie' gegevens
      | Rubrieknummer ad hoc (35.95.60) | Medium ad hoc (35.95.67) | Datum ingang (35.99.98) |
      | 10120 80910 81110 81120         | N                        | 20201128                |
      En de geauthenticeerde consumer heeft de volgende 'claim' gegevens
      | naam         | waarde |
      | afnemerID    | 000008 |
      | gemeenteCode | 0800   |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                                           |
      | type                    | ZoekMetStraatHuisnummerEnGemeenteVanInschrijving |
      | straat                  | Koolsingel                                       |
      | huisnummer              | 45                                               |
      | huisletter              | a                                                |
      | huisnummertoevoeging    | III                                              |
      | gemeenteVanInschrijving | 0599                                             |
      | fields                  | burgerservicenummer                              |
      Dan heeft de response een object met de volgende gegevens
      | naam     | waarde                                                                                         |
      | type     | https://datatracker.ietf.org/doc/html/rfc7231#section-6.5.3                                    |
      | title    | U bent niet geautoriseerd voor de gebruikte parameter(s).                                      |
      | status   | 403                                                                                            |
      | detail   | U bent niet geautoriseerd voor het gebruik van parameter(s): huisletter, huisnummertoevoeging. |
      | code     | unauthorizedParameter                                                                          |
      | instance | /haalcentraal/api/brp/personen                                                                 |

    Scenario: Afnemer zoekt met alleen de verplichte parameters en heeft uitsluitend de autorisatie die nodig is om deze vraag te mogen stellen
      Gegeven de afnemer met indicatie '000008' heeft de volgende 'autorisatie' gegevens
      | Rubrieknummer ad hoc (35.95.60) | Medium ad hoc (35.95.67) | Datum ingang (35.99.98) |
      | 10120 80910 81110 81120         | N                        | 20201128                |
      En de geauthenticeerde consumer heeft de volgende 'claim' gegevens
      | naam         | waarde |
      | afnemerID    | 000008 |
      | gemeenteCode | 0800   |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                                           |
      | type                    | ZoekMetStraatHuisnummerEnGemeenteVanInschrijving |
      | straat                  | Koolsingel                                       |
      | huisnummer              | 45                                               |
      | gemeenteVanInschrijving | 0599                                             |
      | fields                  | burgerservicenummer                              |
      Dan heeft de response 1 persoon

    Abstract Scenario: Afnemer zoekt met de verplichte parameters en <extra parameter> en heeft uitsluitend de autorisatie die nodig is om deze vraag te mogen stellen
      Gegeven de afnemer met indicatie '000008' heeft de volgende 'autorisatie' gegevens
      | Rubrieknummer ad hoc (35.95.60)                   | Medium ad hoc (35.95.67) | Datum ingang (35.99.98) |
      | 10120 80910 81110 81120 <rubriek extra parameter> | N                        | 20201128                |
      En de geauthenticeerde consumer heeft de volgende 'claim' gegevens
      | naam         | waarde |
      | afnemerID    | 000008 |
      | gemeenteCode | 0800   |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                                           |
      | type                    | ZoekMetStraatHuisnummerEnGemeenteVanInschrijving |
      | straat                  | Koolsingel                                       |
      | huisnummer              | 45                                               |
      | gemeenteVanInschrijving | 0599                                             |
      | <extra parameter>       | <waarde>                                         |
      | fields                  | burgerservicenummer                              |
      Dan heeft de response 1 persoon

      Voorbeelden:
      | extra parameter      | rubriek extra parameter | waarde |
      | huisletter           | 81130                   | a      |
      | huisnummertoevoeging | 81140                   | III    |


  Rule: Een gemeente als afnemer is geautoriseerd voor alle zoekvragen voor haar eigen inwoners
    Wanneer de afnemer parameter gemeenteVanInschrijving gebruikt 
    en die is gelijk aan de waarde van gemeenteCode in de 'claim', 
    dan wordt niet gekeken naar de autorisatie van de afnemer

    Scenario: Gemeente is niet geautoriseerd voor de zoekparameters maar zoekt alleen eigen inwoners
      Gegeven de afnemer met indicatie '000008' heeft de volgende 'autorisatie' gegevens
      | Rubrieknummer ad hoc (35.95.60) | Medium ad hoc (35.95.67) | Datum ingang (35.99.98) |
      | 10120                           | N                        | 20201128                |
      En de geauthenticeerde consumer heeft de volgende 'claim' gegevens
      | naam         | waarde |
      | afnemerID    | 000008 |
      | gemeenteCode | 0800   |
      Als gba personen wordt gezocht met de volgende parameters
      | naam                    | waarde                                           |
      | type                    | ZoekMetStraatHuisnummerEnGemeenteVanInschrijving |
      | straat                  | Borgesiusstraat                                  |
      | huisnummer              | 123                                              |
      | huisletter              | b                                                |
      | huisnummertoevoeging    | 2                                                |
      | gemeenteVanInschrijving | 0800                                             |
      | fields                  | burgerservicenummer                              |
      Dan heeft de response 1 persoon
      