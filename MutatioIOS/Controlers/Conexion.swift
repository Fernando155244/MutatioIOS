//
//  Conexion.swift
//  MutatioIOS
//
//  Created by user260925 on 7/22/24.
//

import Foundation
import Foundation
import UIKit
class Conexion: NSObject, XMLParserDelegate
{
    //var currentElement = ""
    var foundCharacters = ""
    var Iniciado:[Inicio]=[]
    var currentInicio : String = ""
    
    var Id:Int = Int()
    var Paterno: String = ""
    var Materno: String = ""
    var Nombre: String = ""
    var actual : String = ""
    var Opcion1 :String = ""
    var Opcion2:String = ""
    var Nivel: String = ""
    var RFC:String = ""
    var Tipo_Solicitud: Int = Int()
    var Solicitud_Real: Int = Int()
    var F_Registro:Date = Date()
    var Cancelada: Int = Int()
    var Observaciones_Cancelacion:String = ""
    var Validada_DGP: Int = Int()
    var Certificada_UR : Int = Int()
    var F_Certificada_UR : Date = Date()
    var Observaciones :String = ""
    var Marcada:Int = Int()
    
    let dateFormatter = ISO8601DateFormatter()
    /*var parsedData: [String: String] =
    ["Id":"String",
     "Paterno": "String",
     "Materno": "String",
     "Nombre": "String",
     "Opcion1" :"String",
     "Opcion2":"String",
     "Nivel": "String",
     "RFC":"String",
     "Tipo_Solicitud": "Int",
     "Solicitud_Real": "Int",
     "F_Registro":"Date",
     "Cancelada": "Int",
     "Observaciones_Cancelacion":"String",
     "Validada_DGP": "Int",
     "Certificada_UR" : "Int",
     "F_Certificada_UR" : "Date",
     " Observaciones " :"String",
     "Marcada":"Int"
    ]*/
    // Método que se llama al encontrar el comienzo de un elemento
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentInicio = elementName
            if elementName == ""
            {
                Id = Int()
                Paterno = ""
                Materno = ""
                Nombre = ""
                actual = ""
                Opcion1  = ""
                Opcion2 = ""
                Nivel = ""
                RFC = ""
                Tipo_Solicitud = Int()
                Solicitud_Real = Int()
                let isDate="00-00-0000"
                F_Registro = dateFormatter.date(from: isDate)!
                Cancelada = Int()
                Observaciones_Cancelacion = ""
                Validada_DGP = Int()
                Certificada_UR = Int()
                F_Certificada_UR = dateFormatter.date(from: isDate)!
                Observaciones  = ""
                Marcada = Int()
            }
            currentInicio = elementName
            foundCharacters = ""
        }

        // Método que se llama al encontrar caracteres dentro de un elemento
        /*func parser(_ parser: XMLParser, foundCharacters string: String) {
            switch currentInicio{
            case "Id":
                Id += Int()
            case "Paterno":
                Paterno += string
            case "Materno":
                Materno += string
            case "actual":
                actual
            case "Nombre":
                Nombre += string
            case "Opcion1":
                Opcion1 += string
            case  "Opcion2":
                Opcion2 += string
            case "Nivel":
                Nivel = string
            case "RFC":
                RFC = string
            case "Tipo_solicitud":
                Tipo_Solicitud = Int()
            case "Solicitud_Real":
                Solicitud_Real = Int()
            case "f_registro":
                let dia:String = string
                F_Registro = dateFormatter.date(from: dia)!
            case "cancelada":
                Cancelada = Int()
            case "observaciones_cancelacion":
                Observaciones_Cancelacion += string
            case "validada_dgp":
                Validada_DGP = Int()
            case "certificada_ur":
                Certificada_UR = Int()
            case "f_certificada_ur":
                let dia: String = string
                F_Certificada_UR = dateFormatter.date(from: dia)!
            case "observaciones":
                Observaciones += string
            case "marcada":
                Marcada = Int()
            default:
                break
            }
            print(currentInicio)
        }*/
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentInicio {
        case "Id":
            if let idValue = Int(string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                Id = idValue
                print(idValue)
            }
        case "Paterno":
            Paterno += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Materno":
            Materno += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Nombre":
            Nombre += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Opcion1":
            Opcion1 += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Opcion2":
            Opcion2 += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Nivel":
            Nivel = string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "RFC":
            RFC = string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Tipo_solicitud":
            if let tipoSolicitudValue = Int(string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                Tipo_Solicitud = tipoSolicitudValue
            }
        case "Solicitud_Real":
            if let solicitudRealValue = Int(string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                Solicitud_Real = solicitudRealValue
            }
        case "f_registro":
            F_Registro = dateFormatter.date(from: string.trimmingCharacters(in: .whitespacesAndNewlines)) ?? Date()
        case "cancelada":
            if let canceladaValue = Int(string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                Cancelada = canceladaValue
            }
        case "observaciones_cancelacion":
            Observaciones_Cancelacion += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "validada_dgp":
            if let validadaDGPValue = Int(string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                Validada_DGP = validadaDGPValue
            }
        case "certificada_ur":
            if let certificadaURValue = Int(string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                Certificada_UR = certificadaURValue
            }
        case "f_certificada_ur":
            F_Certificada_UR = dateFormatter.date(from: string.trimmingCharacters(in: .whitespacesAndNewlines)) ?? Date()
        case "observaciones":
            Observaciones += string.trimmingCharacters(in: .whitespacesAndNewlines)
        case "marcada":
            if let marcadaValue = Int(string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                Marcada = marcadaValue
            }
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
            if elementName == "Inicio" {
                let Inicio = MutatioIOS.Inicio(Id: Int(currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!, Paterno: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Materno:  currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Nombre:currentInicio.trimmingCharacters(in: .whitespacesAndNewlines), Actual:currentInicio.trimmingCharacters(in: .whitespacesAndNewlines), Opcion1:  currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Opcion2: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Nivel: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),RFC: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Tipo_Solicitud: Int(currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!,Solicitud_Real: Int( currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!, F_Registro: dateFormatter.date(from: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!, Cancelada: Int(currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!, Observaciones_Cancelacion: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Validada_DGP: Int(currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!, Certificada_UR: Int( currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!, F_Certificada_UR: dateFormatter.date(from: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!,Observaciones: currentInicio.trimmingCharacters(in: .whitespacesAndNewlines),Marcada: Int( currentInicio.trimmingCharacters(in: .whitespacesAndNewlines))!)
                Iniciado.append(Inicio)
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
