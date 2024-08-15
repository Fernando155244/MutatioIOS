//
//  InicioControler.swift
//  MutatioIOS
//
//  Created by user260925 on 7/22/24.
//

import Foundation
import UIKit

class InicioControler: UIViewController,XMLParserDelegate
{
    @IBOutlet weak var IngresarBTN :UIButton!
    @IBOutlet weak var txtID: UILabel!
    @IBOutlet weak var txtNombre: UILabel!
    @IBOutlet weak var txtRegistrada: UILabel!
    @IBOutlet weak var txtCertificada: UILabel!
    @IBOutlet weak var txtConfirmada: UILabel!
    @IBOutlet weak var txtValidada: UILabel!
    @IBOutlet weak var txtEstatus: UILabel!
    @IBOutlet weak var txtObservaciones: UILabel!
    @IBOutlet weak var txtTitulo: UILabel!
    @IBOutlet weak var txtLeyenda: UILabel!
    @IBOutlet weak var imgDatos: UIImageView!
    var Inicio: [Inicio] = []
    var Tipo: Int = Int()
    var Resultado : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        parseXML()
    }
    
        func parseXML() {
            
            if let path = Bundle.main.url(forResource: "Inicio", withExtension: "xml") {
                func parseXML() {
                    if let path = Bundle.main.url(forResource: "Inicio", withExtension: "xml") {
                        if let parser = XMLParser(contentsOf: path) {
                            let delegate = Conexion() // Usa una sola instancia de Conexion
                            parser.delegate = delegate
                            parser.parse()
                            // Una vez finalizado el parsing, asignamos los datos y recargamos la tabla
                            self.Inicio = delegate.Iniciado // Usa la misma instancia para obtener los datos
                            Resultado = Registro(Solicitud_Real: delegate.Solicitud_Real, F_Registro:delegate.F_Registro, Certificada_UR: delegate.Certificada_UR, F_Certificada_UR: delegate.F_Certificada_UR, Marcada: delegate.Marcada, Cancelada: delegate.Cancelada, Validada_DGP: String(delegate.Validada_DGP), Observaciones: delegate.Observaciones)
                            if(Tipo == 0)
                            {
                                txtID.text = " Solicitud de Cambio con Id: \(delegate.Id)"
                            }else if (Tipo == 1)
                            {
                                txtID.text = " Solicitud de Permuta con Id: \(delegate.Id)"
                            }
                            txtNombre.text = "De solicitante: \(delegate.Paterno) \(delegate.Materno) \(delegate.Nombre)"
                            
                            if(Tipo == 0)
                            {
                                if (Resultado == 2)
                                {
                                    txtEstatus.text = "🔘Su Solicitud de Cambio Fue Cancelada\nFecha de cancelación:"
                                    imgDatos.image = UIImage(named: "Neutro")
                                    txtTitulo.text = "La solicitud fue cancelada"
                                    txtLeyenda.isHidden = false
                                    txtObservaciones.text = "Observaciones \(delegate.Observaciones_Cancelacion)"
                                }else if (Resultado == 0 )
                                {
                                    txtEstatus.text = "🔘Su Solicitud de Cambio Fue Denegada"
                                    imgDatos.image = UIImage(named: "Negativo")
                                    txtTitulo.text = "Lastima"
                                    txtLeyenda.text = "Su solicitud de cambio no ha podido ser aceptada \(delegate.Observaciones)"
                                }else if (Resultado == 1 )
                                {
                                    txtEstatus.text = "🔘Su Solicitud de Cambio Fue Aceptada"
                                    imgDatos.image = UIImage(named: "Positivo")
                                    txtTitulo.text = "Felicidades!"
                                    txtLeyenda.text = "Su solicitud de cambio fue exitosa \(delegate.Observaciones)"
                                }}
                            else if(Tipo == 1)
                            {
                                if (Resultado == 2)
                                {
                                    txtEstatus.text = "🔘Su Solicitud de Permuta Fue Cancelada\nFecha de cancelación:"
                                    imgDatos.image = UIImage(named: "Neutro")
                                    txtTitulo.text = "La solicitud fue cancelada"
                                    txtLeyenda.isHidden = false
                                    txtObservaciones.text = "Observaciones \(delegate.Observaciones_Cancelacion)"
                                }else if (Resultado == 0 )
                                {
                                    txtEstatus.text = "🔘Su Solicitud de Permuta Fue Denegada"
                                    imgDatos.image = UIImage(named: "Negativo")
                                    txtTitulo.text = "Lastima"
                                    txtLeyenda.text = "Su solicitud de Permuta no ha podido ser aceptada \(delegate.Observaciones)"
                                }else if (Resultado == 1 )
                                {
                                    txtEstatus.text = "🔘Su Solicitud de Permuta Fue Aceptada"
                                    imgDatos.image = UIImage(named: "Positivo")
                                    txtTitulo.text = "Felicidades!"
                                    txtLeyenda.text = "Su solicitud de Permuta fue exitosa \(delegate.Observaciones)"
                                }
                            }
                            else{
                                print("Error Detectado")
                            }
                        } else {
                            print("Error: No se pudo crear el parser")
                        }
                    } else {
                        print("Error: No se pudo encontrar el archivo XML")
                    }
                }
            }
        
        func Registro (Solicitud_Real: Int, F_Registro: Date, Certificada_UR: Int, F_Certificada_UR: Date, Marcada:Int,Cancelada: Int,Validada_DGP: String, Observaciones: String)-> Int
        {
            
            if(Tipo == 0)
            {
                if(Solicitud_Real == 1)
                {
                    txtRegistrada.text = "🔘La solicitud ha sido Verificada \(F_Registro)"
                }else
                {
                    txtRegistrada.isHidden = false
                }
                if(Certificada_UR == 1)
                {
                    txtCertificada.text = "🔘La solicitud ha sido Certificada \(F_Certificada_UR)"
                    if(Cancelada == 1)
                    {
                        return 2
                    }else if (Marcada == 0)
                    {
                        return 0
                    }else if (Marcada == 1)
                    {
                        return 1
                    }
                }else
                {
                    txtCertificada.isHidden = false
                }
                if (Validada_DGP != "00/00/0000")
                {
                    txtValidada.text = "🔘La solicitud ha sido Validada el \(Validada_DGP)\n\(Observaciones)"
                }else
                {
                    txtValidada.isHidden = false
                }
                if(Cancelada == 1)
                {
                    return 2
                }
                else
                {
                    return 10
                }
            }else if (Tipo == 1)
            {
                if(Solicitud_Real == 1)
                {
                    txtRegistrada.text = "🔘La solicitud ha sido Verificada \(F_Registro)"
                }
                if(Certificada_UR == 1)
                {
                    txtCertificada.text = "🔘La solicitud ha sido Certificada \(F_Certificada_UR)"
                    if (Marcada == 0)
                    {
                        return 0
                    }else if (Marcada == 1)
                    {
                        return 1
                    }
                }
                if (Validada_DGP != "00/00/0000")
                {
                    txtValidada.text = "🔘La solicitud ha sido Validada el \(Validada_DGP)\n\(Observaciones)"
                }
                if(Cancelada == 1)
                {
                    return 2
                }
                else
                {
                    return 10
                }
            } else{
                print("Error")
                return 10
            }
            return 10
            
        }
    }
}
