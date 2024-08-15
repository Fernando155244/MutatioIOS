//
//  Conexion.swift
//  MutatioIOS
//
//  Created by user260925 on 7/22/24.
//

import Foundation
import UIKit
class ConexionRevision: NSObject, XMLParserDelegate
{
    //var currentElement = ""
    var foundCharacters = ""
    var Revisado:[Revision]=[]
    var currentInicio : String = ""

    var Paterno: String = ""
    var Materno: String = ""
    var Nombre: String = ""
    var Actual : String = ""
    var Opcion1 :String = ""
    var Opcion2:String = ""
    var Nivel: String = ""
    var RFC:String = ""
    
    let dateFormatter = ISO8601DateFormatter()
    // Método que se llama al encontrar el comienzo de un elemento
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentInicio = elementName
            if elementName == ""
            {
                Paterno = ""
                Materno = ""
                Nombre = ""
                Actual = ""
                Opcion1  = ""
                Opcion2 = ""
                Nivel = ""
                RFC = ""
                
            }
            currentInicio = elementName
            foundCharacters = ""
        }

        // Método que se llama al encontrar caracteres dentro de un elemento
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentInicio {
        case "paterno":
            Paterno += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "materno":
            Materno += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "nombre":
            Nombre += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Actual":
            Actual += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Opcion1":
            Opcion1 += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Opcion2":
            Opcion2 += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "nivel":
            Nivel += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "rfc":
            RFC = string.trimmingCharacters(in: .whitespacesAndNewlines)
       
        default:
            break
        }
        print(currentInicio)
    }


        // Método que se llama al encontrar el final de un elemento
        /*func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            if currentInicio == elementName {
               // parsedData[elementName] = foundCharacters.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }*/

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            if elementName == "Revision" {
                let Revision = MutatioIOS.Revision(Paterno: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Materno:  currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Nombre:currentInicio.trimmingCharacters(in: .whitespacesAndNewlines), Actual:currentInicio.trimmingCharacters(in: .whitespacesAndNewlines), Opcion1:  currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Opcion2: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Nivel: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),RFC: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))
                Revisado.append(Revision)
            }
        }
        // Método que se llama al finalizar el análisis del documento
        func parserDidEndDocument(_ parser: XMLParser) {
            print("XML parsing finished")
            // Aquí puedes procesar los datos como necesites
        }

        // Método que se llama en caso de error
        func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
            print("Error parsing XML: \(parseError.localizedDescription)")
        }
}
//
//  ConexionConfirmacion.swift
//  MutatioIOS
//
//  Created by user260925 on 8/9/24.
//

import Foundation
