//
//  LoginControl.swift
//  MutatioIOS
//
//  Created by user260925 on 7/22/24.
//

import Foundation
import UIKit

class LoginControler: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var IngresarBTN :UIButton!
    @IBOutlet weak var RFC:UITextField!
    @IBOutlet weak var Folio: UITextField!
        override func viewDidLoad() {
        super.viewDidLoad()
            var UsuarioFicticio = "FernandoOrozco"
            var passwordFicticio = "123"
            super.viewDidLoad()
            leerArchivoJson(filename: "WsDatos")
            RFC	.delegate = self
            Folio.delegate = self
            guardarDatosMemoria(key: "ClaveUsuario", value: UsuarioFicticio)
            guardarDatosMemoria(key: "password", value: passwordFicticio)
            guardarDatosMemoria(key: "Nombre", value: "El Fercho")
            guardarDatosMemoria(key: "e-Mail", value: "155244@udlondres.com")
            guardarDatosMemoria(key: "Genero", value: "M")
            guardarDatosMemoria(key: "Edad", value: "26")
            guardarDatosMemoria(key: "Telefono", value: "5548835143")
            guardarDatosMemoria(key: "Ocupacion", value: "Estudiante")
        }
        
        
        func login(name:String, pass:String)-> Bool
        {
            let nombre = "Fer"
            let password = "123"
            
            if(name == nombre  && pass == password)
            {
                return true
            }
            else{
                return false
            }
            
        }
        
        
        
        func validacampos() -> Bool
        {
            var password = RFC.text
            var usuario = Folio.text
            if (usuario == "" || password == "") {
                Mensaje.mostrarAlertaPrueba(en: self, mensaje: "Faltan campos por llenar")
                RFC.backgroundColor = UIColor.red
                Folio.backgroundColor = UIColor.red
                return false
            }else
            {
                RFC.backgroundColor = UIColor.white
                Folio.backgroundColor = UIColor.white
                if(login(name: RFC.text!, pass: Folio.text!))
                {
                    return true
                }else{
                    Mensaje.mostrarAlertaPrueba(en: self, mensaje: "usuatio o contraseña no son correctos")
                    return false
                }
            }
        }
        
        
        
        
        
        
        func leerArchivoJson(filename name: String)  {
            
            do {
                if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
                        print("JSON: \(json)")
                        //guardarUsuarios(json: json)
                    } else {
                        print("Given JSON is not a valid dictionary object.")
                    }
                }
            } catch {
                print(error)
            }
        }
        
        
        
        @IBAction func ingresar_click(_ sender: Any)
        {
            if (validacampos())
            {
                var usuario = RFC.text
                var password = Folio.text
                print(usuario)
            }else
            {
                
            }
            self.view.endEditing(true)
        }
        
        
        let userDefaults = UserDefaults.standard // clase para almacenar en la memoria
        
        /** funcion que permite guardar en la memoria del telefono*/
        func guardarDatosMemoria(key: String, value: Any) {
            userDefaults.set(value, forKey: key)
            userDefaults.synchronize()
        }
    }

