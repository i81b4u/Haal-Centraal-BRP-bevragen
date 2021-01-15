/*
 * Bevragen Ingeschreven Personen
 * API voor het bevragen van ingeschreven personen uit de basisregistratie personen (BRP), inclusief de registratie niet-ingezeten (RNI). Met deze API kun je personen zoeken en actuele gegevens over personen, kinderen, partners en ouders raadplegen.  Gegevens die er niet zijn of niet actueel zijn krijg je niet terug. Heeft een persoon bijvoorbeeld geen geldige nationaliteit, en alleen een beëindigd partnerschap, dan krijg je geen gegevens over nationaliteit en partner.  Zie de [Functionele documentatie](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/tree/v1.1.0/features) voor nadere toelichting. 
 *
 * The version of the OpenAPI document: 1.2.0
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
import org.openapitools.client.model.GezagsverhoudingInOnderzoek;
import org.openapitools.client.model.IndicatieGezagMinderjarigeEnum;

/**
 * Gegevens over het gezag over de persoon. 
 */
@ApiModel(description = "Gegevens over het gezag over de persoon. ")
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2021-01-15T14:09:29.205Z[Etc/UTC]")
public class Gezagsverhouding {
  public static final String SERIALIZED_NAME_INDICATIE_CURATELE_REGISTER = "indicatieCurateleRegister";
  @SerializedName(SERIALIZED_NAME_INDICATIE_CURATELE_REGISTER)
  private Boolean indicatieCurateleRegister;

  public static final String SERIALIZED_NAME_INDICATIE_GEZAG_MINDERJARIGE = "indicatieGezagMinderjarige";
  @SerializedName(SERIALIZED_NAME_INDICATIE_GEZAG_MINDERJARIGE)
  private IndicatieGezagMinderjarigeEnum indicatieGezagMinderjarige;

  public static final String SERIALIZED_NAME_IN_ONDERZOEK = "inOnderzoek";
  @SerializedName(SERIALIZED_NAME_IN_ONDERZOEK)
  private GezagsverhoudingInOnderzoek inOnderzoek;


  public Gezagsverhouding indicatieCurateleRegister(Boolean indicatieCurateleRegister) {
    
    this.indicatieCurateleRegister = indicatieCurateleRegister;
    return this;
  }

   /**
   * Geeft aan dat de persoon onder curatele is gesteld. 
   * @return indicatieCurateleRegister
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "true", value = "Geeft aan dat de persoon onder curatele is gesteld. ")

  public Boolean getIndicatieCurateleRegister() {
    return indicatieCurateleRegister;
  }


  public void setIndicatieCurateleRegister(Boolean indicatieCurateleRegister) {
    this.indicatieCurateleRegister = indicatieCurateleRegister;
  }


  public Gezagsverhouding indicatieGezagMinderjarige(IndicatieGezagMinderjarigeEnum indicatieGezagMinderjarige) {
    
    this.indicatieGezagMinderjarige = indicatieGezagMinderjarige;
    return this;
  }

   /**
   * Get indicatieGezagMinderjarige
   * @return indicatieGezagMinderjarige
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public IndicatieGezagMinderjarigeEnum getIndicatieGezagMinderjarige() {
    return indicatieGezagMinderjarige;
  }


  public void setIndicatieGezagMinderjarige(IndicatieGezagMinderjarigeEnum indicatieGezagMinderjarige) {
    this.indicatieGezagMinderjarige = indicatieGezagMinderjarige;
  }


  public Gezagsverhouding inOnderzoek(GezagsverhoudingInOnderzoek inOnderzoek) {
    
    this.inOnderzoek = inOnderzoek;
    return this;
  }

   /**
   * Get inOnderzoek
   * @return inOnderzoek
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public GezagsverhoudingInOnderzoek getInOnderzoek() {
    return inOnderzoek;
  }


  public void setInOnderzoek(GezagsverhoudingInOnderzoek inOnderzoek) {
    this.inOnderzoek = inOnderzoek;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Gezagsverhouding gezagsverhouding = (Gezagsverhouding) o;
    return Objects.equals(this.indicatieCurateleRegister, gezagsverhouding.indicatieCurateleRegister) &&
        Objects.equals(this.indicatieGezagMinderjarige, gezagsverhouding.indicatieGezagMinderjarige) &&
        Objects.equals(this.inOnderzoek, gezagsverhouding.inOnderzoek);
  }

  @Override
  public int hashCode() {
    return Objects.hash(indicatieCurateleRegister, indicatieGezagMinderjarige, inOnderzoek);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Gezagsverhouding {\n");
    sb.append("    indicatieCurateleRegister: ").append(toIndentedString(indicatieCurateleRegister)).append("\n");
    sb.append("    indicatieGezagMinderjarige: ").append(toIndentedString(indicatieGezagMinderjarige)).append("\n");
    sb.append("    inOnderzoek: ").append(toIndentedString(inOnderzoek)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}

