# language: nl

Functionaliteit: Kinderen van een persoon raadplegen
  Van een persoon worden -indien gevraagd met de fields parameter- de kinderen geleverd.
  Dit bevat enkele identificerende eigenschappen van de kinderen.

  Rule: de actuele gegevens van kinderen worden geleverd

    Scenario: de naam van een kind is gecorrigeerd
      Gegeven de persoon met burgerservicenummer 999996150 heeft de volgende kinderen in de registratie
        | Categorie | Voornamen (02.10)  | Voorvoegsel (02.30) | Geslachtsnaam (02.40) | Onjuist (84.10) |
        | 9         | William            |                     | Postma                |                 |
        | 59        | William            | de                  | Vries                 |                 |
        | 59        | William            | de                  | Boer                  | O               |
        | 9         | Sebastiaan         | de                  | Boer                  |                 |
        | 9         | Walter             | de                  | Boer                  |                 |
        | 59        | Walter             |                     | Messeritz             | O               |
      Als de persoon met burgerservicenummer 999996150 wordt geraadpleegd met fields=kinderen
      Dan bevat het antwoord 3 kinderen
      En bevat het antwoord het kind met naam.voornamen "William" naam.geslachtsnaam "Postma"
      En bevat het antwoord het kind met naam.voornamen "Sebastiaan" naam.geslachtsnaam "Boer"
      En bevat het antwoord het kind met naam.voornamen "Walter" naam.geslachtsnaam "Boer"

    Scenario: naamswijziging kind
      Gegeven de persoon met burgerservicenummer 999996381 heeft de volgende kinderen in de registratie
        | Categorie | Voornamen (02.10) |
        | 9         | Vica              |
        | 59        | Celeke Lodivica   |
        | 9         | Bella             |
      Als de persoon met burgerservicenummer 999996381 wordt geraadpleegd met fields=kinderen
      Dan bevat het antwoord 2 kinderen
      En bevat het antwoord het kind met naam.voornamen "Vica"
      En bevat het antwoord het kind met naam.voornamen "Bella"
      En bevat het antwoord GEEN kind met naam.voornamen "Celeke Lodivica"


  Rule: Een kind wordt alleen teruggegeven als minimaal één gegeven in de identificatienummers (groep 01), naam (groep 02) of geboorte (groep 03) van het kind een waarde heeft.
    # wanneer in een categorie kind alleen gegevens zijn opgenomen in groep 81 of 82, 85 en 86, wordt dit kind niet opgenomen in het antwoord
    # wanneer een gegeven een onbekendwaarde heeft, zoals . (punt) bij geslachtsnaam en 00000000 bij geboortedatum, wordt die in deze regel beschouwd als leeg (geen waarde).

    Scenario: kind volledig onbekend
      Gegeven de persoon met burgerservicenummer 555550001 heeft de volgende kinderen in de registratie
        | Categorie | Voornamen (02.10)  | Voorvoegsel (02.30) | Geslachtsnaam (02.40) | Geboortedatum (03.10) |
        | 9         |                    |                     | .                     |                       |
      En er zijn geen andere gegevens geregistreerd over de identificatienummers (groep 01), naam (groep 02) of geboorte (groep 03) in categorie 9
      Als de persoon met burgerservicenummer 555550001 wordt geraadpleegd met fields=kinderen
      Dan bevat het antwoord GEEN kinderen

    Scenario: ontkenning ouderschap
      Gegeven de persoon met burgerservicenummer 555550002 heeft de volgende kinderen in de registratie
        | Categorie | Voornamen (02.10)  | Voorvoegsel (02.30) | Geslachtsnaam (02.40) | Geboortedatum (03.10) | Gemeente document (82.10) | Datum document (82.20) | Beschrijving document (82.30) | Ingangsdatum geldigheid (85.10) | Datum van opneming (86.10) |
        | 9         |                    |                     |                       |                       | 1926                      | 20040105               | D27894-2004-A782              | 20031107                        | 20040112                   |
        | 59        | Daan               | de                  | Vries                 | 20031107              | 0518                      | 20031109               | PL gerelateerde               | 20031107                        | 20031109                   |
      En er zijn geen gegevens geregistreerd over de identificatienummers (groep 01), naam (groep 02) of geboorte (groep 03) in categorie 9
      Als de persoon met burgerservicenummer 555550002 wordt geraadpleegd met fields=kinderen
      Dan bevat het antwoord GEEN kinderen


Rule: de geleverde kindgegevens zijn de gegevens zoals die staan op de persoonslijst van de gevraagde persoon
  # bij het raadplegen van een persoon worden alleen gegevens uit de persoonslijst van de gevraagde persoon gebruikt, en nooit gegevens van de persoonslijst van het kind

  Scenario: Het kind heeft geslachtswijziging ondergaan, maar de gevraagde persoon erkent dit niet
    Gegeven de persoon met burgerservicenummer 555550003 heeft de volgende kinderen in de registratie
      | Categorie | Burgerservicenummer (01.20) | Voornamen |
      | 9         | 555550004                   | Karel     |
      | 9         | 555550005                   | Ellen     |
    En het kind met burgerservicenummer 555550004 heeft haar geslachtsaanduiding en voornamen gewijzigd zodat de volgende persoonsgegevens in de registratie op haar persoonslijst staan:
      | Categorie | Voornamen | Geslachtsaanduiding (04.10) |
      | 1         | Charlotte | V                           |
      | 51        | Karel     | M                           |
    Als de persoon met burgerservicenummer 555550003 wordt geraadpleegd met fields=kinderen
    Dan bevat het antwoord 2 kinderen
    En bevat het antwoord het kind met naam.voornamen "Karel"
    En bevat het antwoord het kind met naam.voornamen "Ellen"
    En bevat het antwoord GEEN kind met naam.voornamen "Charlotte"
