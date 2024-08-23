//
//  InicioControler.swift
//  MutatioIOS
//
//  Created by user260925 on 7/22/24.
//

import Foundation
import UIKit

class InicioControler: UIViewController
{
    @IBOutlet weak var IngresarBTN :UIButton!
    @IBOutlet weak var RegresarBTN : UIButton!
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
    var Resultado : Int = 0
    // ... (tus IBOutlets)

        var inicioData: [Inicio] = [] // Opcional para manejar casos donde no se encuentra data
        var Tipo: Int? = Int()
        var Id: Int = 1
        // ... (otros miembros)

        override func viewDidLoad() {
            super.viewDidLoad()
            parseXML()
        }
    @IBAction func Cerrar(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }

        func parseXML() {
            if let path = Bundle.main.url(forResource: "Inicio", withExtension: "xml"){
                if let parser = XMLParser(contentsOf: path) {
                    var delegate = Conexion()
                    parser.delegate = delegate
                    parser.parse()
                    self.inicioData = Conexion().Iniciado
                    txtID.text = "Solicitud de Cambios Numero: \(delegate.Id)"
                    txtNombre.text = "Del trabajador: \(delegate.Paterno) \(delegate.Materno) \n \(delegate.Nombre)"
                let Valor: Int = Registro(Solicitud_Real: delegate.Solicitud_Real, F_Registro: delegate.Solicitud_Real, Certificada_UR: delegate.Certificada_UR, F_Certificada_UR: delegate.F_Certificada_UR, Marcada: delegate.Marcada, Cancelada: delegate.Cancelada, Validada_DGP: delegate.Validada_DGP, Observaciones: delegate.Observaciones)
                    if (Tipo == 1)
                    {
                        if (Valor == 2){
                            txtConfirmada.text  = "🔘Su Solicitud de Permuta Fue Cancelada\nFecha de cancelación: 1919-12-05 12:48:10"
                            imgDatos.image = UIImage(named: "Neutro")
                            txtTitulo.text = "La solicitud fue cancelada"
                            txtObservaciones.text = "\(delegate.Observaciones)"
                        } else if (Valor == 0){
                            if(delegate.Estatus == "C" || delegate.Estatus == "c" || delegate.Estatus == "Vacio")
                            {
                                txtConfirmada.text  = "🔘Su Solicitud de permuta no fue Beneficiada"
                                imgDatos.image = UIImage(named: "Negativo")
                                txtLeyenda.text = "Su solicitud de permuta no fue beneficiada"
                                txtObservaciones.text = "\(delegate.Observaciones)"
                            } else if (delegate.Estatus == "R" || delegate.Estatus == "r")
                            {
                                txtConfirmada.text  = "🔘Su Solicitud de permuta fue rechazada por tu estado"
                                imgDatos.image = UIImage(named: "Negativo")
                                txtLeyenda.text = "Su solicitud de permuta fue Rechazada"
                                txtObservaciones.text! += "\nTu solicitud fue rechazada por: \(delegate.Observaciones)"
                                txtCertificada.text = "🔘La solicitud de permuta ha sido Rechazada"
                            }
                        } else if (Valor == 1){
                            txtConfirmada.text  = "🔘Su Solicitud de Permuta fue beneficiada"
                            imgDatos.image = UIImage(named: "Positivo")
                            txtTitulo.text = "Su solicitud de permuta fue beneficiada"
                            txtObservaciones.text = "\(delegate.Observaciones)"
                        }
                    }else if (Tipo == 0)
                    {
                        if (Valor == 2){
                            txtConfirmada.text  = "🔘Su Solicitud de Cambio Fue Cancelada\nFecha de cancelación: 1919-12-05 12:48:10"
                            imgDatos.image = UIImage(named: "Neutro")
                            txtTitulo.text = "La solicitud fue cancelada"
                            txtObservaciones.text = "\(delegate.Observaciones)"
                        } else if (Valor == 0){
                            if(delegate.Estatus == "C" || delegate.Estatus == "c" || delegate.Estatus == "Vacio")
                            {
                                txtConfirmada.text  = "🔘Su Solicitud de Cambio no fue Beneficiada"
                                imgDatos.image = UIImage(named: "Negativo")
                                txtLeyenda.text = "Su solicitud de cmabio no fue beneficiada"
                                txtObservaciones.text = "\(delegate.Observaciones)"
                            } else if (delegate.Estatus == "R" || delegate.Estatus == "r")
                            {
                                txtConfirmada.text  = "🔘Su Solicitud de cambio fue rechazada por tu estado"
                                imgDatos.image = UIImage(named: "Negativo")
                                txtLeyenda.text = "Su solicitud de Cambio fue Rechazada"
                                txtObservaciones.text! += "\nTu solicitud fue rechazada por: \(delegate.Observaciones)"
                                txtCertificada.text = "🔘La solicitud de Cambio ha sido Rechazada"
                            }
                        } else if (Valor == 1){
                            txtConfirmada.text  = "🔘Su Solicitud de Cambio fue beneficiada"
                            imgDatos.image = UIImage(named: "Positivo")
                            txtTitulo.text = "Su solicitud de cambio fue beneficiada"
                            txtObservaciones.text = "\(delegate.Observaciones)"
                        }
                    }

                } else {
                    print("Error: No se pudo crear el parser")
                }
            } else {
                print("Error: No se pudo encontrar el archivo XML")
            }
        }

        
        func Registro (Solicitud_Real: String, F_Registro: String, Certificada_UR: String, F_Certificada_UR: String, Marcada:String,Cancelada: String,Validada_DGP: String, Observaciones: String)-> Int
        {
            
            if(Tipo == 0)
            {
                if(Int(Solicitud_Real) == 1)
                {
                    txtRegistrada.text = "🔘La solicitud de cambio ha sido Verificada\n \(F_Registro)"
                }else
                {
                    txtRegistrada.isHidden = false
                }
                if(Int(Certificada_UR) == 1)
                {
                    txtCertificada.text = "🔘La solicitud de cambio ha sido Certificada\n \(F_Certificada_UR)"
                    if(Int(Cancelada) == 1)
                    {
                        return 2
                    }else if (Int(Marcada) == 0)
                    {
                        return 0
                    }else if (Int(Marcada) == 1)
                    {
                        return 1
                    }
                }else
                {
                    txtCertificada.isHidden = false
                }
                if (Validada_DGP != "")
                {
                    txtValidada.text = "🔘La solicitud de cambio ha sido Validada \(Validada_DGP)\n\(Observaciones)"
                }else
                {
                    txtValidada.isHidden = false
                }
                if(Int(Cancelada) == 1)
                {
                    return 2
                }
                else
                {
                    return 10
                }
            }else if (Int(Tipo ?? 10) == 1)
            {
                if(Int(Solicitud_Real) == 1)
                {
                    txtRegistrada.text = "🔘La solicitud de permuta ha sido Verificada\n \(F_Registro)"
                }else
                {
                    txtRegistrada.isHidden = false
                }
                if(Int(Certificada_UR) == 1)
                {
                    txtCertificada.text = "🔘La solicitud de permuta ha sido Certificada \n\(F_Certificada_UR)"
                    if(Int(Cancelada) == 1)
                    {
                        return 2
                    }else if (Int(Marcada) == 0)
                    {
                        return 0
                    }else if (Int(Marcada) == 1)
                    {
                        return 1
                    }
                }else
                {
                    txtCertificada.isHidden = false
                }
                if (Validada_DGP != "")
                {
                    txtValidada.text = "🔘La solicitud de permuta ha sido Validada \(Validada_DGP)\n\(Observaciones)"
                }else
                {
                    txtValidada.isHidden = false
                }
                if(Int(Cancelada) == 1)
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
