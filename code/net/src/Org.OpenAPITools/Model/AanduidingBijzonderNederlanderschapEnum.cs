/* 
 * Bevragen Ingeschreven Personen
 *
 * API voor het bevragen van ingeschreven personen uit de basisregistratie personen (BRP), inclusief de registratie niet-ingezeten (RNI). Met deze API kun je personen zoeken en actuele gegevens over personen, kinderen, partners en ouders raadplegen.  Gegevens die er niet zijn of niet actueel zijn krijg je niet terug. Heeft een persoon bijvoorbeeld geen geldige nationaliteit, en alleen een beëindigd partnerschap, dan krijg je geen gegevens over nationaliteit en partner.  Zie de [Functionele documentatie](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-bevragen/tree/v1.0.0/features) voor nadere toelichting. 
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
    /// Geeft aan dat de persoon behandeld wordt als Nederlander, of dat door de rechter is vastgesteld dat de persoon niet de Nederlandse nationaliteit bezit * &#x60;behandeld_als_nederlander&#x60; - B * &#x60;vastgesteld_niet_nederlander&#x60; - V 
    /// </summary>
    /// <value>Geeft aan dat de persoon behandeld wordt als Nederlander, of dat door de rechter is vastgesteld dat de persoon niet de Nederlandse nationaliteit bezit * &#x60;behandeld_als_nederlander&#x60; - B * &#x60;vastgesteld_niet_nederlander&#x60; - V </value>
    
    [JsonConverter(typeof(StringEnumConverter))]
    
    public enum AanduidingBijzonderNederlanderschapEnum
    {
        /// <summary>
        /// Enum Behandeldalsnederlander for value: behandeld_als_nederlander
        /// </summary>
        [EnumMember(Value = "behandeld_als_nederlander")]
        Behandeldalsnederlander = 1,

        /// <summary>
        /// Enum Vastgesteldnietnederlander for value: vastgesteld_niet_nederlander
        /// </summary>
        [EnumMember(Value = "vastgesteld_niet_nederlander")]
        Vastgesteldnietnederlander = 2

    }

}