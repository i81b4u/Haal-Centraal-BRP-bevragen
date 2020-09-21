/*
 * Bevragingen ingeschreven personen
 * API voor het ontsluiten van gegevens van ingeschreven personen en aanverwante gegevens uit de GBA en RNI. Met deze API worden de actuele gegevens van ingeschreven personen, hun kinderen, partners en ouders ontsloten. <br> Heeft een persoon bijvoorbeeld geen geldige nationaliteit, dan wordt nationaliteit niet geretourneerd. <br> Heeft een persoon een beëindigd partnerschap of huwelijk, dan wordt de partner niet geretourneerd. <br> <br> Zie de [Functionele documentatie](https://github.com/VNG-Realisatie/Bevragingen-ingeschreven-personen/tree/master/features) voor nadere toelichting. <br> 
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


package org.openapitools.client.model;

import java.util.Objects;
import java.util.Arrays;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.IOException;
import org.openapitools.client.model.DatumOnvolledig;

/**
 * Indicators om aan te geven dat de gegevens over het verblijf en adres van de INGESCHREVEN NATUURLIJK PERSOON in onderzoek zijn. Elementen van het GBA-adres zelf (Dat zou eigenlijk een BAG-adres moeten zijn) kunnen niet in onderzoek zijn. Wel de relatie naar de nummeraanduding. Dat wordt gedaan door de identificatiecodeNummeraanduiding in onderzoek te zetten. Zie de [functionele specificaties](https://github.com/VNG-Realisatie/Bevragingen-ingeschreven-personen/blob/master/features/in_onderzoek.feature)
 */
@ApiModel(description = "Indicators om aan te geven dat de gegevens over het verblijf en adres van de INGESCHREVEN NATUURLIJK PERSOON in onderzoek zijn. Elementen van het GBA-adres zelf (Dat zou eigenlijk een BAG-adres moeten zijn) kunnen niet in onderzoek zijn. Wel de relatie naar de nummeraanduding. Dat wordt gedaan door de identificatiecodeNummeraanduiding in onderzoek te zetten. Zie de [functionele specificaties](https://github.com/VNG-Realisatie/Bevragingen-ingeschreven-personen/blob/master/features/in_onderzoek.feature)")
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2020-09-21T14:20:17.398Z[Etc/UTC]")
public class VerblijfplaatsInOnderzoek {
  public static final String SERIALIZED_NAME_AANDUIDING_BIJ_HUISNUMMER = "aanduidingBijHuisnummer";
  @SerializedName(SERIALIZED_NAME_AANDUIDING_BIJ_HUISNUMMER)
  private Boolean aanduidingBijHuisnummer;

  public static final String SERIALIZED_NAME_DATUM_AANVANG_ADRESHOUDING = "datumAanvangAdreshouding";
  @SerializedName(SERIALIZED_NAME_DATUM_AANVANG_ADRESHOUDING)
  private Boolean datumAanvangAdreshouding;

  public static final String SERIALIZED_NAME_DATUM_INGANG_GELDIGHEID = "datumIngangGeldigheid";
  @SerializedName(SERIALIZED_NAME_DATUM_INGANG_GELDIGHEID)
  private Boolean datumIngangGeldigheid;

  public static final String SERIALIZED_NAME_DATUM_INSCHRIJVING_IN_GEMEENTE = "datumInschrijvingInGemeente";
  @SerializedName(SERIALIZED_NAME_DATUM_INSCHRIJVING_IN_GEMEENTE)
  private Boolean datumInschrijvingInGemeente;

  public static final String SERIALIZED_NAME_DATUM_VESTIGING_IN_NEDERLAND = "datumVestigingInNederland";
  @SerializedName(SERIALIZED_NAME_DATUM_VESTIGING_IN_NEDERLAND)
  private Boolean datumVestigingInNederland;

  public static final String SERIALIZED_NAME_FUNCTIE_ADRES = "functieAdres";
  @SerializedName(SERIALIZED_NAME_FUNCTIE_ADRES)
  private Boolean functieAdres;

  public static final String SERIALIZED_NAME_GEMEENTE_VAN_INSCHRIJVING = "gemeenteVanInschrijving";
  @SerializedName(SERIALIZED_NAME_GEMEENTE_VAN_INSCHRIJVING)
  private Boolean gemeenteVanInschrijving;

  public static final String SERIALIZED_NAME_HUISLETTER = "huisletter";
  @SerializedName(SERIALIZED_NAME_HUISLETTER)
  private Boolean huisletter;

  public static final String SERIALIZED_NAME_HUISNUMMER = "huisnummer";
  @SerializedName(SERIALIZED_NAME_HUISNUMMER)
  private Boolean huisnummer;

  public static final String SERIALIZED_NAME_HUISNUMMERTOEVOEGING = "huisnummertoevoeging";
  @SerializedName(SERIALIZED_NAME_HUISNUMMERTOEVOEGING)
  private Boolean huisnummertoevoeging;

  public static final String SERIALIZED_NAME_IDENTIFICATIECODE_NUMMERAANDUIDING = "identificatiecodeNummeraanduiding";
  @SerializedName(SERIALIZED_NAME_IDENTIFICATIECODE_NUMMERAANDUIDING)
  private Boolean identificatiecodeNummeraanduiding;

  public static final String SERIALIZED_NAME_IDENTIFICATIECODE_ADRESSEERBAAR_OBJECT = "identificatiecodeAdresseerbaarObject";
  @SerializedName(SERIALIZED_NAME_IDENTIFICATIECODE_ADRESSEERBAAR_OBJECT)
  private Boolean identificatiecodeAdresseerbaarObject;

  public static final String SERIALIZED_NAME_LAND_VANWAAR_INGESCHREVEN = "landVanwaarIngeschreven";
  @SerializedName(SERIALIZED_NAME_LAND_VANWAAR_INGESCHREVEN)
  private Boolean landVanwaarIngeschreven;

  public static final String SERIALIZED_NAME_LOCATIEBESCHRIJVING = "locatiebeschrijving";
  @SerializedName(SERIALIZED_NAME_LOCATIEBESCHRIJVING)
  private Boolean locatiebeschrijving;

  public static final String SERIALIZED_NAME_NAAM_OPENBARE_RUIMTE = "naamOpenbareRuimte";
  @SerializedName(SERIALIZED_NAME_NAAM_OPENBARE_RUIMTE)
  private Boolean naamOpenbareRuimte;

  public static final String SERIALIZED_NAME_POSTCODE = "postcode";
  @SerializedName(SERIALIZED_NAME_POSTCODE)
  private Boolean postcode;

  public static final String SERIALIZED_NAME_STRAATNAAM = "straatnaam";
  @SerializedName(SERIALIZED_NAME_STRAATNAAM)
  private Boolean straatnaam;

  public static final String SERIALIZED_NAME_VERBLIJF_BUITENLAND = "verblijfBuitenland";
  @SerializedName(SERIALIZED_NAME_VERBLIJF_BUITENLAND)
  private Boolean verblijfBuitenland;

  public static final String SERIALIZED_NAME_WOONPLAATSNAAM = "woonplaatsnaam";
  @SerializedName(SERIALIZED_NAME_WOONPLAATSNAAM)
  private Boolean woonplaatsnaam;

  public static final String SERIALIZED_NAME_DATUM_INGANG_ONDERZOEK = "datumIngangOnderzoek";
  @SerializedName(SERIALIZED_NAME_DATUM_INGANG_ONDERZOEK)
  private DatumOnvolledig datumIngangOnderzoek;


  public VerblijfplaatsInOnderzoek aanduidingBijHuisnummer(Boolean aanduidingBijHuisnummer) {
    
    this.aanduidingBijHuisnummer = aanduidingBijHuisnummer;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return aanduidingBijHuisnummer
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getAanduidingBijHuisnummer() {
    return aanduidingBijHuisnummer;
  }


  public void setAanduidingBijHuisnummer(Boolean aanduidingBijHuisnummer) {
    this.aanduidingBijHuisnummer = aanduidingBijHuisnummer;
  }


  public VerblijfplaatsInOnderzoek datumAanvangAdreshouding(Boolean datumAanvangAdreshouding) {
    
    this.datumAanvangAdreshouding = datumAanvangAdreshouding;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return datumAanvangAdreshouding
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getDatumAanvangAdreshouding() {
    return datumAanvangAdreshouding;
  }


  public void setDatumAanvangAdreshouding(Boolean datumAanvangAdreshouding) {
    this.datumAanvangAdreshouding = datumAanvangAdreshouding;
  }


  public VerblijfplaatsInOnderzoek datumIngangGeldigheid(Boolean datumIngangGeldigheid) {
    
    this.datumIngangGeldigheid = datumIngangGeldigheid;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return datumIngangGeldigheid
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getDatumIngangGeldigheid() {
    return datumIngangGeldigheid;
  }


  public void setDatumIngangGeldigheid(Boolean datumIngangGeldigheid) {
    this.datumIngangGeldigheid = datumIngangGeldigheid;
  }


  public VerblijfplaatsInOnderzoek datumInschrijvingInGemeente(Boolean datumInschrijvingInGemeente) {
    
    this.datumInschrijvingInGemeente = datumInschrijvingInGemeente;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return datumInschrijvingInGemeente
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getDatumInschrijvingInGemeente() {
    return datumInschrijvingInGemeente;
  }


  public void setDatumInschrijvingInGemeente(Boolean datumInschrijvingInGemeente) {
    this.datumInschrijvingInGemeente = datumInschrijvingInGemeente;
  }


  public VerblijfplaatsInOnderzoek datumVestigingInNederland(Boolean datumVestigingInNederland) {
    
    this.datumVestigingInNederland = datumVestigingInNederland;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return datumVestigingInNederland
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getDatumVestigingInNederland() {
    return datumVestigingInNederland;
  }


  public void setDatumVestigingInNederland(Boolean datumVestigingInNederland) {
    this.datumVestigingInNederland = datumVestigingInNederland;
  }


  public VerblijfplaatsInOnderzoek functieAdres(Boolean functieAdres) {
    
    this.functieAdres = functieAdres;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return functieAdres
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getFunctieAdres() {
    return functieAdres;
  }


  public void setFunctieAdres(Boolean functieAdres) {
    this.functieAdres = functieAdres;
  }


  public VerblijfplaatsInOnderzoek gemeenteVanInschrijving(Boolean gemeenteVanInschrijving) {
    
    this.gemeenteVanInschrijving = gemeenteVanInschrijving;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return gemeenteVanInschrijving
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getGemeenteVanInschrijving() {
    return gemeenteVanInschrijving;
  }


  public void setGemeenteVanInschrijving(Boolean gemeenteVanInschrijving) {
    this.gemeenteVanInschrijving = gemeenteVanInschrijving;
  }


  public VerblijfplaatsInOnderzoek huisletter(Boolean huisletter) {
    
    this.huisletter = huisletter;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return huisletter
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getHuisletter() {
    return huisletter;
  }


  public void setHuisletter(Boolean huisletter) {
    this.huisletter = huisletter;
  }


  public VerblijfplaatsInOnderzoek huisnummer(Boolean huisnummer) {
    
    this.huisnummer = huisnummer;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return huisnummer
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getHuisnummer() {
    return huisnummer;
  }


  public void setHuisnummer(Boolean huisnummer) {
    this.huisnummer = huisnummer;
  }


  public VerblijfplaatsInOnderzoek huisnummertoevoeging(Boolean huisnummertoevoeging) {
    
    this.huisnummertoevoeging = huisnummertoevoeging;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return huisnummertoevoeging
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getHuisnummertoevoeging() {
    return huisnummertoevoeging;
  }


  public void setHuisnummertoevoeging(Boolean huisnummertoevoeging) {
    this.huisnummertoevoeging = huisnummertoevoeging;
  }


  public VerblijfplaatsInOnderzoek identificatiecodeNummeraanduiding(Boolean identificatiecodeNummeraanduiding) {
    
    this.identificatiecodeNummeraanduiding = identificatiecodeNummeraanduiding;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return identificatiecodeNummeraanduiding
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getIdentificatiecodeNummeraanduiding() {
    return identificatiecodeNummeraanduiding;
  }


  public void setIdentificatiecodeNummeraanduiding(Boolean identificatiecodeNummeraanduiding) {
    this.identificatiecodeNummeraanduiding = identificatiecodeNummeraanduiding;
  }


  public VerblijfplaatsInOnderzoek identificatiecodeAdresseerbaarObject(Boolean identificatiecodeAdresseerbaarObject) {
    
    this.identificatiecodeAdresseerbaarObject = identificatiecodeAdresseerbaarObject;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return identificatiecodeAdresseerbaarObject
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getIdentificatiecodeAdresseerbaarObject() {
    return identificatiecodeAdresseerbaarObject;
  }


  public void setIdentificatiecodeAdresseerbaarObject(Boolean identificatiecodeAdresseerbaarObject) {
    this.identificatiecodeAdresseerbaarObject = identificatiecodeAdresseerbaarObject;
  }


  public VerblijfplaatsInOnderzoek landVanwaarIngeschreven(Boolean landVanwaarIngeschreven) {
    
    this.landVanwaarIngeschreven = landVanwaarIngeschreven;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return landVanwaarIngeschreven
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getLandVanwaarIngeschreven() {
    return landVanwaarIngeschreven;
  }


  public void setLandVanwaarIngeschreven(Boolean landVanwaarIngeschreven) {
    this.landVanwaarIngeschreven = landVanwaarIngeschreven;
  }


  public VerblijfplaatsInOnderzoek locatiebeschrijving(Boolean locatiebeschrijving) {
    
    this.locatiebeschrijving = locatiebeschrijving;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return locatiebeschrijving
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getLocatiebeschrijving() {
    return locatiebeschrijving;
  }


  public void setLocatiebeschrijving(Boolean locatiebeschrijving) {
    this.locatiebeschrijving = locatiebeschrijving;
  }


  public VerblijfplaatsInOnderzoek naamOpenbareRuimte(Boolean naamOpenbareRuimte) {
    
    this.naamOpenbareRuimte = naamOpenbareRuimte;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return naamOpenbareRuimte
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getNaamOpenbareRuimte() {
    return naamOpenbareRuimte;
  }


  public void setNaamOpenbareRuimte(Boolean naamOpenbareRuimte) {
    this.naamOpenbareRuimte = naamOpenbareRuimte;
  }


  public VerblijfplaatsInOnderzoek postcode(Boolean postcode) {
    
    this.postcode = postcode;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return postcode
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getPostcode() {
    return postcode;
  }


  public void setPostcode(Boolean postcode) {
    this.postcode = postcode;
  }


  public VerblijfplaatsInOnderzoek straatnaam(Boolean straatnaam) {
    
    this.straatnaam = straatnaam;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return straatnaam
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getStraatnaam() {
    return straatnaam;
  }


  public void setStraatnaam(Boolean straatnaam) {
    this.straatnaam = straatnaam;
  }


  public VerblijfplaatsInOnderzoek verblijfBuitenland(Boolean verblijfBuitenland) {
    
    this.verblijfBuitenland = verblijfBuitenland;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return verblijfBuitenland
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getVerblijfBuitenland() {
    return verblijfBuitenland;
  }


  public void setVerblijfBuitenland(Boolean verblijfBuitenland) {
    this.verblijfBuitenland = verblijfBuitenland;
  }


  public VerblijfplaatsInOnderzoek woonplaatsnaam(Boolean woonplaatsnaam) {
    
    this.woonplaatsnaam = woonplaatsnaam;
    return this;
  }

   /**
   * Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
   * @return woonplaatsnaam
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.")

  public Boolean getWoonplaatsnaam() {
    return woonplaatsnaam;
  }


  public void setWoonplaatsnaam(Boolean woonplaatsnaam) {
    this.woonplaatsnaam = woonplaatsnaam;
  }


  public VerblijfplaatsInOnderzoek datumIngangOnderzoek(DatumOnvolledig datumIngangOnderzoek) {
    
    this.datumIngangOnderzoek = datumIngangOnderzoek;
    return this;
  }

   /**
   * Get datumIngangOnderzoek
   * @return datumIngangOnderzoek
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public DatumOnvolledig getDatumIngangOnderzoek() {
    return datumIngangOnderzoek;
  }


  public void setDatumIngangOnderzoek(DatumOnvolledig datumIngangOnderzoek) {
    this.datumIngangOnderzoek = datumIngangOnderzoek;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    VerblijfplaatsInOnderzoek verblijfplaatsInOnderzoek = (VerblijfplaatsInOnderzoek) o;
    return Objects.equals(this.aanduidingBijHuisnummer, verblijfplaatsInOnderzoek.aanduidingBijHuisnummer) &&
        Objects.equals(this.datumAanvangAdreshouding, verblijfplaatsInOnderzoek.datumAanvangAdreshouding) &&
        Objects.equals(this.datumIngangGeldigheid, verblijfplaatsInOnderzoek.datumIngangGeldigheid) &&
        Objects.equals(this.datumInschrijvingInGemeente, verblijfplaatsInOnderzoek.datumInschrijvingInGemeente) &&
        Objects.equals(this.datumVestigingInNederland, verblijfplaatsInOnderzoek.datumVestigingInNederland) &&
        Objects.equals(this.functieAdres, verblijfplaatsInOnderzoek.functieAdres) &&
        Objects.equals(this.gemeenteVanInschrijving, verblijfplaatsInOnderzoek.gemeenteVanInschrijving) &&
        Objects.equals(this.huisletter, verblijfplaatsInOnderzoek.huisletter) &&
        Objects.equals(this.huisnummer, verblijfplaatsInOnderzoek.huisnummer) &&
        Objects.equals(this.huisnummertoevoeging, verblijfplaatsInOnderzoek.huisnummertoevoeging) &&
        Objects.equals(this.identificatiecodeNummeraanduiding, verblijfplaatsInOnderzoek.identificatiecodeNummeraanduiding) &&
        Objects.equals(this.identificatiecodeAdresseerbaarObject, verblijfplaatsInOnderzoek.identificatiecodeAdresseerbaarObject) &&
        Objects.equals(this.landVanwaarIngeschreven, verblijfplaatsInOnderzoek.landVanwaarIngeschreven) &&
        Objects.equals(this.locatiebeschrijving, verblijfplaatsInOnderzoek.locatiebeschrijving) &&
        Objects.equals(this.naamOpenbareRuimte, verblijfplaatsInOnderzoek.naamOpenbareRuimte) &&
        Objects.equals(this.postcode, verblijfplaatsInOnderzoek.postcode) &&
        Objects.equals(this.straatnaam, verblijfplaatsInOnderzoek.straatnaam) &&
        Objects.equals(this.verblijfBuitenland, verblijfplaatsInOnderzoek.verblijfBuitenland) &&
        Objects.equals(this.woonplaatsnaam, verblijfplaatsInOnderzoek.woonplaatsnaam) &&
        Objects.equals(this.datumIngangOnderzoek, verblijfplaatsInOnderzoek.datumIngangOnderzoek);
  }

  @Override
  public int hashCode() {
    return Objects.hash(aanduidingBijHuisnummer, datumAanvangAdreshouding, datumIngangGeldigheid, datumInschrijvingInGemeente, datumVestigingInNederland, functieAdres, gemeenteVanInschrijving, huisletter, huisnummer, huisnummertoevoeging, identificatiecodeNummeraanduiding, identificatiecodeAdresseerbaarObject, landVanwaarIngeschreven, locatiebeschrijving, naamOpenbareRuimte, postcode, straatnaam, verblijfBuitenland, woonplaatsnaam, datumIngangOnderzoek);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class VerblijfplaatsInOnderzoek {\n");
    sb.append("    aanduidingBijHuisnummer: ").append(toIndentedString(aanduidingBijHuisnummer)).append("\n");
    sb.append("    datumAanvangAdreshouding: ").append(toIndentedString(datumAanvangAdreshouding)).append("\n");
    sb.append("    datumIngangGeldigheid: ").append(toIndentedString(datumIngangGeldigheid)).append("\n");
    sb.append("    datumInschrijvingInGemeente: ").append(toIndentedString(datumInschrijvingInGemeente)).append("\n");
    sb.append("    datumVestigingInNederland: ").append(toIndentedString(datumVestigingInNederland)).append("\n");
    sb.append("    functieAdres: ").append(toIndentedString(functieAdres)).append("\n");
    sb.append("    gemeenteVanInschrijving: ").append(toIndentedString(gemeenteVanInschrijving)).append("\n");
    sb.append("    huisletter: ").append(toIndentedString(huisletter)).append("\n");
    sb.append("    huisnummer: ").append(toIndentedString(huisnummer)).append("\n");
    sb.append("    huisnummertoevoeging: ").append(toIndentedString(huisnummertoevoeging)).append("\n");
    sb.append("    identificatiecodeNummeraanduiding: ").append(toIndentedString(identificatiecodeNummeraanduiding)).append("\n");
    sb.append("    identificatiecodeAdresseerbaarObject: ").append(toIndentedString(identificatiecodeAdresseerbaarObject)).append("\n");
    sb.append("    landVanwaarIngeschreven: ").append(toIndentedString(landVanwaarIngeschreven)).append("\n");
    sb.append("    locatiebeschrijving: ").append(toIndentedString(locatiebeschrijving)).append("\n");
    sb.append("    naamOpenbareRuimte: ").append(toIndentedString(naamOpenbareRuimte)).append("\n");
    sb.append("    postcode: ").append(toIndentedString(postcode)).append("\n");
    sb.append("    straatnaam: ").append(toIndentedString(straatnaam)).append("\n");
    sb.append("    verblijfBuitenland: ").append(toIndentedString(verblijfBuitenland)).append("\n");
    sb.append("    woonplaatsnaam: ").append(toIndentedString(woonplaatsnaam)).append("\n");
    sb.append("    datumIngangOnderzoek: ").append(toIndentedString(datumIngangOnderzoek)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}

