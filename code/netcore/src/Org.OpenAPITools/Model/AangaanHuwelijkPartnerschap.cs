/* 
 * Bevragingen ingeschreven personen
 *
 * API voor het ontsluiten van gegevens van ingeschreven personen en aanverwante gegevens uit de GBA en RNI. Met deze API worden de actuele gegevens van ingeschreven personen, hun kinderen, partners en ouders ontsloten. <br> Heeft een persoon bijvoorbeeld geen geldige nationaliteit, dan wordt nationaliteit niet geretourneerd. <br> Heeft een persoon een beëindigd partnerschap of huwelijk, dan wordt de partner niet geretourneerd. <br> <br> Zie de [Functionele documentatie](https://github.com/VNG-Realisatie/Bevragingen-ingeschreven-personen/tree/master/features) voor nadere toelichting. <br> 
 *
 * The version of the OpenAPI document: 1.0.0
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
    /// Gegevens over het gesloten huwelijk of het aangegane geregistreerd partnerschap.  * **datum** : De datum waarop het huwelijk is voltrokken of het partnerschap is aangegaan.  * **land** : Het land waar het huwelijk is voltrokken of het partnerschap is aangegaan.  * **plaats** : Als de plaats een gemeente in Nederland is dan gewoon de gemeentecode + gemeentenaam . Voor een plaats buiten Nederland is de gemeentecode leeg en wordt de gemeentenaam de buitenlandse plaatsnaam of aanduiding.
    /// </summary>
    [DataContract]
    public partial class AangaanHuwelijkPartnerschap :  IEquatable<AangaanHuwelijkPartnerschap>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="AangaanHuwelijkPartnerschap" /> class.
        /// </summary>
        /// <param name="datum">datum.</param>
        /// <param name="land">land.</param>
        /// <param name="plaats">plaats.</param>
        /// <param name="inOnderzoek">inOnderzoek.</param>
        public AangaanHuwelijkPartnerschap(DatumOnvolledig datum = default(DatumOnvolledig), Waardetabel land = default(Waardetabel), Waardetabel plaats = default(Waardetabel), AangaanHuwelijkInOnderzoek inOnderzoek = default(AangaanHuwelijkInOnderzoek))
        {
            this.Datum = datum;
            this.Land = land;
            this.Plaats = plaats;
            this.InOnderzoek = inOnderzoek;
        }
        
        /// <summary>
        /// Gets or Sets Datum
        /// </summary>
        [DataMember(Name="datum", EmitDefaultValue=false)]
        public DatumOnvolledig Datum { get; set; }

        /// <summary>
        /// Gets or Sets Land
        /// </summary>
        [DataMember(Name="land", EmitDefaultValue=false)]
        public Waardetabel Land { get; set; }

        /// <summary>
        /// Gets or Sets Plaats
        /// </summary>
        [DataMember(Name="plaats", EmitDefaultValue=false)]
        public Waardetabel Plaats { get; set; }

        /// <summary>
        /// Gets or Sets InOnderzoek
        /// </summary>
        [DataMember(Name="inOnderzoek", EmitDefaultValue=false)]
        public AangaanHuwelijkInOnderzoek InOnderzoek { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class AangaanHuwelijkPartnerschap {\n");
            sb.Append("  Datum: ").Append(Datum).Append("\n");
            sb.Append("  Land: ").Append(Land).Append("\n");
            sb.Append("  Plaats: ").Append(Plaats).Append("\n");
            sb.Append("  InOnderzoek: ").Append(InOnderzoek).Append("\n");
            sb.Append("}\n");
            return sb.ToString();
        }
  
        /// <summary>
        /// Returns the JSON string presentation of the object
        /// </summary>
        /// <returns>JSON string presentation of the object</returns>
        public virtual string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="input">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override bool Equals(object input)
        {
            return this.Equals(input as AangaanHuwelijkPartnerschap);
        }

        /// <summary>
        /// Returns true if AangaanHuwelijkPartnerschap instances are equal
        /// </summary>
        /// <param name="input">Instance of AangaanHuwelijkPartnerschap to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(AangaanHuwelijkPartnerschap input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Datum == input.Datum ||
                    (this.Datum != null &&
                    this.Datum.Equals(input.Datum))
                ) && 
                (
                    this.Land == input.Land ||
                    (this.Land != null &&
                    this.Land.Equals(input.Land))
                ) && 
                (
                    this.Plaats == input.Plaats ||
                    (this.Plaats != null &&
                    this.Plaats.Equals(input.Plaats))
                ) && 
                (
                    this.InOnderzoek == input.InOnderzoek ||
                    (this.InOnderzoek != null &&
                    this.InOnderzoek.Equals(input.InOnderzoek))
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
                if (this.Datum != null)
                    hashCode = hashCode * 59 + this.Datum.GetHashCode();
                if (this.Land != null)
                    hashCode = hashCode * 59 + this.Land.GetHashCode();
                if (this.Plaats != null)
                    hashCode = hashCode * 59 + this.Plaats.GetHashCode();
                if (this.InOnderzoek != null)
                    hashCode = hashCode * 59 + this.InOnderzoek.GetHashCode();
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
