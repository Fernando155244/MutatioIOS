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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseXML()
        let Resultado: Int = Registro()
        if(Tipo == 0)
        {
            if (Resultado == 2)
            {
                txtEstatus.text = "🔘Su Solicitud de Cambio Fue Cancelada\nFecha de cancelación:"
                imgDatos.image = UIImage(named: "Neutro")
                txtTitulo.text = "La solicitud fue cancelada"
                txtLeyenda.isHidden = false
                txtObservaciones.text = "Observaciones \(Inicio[0].Observaciones_Cancelacion)"
            }else if (Resultado == 0 )
            {
                txtEstatus.text = "🔘Su Solicitud de Cambio Fue Denegada"
                imgDatos.image = UIImage(named: "Negativo")
                txtTitulo.text = "Lastima"
                txtLeyenda.text = "Su solicitud de cambio no ha podido ser aceptada \(Inicio[0].Observaciones)"
            }else if (Resultado == 1 )
            {
                txtEstatus.text = "🔘Su Solicitud de Cambio Fue Aceptada"
                imgDatos.image = UIImage(named: "Positivo")
                txtTitulo.text = "Felicidades!"
                txtLeyenda.text = "Su solicitud de cambio fue exitosa \(Inicio[0].Observaciones)"
            }}
        else if(Tipo == 1)
        {
            if (Resultado == 2)
            {
                txtEstatus.text = "🔘Su Solicitud de Permuta Fue Cancelada\nFecha de cancelación:"
                imgDatos.image = UIImage(named: "Neutro")
                txtTitulo.text = "La solicitud fue cancelada"
                txtLeyenda.isHidden = false
                txtObservaciones.text = "Observaciones \(Inicio[0].Observaciones_Cancelacion)"
            }else if (Resultado == 0 )
            {
                txtEstatus.text = "🔘Su Solicitud de Permuta Fue Denegada"
                imgDatos.image = UIImage(named: "Negativo")
                txtTitulo.text = "Lastima"
                txtLeyenda.text = "Su solicitud de Permuta no ha podido ser aceptada \(Inicio[0].Observaciones)"
            }else if (Resultado == 1 )
            {
                txtEstatus.text = "🔘Su Solicitud de Permuta Fue Aceptada"
                imgDatos.image = UIImage(named: "Positivo")
                txtTitulo.text = "Felicidades!"
                txtLeyenda.text = "Su solicitud de Permuta fue exitosa \(Inicio[0].Observaciones)"
            }
        }
        else{
            print("Error Detectado")
        }
    
    func parseXML() {
        if let path = Bundle.main.url(forResource: "Inicio", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                var delegate = Conexion()
                parser.delegate = delegate
                parser.parse()
                
                // Una vez finalizado el parsing, asignamos los datos y recargamos la tabla
                self.Inicio = Conexion().Iniciado
                txtID.text! = "Solicitud de Cambio Numero: \(delegate.Id)"
                txtNombre.text! += "\(delegate.Paterno) \(delegate.Materno) \(delegate.Nombre)"
            } else {
                print("Error: No se pudo crear el parser")
            }
        } else {
            print("Error: No se pudo encontrar el archivo XML")
        }
    }

    func Registro ()-> Int
        {
            
            if(Tipo == 0)
            {
                if(Inicio[0].Solicitud_Real == 1)
                {
                    txtRegistrada.text = "🔘La solicitud ha sido Verificada \(Inicio[0].F_Registro)"
                }else
                {
                    txtRegistrada.isHidden = false
                }
                if(Inicio[0].Certificada_UR == 1)
                {
                    txtCertificada.text = "🔘La solicitud ha sido Certificada \(Inicio[0].F_Certificada_UR)"
                    if (Inicio[0].Marcada == 0)
                    {
                        return 0
                    }else if (Inicio[0].Marcada == 1)
                    {
                        return 1
                    }
                }else
                {
                    txtCertificada.isHidden = false
                }
                if (Inicio[0].Validada_DGP == 1)
                {
                    txtValidada.text = "🔘La solicitud ha sido Validada el \(Inicio[0].Validada_DGP)\n\(Inicio[0].Observaciones)"
                }else
                {
                    txtValidada.isHidden = false
                }
                if(Inicio[0].Cancelada == 1)
                {
                    return 2
                }
                else
                {
                    return 10
                }
            }else if (Tipo == 1)
            {
                if(Inicio[0].Solicitud_Real == 1)
                {
                    txtRegistrada.text = "🔘La solicitud ha sido Verificada \(Inicio[0].F_Registro)"
                }
                if(Inicio[0].Certificada_UR == 1)
                {
                    txtCertificada.text = "🔘La solicitud ha sido Certificada \(Inicio[0].F_Certificada_UR)"
                    if (Inicio[0].Marcada == 0)
                    {
                        return 0
                    }else if (Inicio[0].Marcada == 1)
                    {
                        return 1
                    }
                }
                if (Inicio[0].Validada_DGP == 1)
                {
                    txtValidada.text = "🔘La solicitud ha sido Validada el \(Inicio[0].Validada_DGP)\n\(Inicio[0].Observaciones)"
                }
                if(Inicio[0].Cancelada == 1)
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
