/* 
 * Bevragen Ingeschreven Personen
 *
 * API voor het bevragen van ingeschreven personen uit de basisregistratie personen (BRP), inclusief de registratie niet-ingezeten (RNI). Met deze API kun je personen zoeken en actuele gegevens over personen, kinderen, partners en ouders raadplegen.  Gegevens die er niet zijn of niet actueel zijn krijg je niet terug. Heeft een persoon bijvoorbeeld geen geldige nationaliteit, en alleen een beëindigd partnerschap, dan krijg je geen gegevens over nationaliteit en partner.  Zie de [Functionele documentatie](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/tree/v1.1.0/features) voor nadere toelichting. 
 *
 * The version of the OpenAPI document: 1.2.0
 * 
 * Generated by: https://github.com/openapitools/openapi-generator.git
 */

using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.ComponentModel.DataAnnotations;
using OpenAPIDateConverter = Org.OpenAPITools.Client.OpenAPIDateConverter;

namespace Org.OpenAPITools.Model
{
    /// <summary>
    /// NaamPersoonInOnderzoek
    /// </summary>
    [DataContract]
    public partial class NaamPersoonInOnderzoek :  IEquatable<NaamPersoonInOnderzoek>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="NaamPersoonInOnderzoek" /> class.
        /// </summary>
        /// <param name="geslachtsnaam">geslachtsnaam.</param>
        /// <param name="voornamen">voornamen.</param>
        /// <param name="voorvoegsel">voorvoegsel.</param>
        /// <param name="adellijkeTitelPredikaat">adellijkeTitelPredikaat.</param>
        /// <param name="datumIngangOnderzoek">datumIngangOnderzoek.</param>
        /// <param name="aanduidingNaamgebruik">aanduidingNaamgebruik.</param>
        public NaamPersoonInOnderzoek(bool geslachtsnaam = default(bool), bool voornamen = default(bool), bool voorvoegsel = default(bool), bool adellijkeTitelPredikaat = default(bool), DatumOnvolledig datumIngangOnderzoek = default(DatumOnvolledig), bool aanduidingNaamgebruik = default(bool))
        {
            this.Geslachtsnaam = geslachtsnaam;
            this.Voornamen = voornamen;
            this.Voorvoegsel = voorvoegsel;
            this.AdellijkeTitelPredikaat = adellijkeTitelPredikaat;
            this.DatumIngangOnderzoek = datumIngangOnderzoek;
            this.AanduidingNaamgebruik = aanduidingNaamgebruik;
        }
        
        /// <summary>
        /// Gets or Sets Geslachtsnaam
        /// </summary>
        [DataMember(Name="geslachtsnaam", EmitDefaultValue=false)]
        public bool Geslachtsnaam { get; set; }

        /// <summary>
        /// Gets or Sets Voornamen
        /// </summary>
        [DataMember(Name="voornamen", EmitDefaultValue=false)]
        public bool Voornamen { get; set; }

        /// <summary>
        /// Gets or Sets Voorvoegsel
        /// </summary>
        [DataMember(Name="voorvoegsel", EmitDefaultValue=false)]
        public bool Voorvoegsel { get; set; }

        /// <summary>
        /// Gets or Sets AdellijkeTitelPredikaat
        /// </summary>
        [DataMember(Name="adellijkeTitelPredikaat", EmitDefaultValue=false)]
        public bool AdellijkeTitelPredikaat { get; set; }

        /// <summary>
        /// Gets or Sets DatumIngangOnderzoek
        /// </summary>
        [DataMember(Name="datumIngangOnderzoek", EmitDefaultValue=false)]
        public DatumOnvolledig DatumIngangOnderzoek { get; set; }

        /// <summary>
        /// Gets or Sets AanduidingNaamgebruik
        /// </summary>
        [DataMember(Name="aanduidingNaamgebruik", EmitDefaultValue=false)]
        public bool AanduidingNaamgebruik { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class NaamPersoonInOnderzoek {\n");
            sb.Append("  Geslachtsnaam: ").Append(Geslachtsnaam).Append("\n");
            sb.Append("  Voornamen: ").Append(Voornamen).Append("\n");
            sb.Append("  Voorvoegsel: ").Append(Voorvoegsel).Append("\n");
            sb.Append("  AdellijkeTitelPredikaat: ").Append(AdellijkeTitelPredikaat).Append("\n");
            sb.Append("  DatumIngangOnderzoek: ").Append(DatumIngangOnderzoek).Append("\n");
            sb.Append("  AanduidingNaamgebruik: ").Append(AanduidingNaamgebruik).Append("\n");
            sb.Append("}\n");
            return sb.ToString();
        }
  
        /// <summary>
        /// Returns the JSON string presentation of the object
        /// </summary>
        /// <returns>JSON string presentation of the object</returns>
        public virtual string ToJson()
        {
            return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="input">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override bool Equals(object input)
        {
            return this.Equals(input as NaamPersoonInOnderzoek);
        }

        /// <summary>
        /// Returns true if NaamPersoonInOnderzoek instances are equal
        /// </summary>
        /// <param name="input">Instance of NaamPersoonInOnderzoek to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(NaamPersoonInOnderzoek input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Geslachtsnaam == input.Geslachtsnaam ||
                    (this.Geslachtsnaam != null &&
                    this.Geslachtsnaam.Equals(input.Geslachtsnaam))
                ) && 
                (
                    this.Voornamen == input.Voornamen ||
                    (this.Voornamen != null &&
                    this.Voornamen.Equals(input.Voornamen))
                ) && 
                (
                    this.Voorvoegsel == input.Voorvoegsel ||
                    (this.Voorvoegsel != null &&
                    this.Voorvoegsel.Equals(input.Voorvoegsel))
                ) && 
                (
                    this.AdellijkeTitelPredikaat == input.AdellijkeTitelPredikaat ||
                    (this.AdellijkeTitelPredikaat != null &&
                    this.AdellijkeTitelPredikaat.Equals(input.AdellijkeTitelPredikaat))
                ) && 
                (
                    this.DatumIngangOnderzoek == input.DatumIngangOnderzoek ||
                    (this.DatumIngangOnderzoek != null &&
                    this.DatumIngangOnderzoek.Equals(input.DatumIngangOnderzoek))
                ) && 
                (
                    this.AanduidingNaamgebruik == input.AanduidingNaamgebruik ||
                    (this.AanduidingNaamgebruik != null &&
                    this.AanduidingNaamgebruik.Equals(input.AanduidingNaamgebruik))
                );
        }

        /// <summary>
        /// Gets the hash code
        /// </summary>
        /// <returns>Hash code</returns>
        public override int GetHashCode()
        {
            unchecked // Overflow is fine, just wrap
            {
                int hashCode = 41;
                if (this.Geslachtsnaam != null)
                    hashCode = hashCode * 59 + this.Geslachtsnaam.GetHashCode();
                if (this.Voornamen != null)
                    hashCode = hashCode * 59 + this.Voornamen.GetHashCode();
                if (this.Voorvoegsel != null)
                    hashCode = hashCode * 59 + this.Voorvoegsel.GetHashCode();
                if (this.AdellijkeTitelPredikaat != null)
                    hashCode = hashCode * 59 + this.AdellijkeTitelPredikaat.GetHashCode();
                if (this.DatumIngangOnderzoek != null)
                    hashCode = hashCode * 59 + this.DatumIngangOnderzoek.GetHashCode();
                if (this.AanduidingNaamgebruik != null)
                    hashCode = hashCode * 59 + this.AanduidingNaamgebruik.GetHashCode();
                return hashCode;
            }
        }

        /// <summary>
        /// To validate all properties of the instance
        /// </summary>
        /// <param name="validationContext">Validation context</param>
        /// <returns>Validation Result</returns>
        IEnumerable<System.ComponentModel.DataAnnotations.ValidationResult> IValidatableObject.Validate(ValidationContext validationContext)
        {
            yield break;
        }
    }

}
