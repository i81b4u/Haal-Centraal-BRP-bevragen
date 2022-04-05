#language: nl

@ready @post-assert
Functionaliteit: Zoek met geslachtsnaam en geboortedatum

  Achtergrond:
    Gegeven het systeem heeft personen met de volgende gegevens
    | burgerservicenummer | geslachtsaanduiding (04.10) |
    | 999995078           | M                           |
    | 999995079           | M                           |
    | 999995080           | M                           |
    | 999995081           | M                           |
    | 999995082           | M                           |
    | 999995083           | M                           |
    | 999995084           | V                           |
    | 999995085           | V                           |
    | 999995086           | V                           |
    | 999995087           | V                           |
    En het systeem heeft personen met de volgende 'geboorte' gegevens
    | burgerservicenummer | datum    | plaats.omschrijving |
    | 999995078           | 19830526 | Noordwijk           |
    | 999995079           | 19830526 | Leiden              |
    | 999995080           | 19830526 | Katwijk             |
    | 999995081           | 19830526 | Lisse               |
    | 999995082           | 19830526 | Wassenaar           |
    | 999995083           | 19830526 |                     |
    | 999995084           | 19830526 |                     |
    | 999995085           | 19830526 |                     |
    | 999995086           | 19830526 |                     |
    | 999995087           | 19830526 |                     |
    En het systeem heeft personen met de volgende 'naam' gegevens
    | burgerservicenummer | geslachtsnaam (02.40) | voornamen (02.10) | voorvoegsel (02.30) |
    | 999995078           | Maassen               | Pieter            |                     |
    | 999995079           | Groen                 |                   |                     |
    | 999995080           | Groot                 |                   |                     |
    | 999995081           | Jansen                |                   |                     |
    | 999995082           | Maassen               | Jan Peter         | van                 |
    | 999995083           | Groenlo               |                   |                     |
    | 999995084           | Aedel                 | Petra             | van den             |
    | 999995085           | Jansen                |                   |                     |
    | 999995086           | Os                    |                   |                     |
    | 999995087           | Osnabrugge            |                   |                     |
    En het systeem heeft personen met de volgende 'overlijden' gegevens
    | burgerservicenummer | datum    |
    | 999995085           | 20220301 |

Rule: Geslachtsnaam en geboortedatum zijn verplichte parameters
      Zoeken is niet hoofdlettergevoelig

  Abstract Scenario: Zoek met volledige geslachtsnaam en geboortedatum
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam>                     |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 2 personen
    En heeft de persoon met burgerservicenummer '999995078' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995078 |
    En heeft de persoon met burgerservicenummer '999995082' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995082 |

    Voorbeelden:
    | geslachtsnaam |
    | Maassen       |
    | maassen       |
    | MAASSEN       |

  Abstract Scenario: Zoek met deel van geslachtsnaam en geboortedatum
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                                                |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum                   |
    | geslachtsnaam | <geslachtsnaam>                                       |
    | geboortedatum | 1983-05-26                                            |
    | fields        | burgerservicenummer                                   |
    Dan heeft de response 0 personen

    Voorbeelden:
    | geslachtsnaam |
    | Maas          |
    | jans          |
    | MAAS          |

  Scenario: Zoek met geslachtsnaam van twee karakters lang
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | os                                  |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de persoon met burgerservicenummer '999995086' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995086 |

  Abstract Scenario: Zoek met volledige voornamen
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam>                     |
    | voornamen     | <voornamen>                         |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de persoon met burgerservicenummer '<burgerservicenummer>' de volgende gegevens
    | naam                | waarde                |
    | burgerservicenummer | <burgerservicenummer> |

    Voorbeelden:
    | geslachtsnaam | voornamen | burgerservicenummer |
    | Maassen       | Pieter    | 999995078           |
    | maassen       | PIETER    | 999995078           |
    | MAASSEN       | pieter    | 999995078           |
    | maassen       | jan peter | 999995082           |

  Abstract Scenario: Zoek met volledige voorvoegsel
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam>                     |
    | voorvoegsel   | <voorvoegsel>                       |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de persoon met burgerservicenummer '999995082' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995082 |

    Voorbeelden:
    | geslachtsnaam | voorvoegsel |
    | Maassen       | van         |
    | maassen       | VAN         |
    | MAASSEN       | Van         |

  Abstract Scenario: Zoek met geslachtsaanduiding
    Als personen wordt gezocht met de volgende parameters
    | naam                | waarde                              |
    | type                | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam       | Aedel                               |
    | geslachtsaanduiding | <geslachtsaanduiding>               |
    | geboortedatum       | 1983-05-26                          |
    | fields              | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de persoon met burgerservicenummer '999995084' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995084 |

    Voorbeelden:
    | geslachtsaanduiding |
    | v                   |
    | V                   |

  Abstract Scenario: Zoek met geboorteplaats
    Als personen wordt gezocht met de volgende parameters
    | naam           | waarde                              |
    | type           | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam  | Maassen                             |
    | geboorteplaats | <geboorteplaats>                    |
    | geboortedatum  | 1983-05-26                          |
    | fields         | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de persoon met burgerservicenummer '999995082' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995082 |

    Voorbeelden:
    | geboorteplaats |
    | Wassenaar      |
    | wassenaar      |
    | WASSENAAR      |

  Scenario: Zoek met inclusiefOverledenPersonen
    Als personen wordt gezocht met de volgende parameters
    | naam                       | waarde                              |
    | type                       | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam              | Jansen                              |
    | inclusiefOverledenPersonen | true                                |
    | geboortedatum              | 1983-05-26                          |
    | fields                     | burgerservicenummer                 |
    Dan heeft de response 2 personen
    En heeft de persoon met burgerservicenummer '999995081' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995081 |
    En heeft de persoon met burgerservicenummer '999995085' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995085 |

  @fout-case
  Scenario: Zoek zonder geslachtsnaam en geboortedatum 
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam |                                     |
    | geboortedatum |                                     |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Minimale combinatie van parameters moet worden opgegeven.                                                   |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geboortedatum, geslachtsnaam.                                                |
    | code     | paramsCombination                                                                                           |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code     | name          | reason                  |
    | required | geboortedatum | Parameter is verplicht. |
    | required | geslachtsnaam | Parameter is verplicht. |

  @fout-case
  Abstract Scenario: <titel>
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam>                     |
    | geboortedatum | <geboortedatum>                     |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Minimale combinatie van parameters moet worden opgegeven.                                                   |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: <foutieve parameter>.                                                        |
    | code     | paramsCombination                                                                                           |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code     | name                 | reason                  |
    | required | <foutieve parameter> | Parameter is verplicht. |

    Voorbeelden:
    | titel                                | geboortedatum | geslachtsnaam | foutieve parameter |
    | Zoek met alleen valide geslachtsnaam |               | maassen       | geboortedatum      |
    | Zoek met alleen valide geboortedatum | 1983-05-26    |               | geslachtsnaam      |

  @fout-case
  Abstract Scenario: Zoek met invalide geboortedatum
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | Maassen                             |
    | geboortedatum | <geboortedatum>                     |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geboortedatum.                                                               |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code | name          | reason                        |
    | date | geboortedatum | Waarde is geen geldige datum. |

    Voorbeelden:
    | geboortedatum |
    | 19830526      |
    | 26 mei 1983   |

  @fout-case
  Abstract Scenario: <titel>
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam>                     |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geslachtsnaam.                                                               |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code   | name          | reason   |
    | <code> | geslachtsnaam | <reason> |

    Voorbeelden:
    | titel                                        | code      | reason                                                                                               | geslachtsnaam                                                                                                                                                                                                       |
    | Geslachtsnaam is meer dan 200 karakters lang | pattern   | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,200}$\|^[a-zA-Z0-9À-ž \.\-\']{3,199}\*{1}$. | abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ |
    | Geslachtsnaam bevat ongeldige karakters      | pattern   | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,200}$\|^[a-zA-Z0-9À-ž \.\-\']{3,199}\*{1}$. | <script>alert('hello world');</script>                                                                                                                                                                              |

  @fout-case
  Scenario: Meerdere invalide parameters
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                                 |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum    |
    | geslachtsnaam | <script>alert('hello world');</script> |
    | geboortedatum | 19830526                               |
    | fields        | burgerservicenummer                    |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geboortedatum, geslachtsnaam.                                                |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code    | name          | reason                                                                                               |
    | pattern | geslachtsnaam | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,200}$\|^[a-zA-Z0-9À-ž \.\-\']{3,199}\*{1}$. |
    | date    | geboortedatum | Waarde is geen geldige datum.                                                                        |

  @fout-case
  Abstract Scenario: Zoek met ongeldige <parameter naam> parameter
    Als personen wordt gezocht met de volgende parameters
    | naam             | waarde                                 |
    | type             | ZoekMetGeslachtsnaamEnGeboortedatum    |
    | geslachtsnaam    | maassen                                |
    | geboortedatum    | 1983-05-26                             |
    | <parameter naam> | <script>alert('hello world');</script> |
    | fields           | burgerservicenummer                    |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: <parameter naam>.                                                            |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code    | name             | reason                                     |
    | pattern | <parameter naam> | Waarde voldoet niet aan patroon <patroon>. |

    Voorbeelden:
    | parameter naam      | patroon                               |
    | voornamen           | ^[a-zA-Z0-9À-ž \.\-\']{1,199}\*{0,1}$ |
    | voorvoegsel         | ^[a-zA-Z \']{1,10}$                   |
    | geslachtsaanduiding | ^([Mm]\|[Vv]\|[Oo])$                  |
    | geboorteplaats      | ^[a-zA-Z0-9À-ž \,\.\-\'()]{1,80}$     |

Rule: Bij zoeken met de "*" wildcard moet minimaal 3 letters (exclusief de wildcard teken) worden opgegeven
      De "*" wildcard komt overeen met nul of meer (niet-spatie) karakters

  Abstract Scenario: Zoek met "*" wildcard als laatste karakter in geslachtsnaam
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam filter>              |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 3 personen
    En heeft de persoon met burgerservicenummer '999995079' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995079 |
    En heeft de persoon met burgerservicenummer '999995080' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995080 |
    En heeft de persoon met burgerservicenummer '999995083' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995083 |

    Voorbeelden:
    | geslachtsnaam filter |
    | gro*                 |
    | Gro*                 |
    | GRO*                 |

  @fout-case
  Abstract Scenario: Zoek met "*" wildcard als eerste karakter in geslachtsnaam
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam filter>              |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geslachtsnaam.                                                               |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code    | name          | reason                                                                                               |
    | pattern | geslachtsnaam | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,200}$\|^[a-zA-Z0-9À-ž \.\-\']{3,199}\*{1}$. |

    Voorbeelden:
    | geslachtsnaam filter |
    | *sen                 |
    | *SEN                 |

  @fout-case
  Abstract Scenario: Zoek met "*" wildcard als eerste en laatste karakter in geslachtsnaam
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam filter>              |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geslachtsnaam.                                                               |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code    | name          | reason                                                                                               |
    | pattern | geslachtsnaam | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,200}$\|^[a-zA-Z0-9À-ž \.\-\']{3,199}\*{1}$. |

    Voorbeelden:
    | geslachtsnaam filter |
    | *oen*                |
    | *OEN*                |

  Abstract Scenario: Zoek met "*" wildcard als laatste karakter in voornamen
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | maassen                             |
    | voornamen     | <voornamen filter>                  |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response 1 persoon
    En heeft de persoon met burgerservicenummer '999995082' de volgende gegevens
    | naam                | waarde    |
    | burgerservicenummer | 999995082 |

    Voorbeelden:
    | voornamen filter |
    | Jan*             |
    | jan*             |
    | JAN*             |

  @fout-case
  Abstract Scenario: Zoek met "*" wildcard als eerste karakter in voornamen
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | maassen                             |
    | voornamen     | <voornamen filter>                  |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: voornamen.                                                                   |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code    | name      | reason                                                                 |
    | pattern | voornamen | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,199}\*{0,1}$. |

    Voorbeelden:
    | voornamen filter |
    | *eter            |
    | *ETER            |

  @fout-case
  Abstract Scenario: geslachtsnaam met maximimaal twee letters exclusief "*" wildcard karakter
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam filter>              |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geslachtsnaam.                                                               |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code    | name          | reason                                                                                               |
    | pattern | geslachtsnaam | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,200}$\|^[a-zA-Z0-9À-ž \.\-\']{3,199}\*{1}$. |

    Voorbeelden:
    | geslachtsnaam filter |
    | *                    |
    | *n                   |
    | n*                   |
    | ab*                  |
    | ***                  |

  @fout-case
  Abstract Scenario: De "*" wildcard karakter staat niet aan het eind van de geslachtsnaam zoekstring
    Als personen wordt gezocht met de volgende parameters
    | naam          | waarde                              |
    | type          | ZoekMetGeslachtsnaamEnGeboortedatum |
    | geslachtsnaam | <geslachtsnaam filter>              |
    | geboortedatum | 1983-05-26                          |
    | fields        | burgerservicenummer                 |
    Dan heeft de response een object met de volgende gegevens
    | naam     | waarde                                                                                                      |
    | type     | https://docs.microsoft.com/en-us/dotnet/api/system.net.httpstatuscode?#System_Net_HttpStatusCode_BadRequest |
    | title    | Een of meerdere parameters zijn niet correct.                                                               |
    | status   | 400                                                                                                         |
    | detail   | De foutieve parameter(s) zijn: geslachtsnaam.                                                               |
    | code     | paramsValidation                                                                                            |
    | instance | /haalcentraal/api/brp/personen                                                                              |
    En heeft het object de volgende 'invalidParams' gegevens
    | code    | name          | reason                                                                                               |
    | pattern | geslachtsnaam | Waarde voldoet niet aan patroon ^[a-zA-Z0-9À-ž \.\-\']{1,200}$\|^[a-zA-Z0-9À-ž \.\-\']{3,199}\*{1}$. |

    Voorbeelden:
    | geslachtsnaam filter |
    | *r*ot                |
    | gr*o*                |
    | gr*t                 |
    | gr**                 |
