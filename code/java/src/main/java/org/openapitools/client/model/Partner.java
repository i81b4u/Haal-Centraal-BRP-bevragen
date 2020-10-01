/*
 * Bevragen Ingeschreven Personen
 * API voor het bevragen van ingeschreven personen uit de basisregistratie personen (BRP), inclusief de registratie niet-ingezeten (RNI). Met deze API kun je personen zoeken en actuele gegevens over personen, kinderen, partners en ouders raadplegen.  Gegevens die er niet zijn of niet actueel zijn krijg je niet terug. Heeft een persoon bijvoorbeeld geen geldige nationaliteit, en alleen een beëindigd partnerschap, dan krijg je geen gegevens over nationaliteit en partner.  Zie de [Functionele documentatie](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/tree/v1.0.0/features) voor nadere toelichting. 
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
import org.openapitools.client.model.AangaanHuwelijkPartnerschap;
import org.openapitools.client.model.Geboorte;
import org.openapitools.client.model.GeslachtEnum;
import org.openapitools.client.model.Naam;
import org.openapitools.client.model.PartnerInOnderzoek;
import org.openapitools.client.model.SoortVerbintenisEnum;

/**
 * Gegevens over een gesloten huwelijk/geregistreerd partnerschap van de persoon. 
 */
@ApiModel(description = "Gegevens over een gesloten huwelijk/geregistreerd partnerschap van de persoon. ")
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2020-10-01T11:34:05.460Z[Etc/UTC]")
public class Partner {
  public static final String SERIALIZED_NAME_BURGERSERVICENUMMER = "burgerservicenummer";
  @SerializedName(SERIALIZED_NAME_BURGERSERVICENUMMER)
  private String burgerservicenummer;

  public static final String SERIALIZED_NAME_GESLACHTSAANDUIDING = "geslachtsaanduiding";
  @SerializedName(SERIALIZED_NAME_GESLACHTSAANDUIDING)
  private GeslachtEnum geslachtsaanduiding;

  public static final String SERIALIZED_NAME_SOORT_VERBINTENIS = "soortVerbintenis";
  @SerializedName(SERIALIZED_NAME_SOORT_VERBINTENIS)
  private SoortVerbintenisEnum soortVerbintenis;

  public static final String SERIALIZED_NAME_NAAM = "naam";
  @SerializedName(SERIALIZED_NAME_NAAM)
  private Naam naam;

  public static final String SERIALIZED_NAME_GEBOORTE = "geboorte";
  @SerializedName(SERIALIZED_NAME_GEBOORTE)
  private Geboorte geboorte = null;

  public static final String SERIALIZED_NAME_IN_ONDERZOEK = "inOnderzoek";
  @SerializedName(SERIALIZED_NAME_IN_ONDERZOEK)
  private PartnerInOnderzoek inOnderzoek;

  public static final String SERIALIZED_NAME_AANGAAN_HUWELIJK_PARTNERSCHAP = "aangaanHuwelijkPartnerschap";
  @SerializedName(SERIALIZED_NAME_AANGAAN_HUWELIJK_PARTNERSCHAP)
  private AangaanHuwelijkPartnerschap aangaanHuwelijkPartnerschap;

  public static final String SERIALIZED_NAME_GEHEIMHOUDING_PERSOONSGEGEVENS = "geheimhoudingPersoonsgegevens";
  @SerializedName(SERIALIZED_NAME_GEHEIMHOUDING_PERSOONSGEGEVENS)
  private Boolean geheimhoudingPersoonsgegevens;


  public Partner burgerservicenummer(String burgerservicenummer) {
    
    this.burgerservicenummer = burgerservicenummer;
    return this;
  }

   /**
   * Get burgerservicenummer
   * @return burgerservicenummer
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "555555021", value = "")

  public String getBurgerservicenummer() {
    return burgerservicenummer;
  }


  public void setBurgerservicenummer(String burgerservicenummer) {
    this.burgerservicenummer = burgerservicenummer;
  }


  public Partner geslachtsaanduiding(GeslachtEnum geslachtsaanduiding) {
    
    this.geslachtsaanduiding = geslachtsaanduiding;
    return this;
  }

   /**
   * Get geslachtsaanduiding
   * @return geslachtsaanduiding
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public GeslachtEnum getGeslachtsaanduiding() {
    return geslachtsaanduiding;
  }


  public void setGeslachtsaanduiding(GeslachtEnum geslachtsaanduiding) {
    this.geslachtsaanduiding = geslachtsaanduiding;
  }


  public Partner soortVerbintenis(SoortVerbintenisEnum soortVerbintenis) {
    
    this.soortVerbintenis = soortVerbintenis;
    return this;
  }

   /**
   * Get soortVerbintenis
   * @return soortVerbintenis
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public SoortVerbintenisEnum getSoortVerbintenis() {
    return soortVerbintenis;
  }


  public void setSoortVerbintenis(SoortVerbintenisEnum soortVerbintenis) {
    this.soortVerbintenis = soortVerbintenis;
  }


  public Partner naam(Naam naam) {
    
    this.naam = naam;
    return this;
  }

   /**
   * Get naam
   * @return naam
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public Naam getNaam() {
    return naam;
  }


  public void setNaam(Naam naam) {
    this.naam = naam;
  }


  public Partner geboorte(Geboorte geboorte) {
    
    this.geboorte = geboorte;
    return this;
  }

   /**
   * Get geboorte
   * @return geboorte
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public Geboorte getGeboorte() {
    return geboorte;
  }


  public void setGeboorte(Geboorte geboorte) {
    this.geboorte = geboorte;
  }


  public Partner inOnderzoek(PartnerInOnderzoek inOnderzoek) {
    
    this.inOnderzoek = inOnderzoek;
    return this;
  }

   /**
   * Get inOnderzoek
   * @return inOnderzoek
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public PartnerInOnderzoek getInOnderzoek() {
    return inOnderzoek;
  }


  public void setInOnderzoek(PartnerInOnderzoek inOnderzoek) {
    this.inOnderzoek = inOnderzoek;
  }


  public Partner aangaanHuwelijkPartnerschap(AangaanHuwelijkPartnerschap aangaanHuwelijkPartnerschap) {
    
    this.aangaanHuwelijkPartnerschap = aangaanHuwelijkPartnerschap;
    return this;
  }

   /**
   * Get aangaanHuwelijkPartnerschap
   * @return aangaanHuwelijkPartnerschap
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public AangaanHuwelijkPartnerschap getAangaanHuwelijkPartnerschap() {
    return aangaanHuwelijkPartnerschap;
  }


  public void setAangaanHuwelijkPartnerschap(AangaanHuwelijkPartnerschap aangaanHuwelijkPartnerschap) {
    this.aangaanHuwelijkPartnerschap = aangaanHuwelijkPartnerschap;
  }


  public Partner geheimhoudingPersoonsgegevens(Boolean geheimhoudingPersoonsgegevens) {
    
    this.geheimhoudingPersoonsgegevens = geheimhoudingPersoonsgegevens;
    return this;
  }

   /**
   * Gegevens mogen niet worden verstrekt aan derden/ maatschappelijke instellingen. 
   * @return geheimhoudingPersoonsgegevens
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Gegevens mogen niet worden verstrekt aan derden/ maatschappelijke instellingen. ")

  public Boolean getGeheimhoudingPersoonsgegevens() {
    return geheimhoudingPersoonsgegevens;
  }


  public void setGeheimhoudingPersoonsgegevens(Boolean geheimhoudingPersoonsgegevens) {
    this.geheimhoudingPersoonsgegevens = geheimhoudingPersoonsgegevens;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Partner partner = (Partner) o;
    return Objects.equals(this.burgerservicenummer, partner.burgerservicenummer) &&
        Objects.equals(this.geslachtsaanduiding, partner.geslachtsaanduiding) &&
        Objects.equals(this.soortVerbintenis, partner.soortVerbintenis) &&
        Objects.equals(this.naam, partner.naam) &&
        Objects.equals(this.geboorte, partner.geboorte) &&
        Objects.equals(this.inOnderzoek, partner.inOnderzoek) &&
        Objects.equals(this.aangaanHuwelijkPartnerschap, partner.aangaanHuwelijkPartnerschap) &&
        Objects.equals(this.geheimhoudingPersoonsgegevens, partner.geheimhoudingPersoonsgegevens);
  }

  @Override
  public int hashCode() {
    return Objects.hash(burgerservicenummer, geslachtsaanduiding, soortVerbintenis, naam, geboorte, inOnderzoek, aangaanHuwelijkPartnerschap, geheimhoudingPersoonsgegevens);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Partner {\n");
    sb.append("    burgerservicenummer: ").append(toIndentedString(burgerservicenummer)).append("\n");
    sb.append("    geslachtsaanduiding: ").append(toIndentedString(geslachtsaanduiding)).append("\n");
    sb.append("    soortVerbintenis: ").append(toIndentedString(soortVerbintenis)).append("\n");
    sb.append("    naam: ").append(toIndentedString(naam)).append("\n");
    sb.append("    geboorte: ").append(toIndentedString(geboorte)).append("\n");
    sb.append("    inOnderzoek: ").append(toIndentedString(inOnderzoek)).append("\n");
    sb.append("    aangaanHuwelijkPartnerschap: ").append(toIndentedString(aangaanHuwelijkPartnerschap)).append("\n");
    sb.append("    geheimhoudingPersoonsgegevens: ").append(toIndentedString(geheimhoudingPersoonsgegevens)).append("\n");
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
