import Foundation
import UIKit

class Conexion: NSObject, XMLParserDelegate {
    
    var foundCharacters = ""
    var Iniciado: [Inicio] = []
    var currentInicio : String = ""
    
    var Id: String = ""
    var Paterno: String = ""
    var Materno: String = ""
    var Nombre: String = ""
    var actual: String = ""
    var Opcion1: String = ""
    var Opcion2: String = ""
    var Nivel: String = ""
    var RFC: String = ""
    var Tipo_Solicitud: String = ""
    var Solicitud_Real: String = ""
    var F_Registro: String = ""
    var Cancelada: String = ""
    var Observaciones_Cancelacion: String = ""
    var Validada_DGP: String = ""
    var Certificada_UR: String = ""
    var F_Certificada_UR: String = ""
    var Observaciones: String = ""
    var Marcada: String = ""
    var Estatus: String = ""
    
    let dateFormatter = ISO8601DateFormatter()
    
    // Método que se llama al encontrar el comienzo de un elemento
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentInicio = elementName
        if elementName == "" {
            // Reinicia todas las variables cuando se encuentra un nuevo "Inicio"
            Id = ""
            Paterno = ""
            Materno = ""
            Nombre = ""
            actual = ""
            Opcion1 = ""
            Opcion2 = ""
            Nivel = ""
            RFC = ""
            Tipo_Solicitud = ""
            Solicitud_Real = ""
            F_Registro = ""
            Cancelada = ""
            Observaciones_Cancelacion = ""
            Validada_DGP = ""
            Certificada_UR = ""
            F_Certificada_UR = ""
            Observaciones = ""
            Marcada = ""
            Estatus = ""
        }
        currentInicio = elementName
        foundCharacters = ""
    }

    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentInicio {

        case "id":
            Id += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "paterno":
            Paterno += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "materno":
            Materno += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "nombre":
            Nombre += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "opcion1":
            Opcion1 += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "opcion2":
            Opcion2 += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "nivel":
            Nivel += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "rfc":
            RFC += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "tipo_solicitud":
            Tipo_Solicitud += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "solicitud_real":
            Solicitud_Real += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "f_registro":
            F_Registro += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "cancelada":
            Cancelada += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "observaciones_cancelacion":
            Observaciones_Cancelacion += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "validada_dgp":
            Validada_DGP += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "certificada_ur":
            Certificada_UR += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "f_cetificada_ur":
            F_Certificada_UR += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "obsevaciones":
            Observaciones += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "marcada":
            Marcada += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "estatus":
            Estatus += string.trimmingCharacters(in: .whitespacesAndNewlines)
            
        default:
            break
        }
            print(currentInicio)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "Inicio" {
            let inicio = MutatioIOS.Inicio(
                Id: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Paterno: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Materno: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Nombre: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Actual: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Opcion1: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Opcion2: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Nivel: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                RFC: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Tipo_Solicitud: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Solicitud_Real: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                F_Registro: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Cancelada: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Observaciones_Cancelacion: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Validada_DGP: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Certificada_UR: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                F_Certificada_UR: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Observaciones: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Marcada: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),
                Estatus: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))
            Iniciado.append(inicio)
            
        }
        }
        
        func parserDidEndDocument(_ parser: XMLParser) {
            print("XML parsing finished")
        }
        
        func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
            print("Error parsing XML: \(parseError.localizedDescription)")
        }
    }
    
import Foundation
