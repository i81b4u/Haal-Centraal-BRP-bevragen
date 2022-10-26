# language: nl

@post-assert
Functionaliteit: Bepalen van de actuele nationaliteit van een persoon

  Rule: In het antwoord voor personen worden alleen actuele nationaliteiten opgenomen, waarbij geldt dat:
    - er kunnen meerdere actuele nationaliteiten voorkomen
    - wanneer een nationaliteit beëindigd is wordt deze niet opgenomen
    - wanneer nationaliteit voorkomt met een waarde ongelijk aan "0000", "0002", "0499" of "0500", dan wordt type opgenomen met de waarde "Nationaliteit"
    - wanneer nationaliteit voorkomt met een waarde gelijk aan "0499", dan wordt type opgenomen met de waarde "Staatloos"
    - wanneer aanduidingBijzonderNederlanderschap voorkomt met een waarde gelijk aan "B", dan wordt type opgenomen met de waarde "BehandeldAlsNederlander"
    - wanneer nationaliteit voorkomt met een waarde gelijk aan "0002", dan wordt type opgenomen met de waarde "BehandeldAlsNederlander"
    - wanneer aanduidingBijzonderNederlanderschap voorkomt met een waarde gelijk aan "V", dan wordt type opgenomen met de waarde "VastgesteldNietNederlander"
    - wanneer nationaliteit voorkomt met een waarde gelijk aan "0500", dan wordt type opgenomen met de waarde "VastgesteldNietNederlander"
    - wanneer nationaliteit voorkomt met een waarde gelijk aan "0000" (onbekend), dan wordt type opgenomen met de waarde "NationaliteitOnbekend"


    Scenario: de persoon heeft één actuele nationaliteit
      Gegeven de persoon met burgerservicenummer '000000139' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0001                  | 001                   | 19750707                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 000000139                       |
      | fields              | nationaliteiten                 |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                           |
      | type                              | Nationaliteit                                    |
      | nationaliteit.code                | 0001                                             |
      | nationaliteit.omschrijving        | Nederlandse                                      |
      | redenOpname.code                  | 001                                              |
      | redenOpname.omschrijving          | Wet op het Nederlanderschap 1892, art.1, lid 1a  |
      | datumIngangGeldigheid.type        | Datum                                            |
      | datumIngangGeldigheid.datum       | 1975-07-07                                       |
      | datumIngangGeldigheid.langFormaat | 7 juli 1975                                      |

      Scenario: persoon heeft meerdere nationaliteiten
      Gegeven de persoon met burgerservicenummer '000000140' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0001                  | 001                   | 19750707                        |
      En de persoon heeft nog een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0263                  | 301                   | 19620107                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 000000140                       |
      | fields              | nationaliteiten                 |
      Dan heeft de response een persoon met een 'nationaliteit' met alleen de volgende gegevens
      | naam                              | waarde                                           |
      | type                              | Nationaliteit                                    |
      | nationaliteit.code                | 0001                                             |
      | nationaliteit.omschrijving        | Nederlandse                                      |
      | redenOpname.code                  | 001                                              |
      | redenOpname.omschrijving          | Wet op het Nederlanderschap 1892, art.1, lid 1a  |
      | datumIngangGeldigheid.type        | Datum                                            |
      | datumIngangGeldigheid.datum       | 1975-07-07                                       |
      | datumIngangGeldigheid.langFormaat | 7 juli 1975                                      |
      En heeft de persoon een 'nationaliteit' met alleen de volgende gegevens
      | naam                              | waarde                                           |
      | type                              | Nationaliteit                                    |
      | nationaliteit.code                | 0263                                             |
      | nationaliteit.omschrijving        | Surinaamse                                       |
      | redenOpname.code                  | 301                                              |
      | redenOpname.omschrijving          | Vaststelling bezit vreemde nationaliteit         |
      | datumIngangGeldigheid.type        | Datum                                            |
      | datumIngangGeldigheid.datum       | 1962-01-07                                       |
      | datumIngangGeldigheid.langFormaat | 7 januari 1962                                   |

    Scenario: de persoon is Staatloos
      Gegeven de persoon met burgerservicenummer '000000188' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0499                  | 312                   | 19750707                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                          |
      | type                | RaadpleegMetBurgerservicenummer |
      | burgerservicenummer | 000000188                       |
      | fields              | nationaliteiten                 |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                           |
      | type                              | Staatloos                                        |
      | redenOpname.code                  | 312                                              |
      | redenOpname.omschrijving          | Vaststelling staatloosheid                       |
      | datumIngangGeldigheid.type        | Datum                                            |
      | datumIngangGeldigheid.datum       | 1975-07-07                                       |
      | datumIngangGeldigheid.langFormaat | 7 juli 1975                                      |

    Scenario: de persoon wordt behandeld als Nederlander, bijzonder Nederlanderschap heeft waarde "B"
      Gegeven de persoon met burgerservicenummer '000000164' heeft een 'nationaliteit' met de volgende gegevens
      | reden opnemen (63.10) | bijzonder Nederlanderschap (65.10) | datum ingang geldigheid (85.10) |
      | 310                   | B                                  | 19570115                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000164                           |
      | fields              | nationaliteiten                     |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                  |
      | type                              | BehandeldAlsNederlander                 |
      | redenOpname.code                  | 310                                     |
      | redenOpname.omschrijving          | Vaststelling bijzonder Nederlanderschap |
      | datumIngangGeldigheid.type        | Datum                                   |
      | datumIngangGeldigheid.datum       | 1957-01-15                              |
      | datumIngangGeldigheid.langFormaat | 15 januari 1957                         |

    Scenario: de persoon wordt behandeld als Nederlander, nationaliteit heeft code 0002
      Gegeven de persoon met burgerservicenummer '000000115' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0002                  | 310                   | 19570116                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000115                           |
      | fields              | nationaliteiten                     |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                  |
      | type                              | BehandeldAlsNederlander                 |
      | redenOpname.code                  | 310                                     |
      | redenOpname.omschrijving          | Vaststelling bijzonder Nederlanderschap |
      | datumIngangGeldigheid.type        | Datum                                   |
      | datumIngangGeldigheid.datum       | 1957-01-16                              |
      | datumIngangGeldigheid.langFormaat | 16 januari 1957                         |

    Scenario: de persoon is vastgesteld niet-Nederlander , bijzonder Nederlanderschap heeft waarde "V"
    Gegeven de persoon met burgerservicenummer '000000218' heeft een 'nationaliteit' met de volgende gegevens
      | reden opnemen (63.10) | bijzonder Nederlanderschap (65.10) | datum ingang geldigheid (85.10) |
      | 310                   | V                                  | 19750615                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000218                           |
      | fields              | nationaliteiten                     |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                  |
      | type                              | VastgesteldNietNederlander              |
      | redenOpname.code                  | 310                                     |
      | redenOpname.omschrijving          | Vaststelling bijzonder Nederlanderschap |
      | datumIngangGeldigheid.type        | Datum                                   |
      | datumIngangGeldigheid.datum       | 1975-06-15                              |
      | datumIngangGeldigheid.langFormaat | 15 juni 1975                            |

    Scenario: de persoon is vastgesteld niet-Nederlander, natonaliteit heeft code "0500"
    Gegeven de persoon met burgerservicenummer '000000127' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0500                  | 310                   | 19750618                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000127                           |
      | fields              | nationaliteiten                     |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                  |
      | type                              | VastgesteldNietNederlander              |
      | redenOpname.code                  | 310                                     |
      | redenOpname.omschrijving          | Vaststelling bijzonder Nederlanderschap |
      | datumIngangGeldigheid.type        | Datum                                   |
      | datumIngangGeldigheid.datum       | 1975-06-18                              |
      | datumIngangGeldigheid.langFormaat | 18 juni 1975                            |

    Scenario: de persoon heeft een onbekende nationaliteit
      Gegeven de persoon met burgerservicenummer '000000048' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0000                  | 311                   | 00000000                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000048                           |
      | fields              | nationaliteiten |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                  |
      | type                              | NationaliteitOnbekend                   |
      | redenOpname.code                  | 311                                     |
      | redenOpname.omschrijving          | Vaststelling onbekende nationaliteit    |
      | datumIngangGeldigheid.type        | DatumOnbekend                           |
      | datumIngangGeldigheid.onbekend    | true                                    |
      | datumIngangGeldigheid.langFormaat | onbekend                                |

    Scenario: beëindigde registratie van vreemde nationaliteit
      Gegeven de persoon met burgerservicenummer '000000061' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0263                  | 301                   | 20100801                        |
      En de 'nationaliteit' is gewijzigd naar de volgende gegevens
      | reden beëindigen (64.10) |  datum ingang geldigheid (85.10) |
      | 404                      | 20150131                        |
      En de persoon heeft nog een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0001                  | 017                   | 20100801                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000061                           |
      | fields              | nationaliteiten                     |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                               |
      | type                              | Nationaliteit                                        |
      | nationaliteit.code                | 0001                                                 |
      | nationaliteit.omschrijving        | Nederlandse                                          |
      | redenOpname.code                  | 017                                                  |
      | redenOpname.omschrijving          | Rijkswet op het Nederlanderschap 1984, art. 3, lid 1 |
      | datumIngangGeldigheid.type        | Datum                                                |
      | datumIngangGeldigheid.datum       | 2010-08-01                                           |
      | datumIngangGeldigheid.langFormaat | 1 augustus 2010                                      |

    Scenario: verlies bijzonder Nederlanderschap
      Gegeven de persoon met burgerservicenummer '000000073' heeft een 'nationaliteit' met de volgende gegevens
      | reden opnemen (63.10) | bijzonder Nederlanderschap (65.10) | datum ingang geldigheid (85.10) |
      | 310                   | V                                  | 20010319                        |
      En de 'nationaliteit' is gewijzigd naar de volgende gegevens
      | reden beëindigen (64.10) | datum ingang geldigheid (85.10) |
      | 410                      | 20190604                        |
      En de persoon heeft nog een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0001                  | 017                   | 20190602                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000073                           |
      | fields              | nationaliteiten                     |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                               |
      | type                              | Nationaliteit                                        |
      | nationaliteit.code                | 0001                                                 |
      | nationaliteit.omschrijving        | Nederlandse                                          |
      | redenOpname.code                  | 017                                                  |
      | redenOpname.omschrijving          | Rijkswet op het Nederlanderschap 1984, art. 3, lid 1 |
      | datumIngangGeldigheid.type        | Datum                                                |
      | datumIngangGeldigheid.datum       | 2019-06-02                                           |
      | datumIngangGeldigheid.langFormaat | 2 juni 2019                                          |

    Scenario: geactualiseerde ingangsdatum geldigheid
      Gegeven de persoon met burgerservicenummer '000000097' heeft een 'nationaliteit' met de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0100                  | 311                   | 20200713                        |
      En de 'nationaliteit' is gecorrigeerd naar de volgende gegevens
      | nationaliteit (05.10) | reden opnemen (63.10) | datum ingang geldigheid (85.10) |
      | 0100                  | 311                   | 20200727                        |
      Als personen wordt gezocht met de volgende parameters
      | naam                | waarde                              |
      | type                | RaadpleegMetBurgerservicenummer     |
      | burgerservicenummer | 000000097                           |
      | fields              | nationaliteiten |
      Dan heeft de response een persoon met een 'nationaliteit' met de volgende gegevens
      | naam                              | waarde                                               |
      | type                              | Nationaliteit                                        |
      | nationaliteit.code                | 0100                                                 |
      | nationaliteit.omschrijving        | Algerijnse                                           |
      | redenOpname.code                  | 311                                                  |
      | redenOpname.omschrijving          | Vaststelling onbekende nationaliteit                 |
      | datumIngangGeldigheid.type        | Datum                                                |
      | datumIngangGeldigheid.datum       | 2020-07-27                                           |
      | datumIngangGeldigheid.langFormaat | 27 juli 2020                                         |
