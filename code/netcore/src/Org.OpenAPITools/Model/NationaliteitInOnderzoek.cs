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
    /// Een groep van booleans om aan te geven welke gegevens van de nationaliteit in onderzoek zijn. Als een de categorie in onderzoek is worden alle rubrieken binnen die categorie op _true_ gezet. Zie de [functionele specificaties](https://github.com/VNG-Realisatie/Bevragingen-ingeschreven-personen/blob/master/features/in_onderzoek.feature)
    /// </summary>
    [DataContract]
    public partial class NationaliteitInOnderzoek :  IEquatable<NationaliteitInOnderzoek>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="NationaliteitInOnderzoek" /> class.
        /// </summary>
        /// <param name="aanduidingBijzonderNederlanderschap">Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is..</param>
        /// <param name="nationaliteit">Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is..</param>
        /// <param name="redenOpname">Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is..</param>
        /// <param name="datumIngangOnderzoek">datumIngangOnderzoek.</param>
        public NationaliteitInOnderzoek(bool aanduidingBijzonderNederlanderschap = default(bool), bool nationaliteit = default(bool), bool redenOpname = default(bool), DatumOnvolledig datumIngangOnderzoek = default(DatumOnvolledig))
        {
            this.AanduidingBijzonderNederlanderschap = aanduidingBijzonderNederlanderschap;
            this.Nationaliteit = nationaliteit;
            this.RedenOpname = redenOpname;
            this.DatumIngangOnderzoek = datumIngangOnderzoek;
        }
        
        /// <summary>
        /// Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
        /// </summary>
        /// <value>Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.</value>
        [DataMember(Name="aanduidingBijzonderNederlanderschap", EmitDefaultValue=false)]
        public bool AanduidingBijzonderNederlanderschap { get; set; }

        /// <summary>
        /// Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
        /// </summary>
        /// <value>Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.</value>
        [DataMember(Name="nationaliteit", EmitDefaultValue=false)]
        public bool Nationaliteit { get; set; }

        /// <summary>
        /// Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.
        /// </summary>
        /// <value>Indicator die aangeeft of het corresponderende gegeven voor deze persoon in onderzoek is.</value>
        [DataMember(Name="redenOpname", EmitDefaultValue=false)]
        public bool RedenOpname { get; set; }

        /// <summary>
        /// Gets or Sets DatumIngangOnderzoek
        /// </summary>
        [DataMember(Name="datumIngangOnderzoek", EmitDefaultValue=false)]
        public DatumOnvolledig DatumIngangOnderzoek { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class NationaliteitInOnderzoek {\n");
            sb.Append("  AanduidingBijzonderNederlanderschap: ").Append(AanduidingBijzonderNederlanderschap).Append("\n");
            sb.Append("  Nationaliteit: ").Append(Nationaliteit).Append("\n");
            sb.Append("  RedenOpname: ").Append(RedenOpname).Append("\n");
            sb.Append("  DatumIngangOnderzoek: ").Append(DatumIngangOnderzoek).Append("\n");
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
            return this.Equals(input as NationaliteitInOnderzoek);
        }

        /// <summary>
        /// Returns true if NationaliteitInOnderzoek instances are equal
        /// </summary>
        /// <param name="input">Instance of NationaliteitInOnderzoek to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(NationaliteitInOnderzoek input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.AanduidingBijzonderNederlanderschap == input.AanduidingBijzonderNederlanderschap ||
                    this.AanduidingBijzonderNederlanderschap.Equals(input.AanduidingBijzonderNederlanderschap)
                ) && 
                (
                    this.Nationaliteit == input.Nationaliteit ||
                    this.Nationaliteit.Equals(input.Nationaliteit)
                ) && 
                (
                    this.RedenOpname == input.RedenOpname ||
                    this.RedenOpname.Equals(input.RedenOpname)
                ) && 
                (
                    this.DatumIngangOnderzoek == input.DatumIngangOnderzoek ||
                    (this.DatumIngangOnderzoek != null &&
                    this.DatumIngangOnderzoek.Equals(input.DatumIngangOnderzoek))
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
                hashCode = hashCode * 59 + this.AanduidingBijzonderNederlanderschap.GetHashCode();
                hashCode = hashCode * 59 + this.Nationaliteit.GetHashCode();
                hashCode = hashCode * 59 + this.RedenOpname.GetHashCode();
                if (this.DatumIngangOnderzoek != null)
                    hashCode = hashCode * 59 + this.DatumIngangOnderzoek.GetHashCode();
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
