import Foundation
import UIKit
import SwiftUI

class LoginControler: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = ["Cambio", "Permuta"]
    
    @IBOutlet weak var IngresarBTN: UIButton!
    @IBOutlet weak var RFC: UITextField!
    @IBOutlet weak var Folio: UITextField!
    @IBOutlet weak var Opcion: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asignar delegados y data source para el UIPickerView
        Opcion.delegate = self
        Opcion.dataSource = self
        
        // Configuración de los UITextFields
        RFC.delegate = self
        Folio.delegate = self
        
        // Cargar los datos desde un archivo JSON si es necesario
        leerArchivoJson(filename: "WsDatos")
        
        // Guardar datos en la memoria (UserDefaults)
        guardarDatosMemoria(key: "ClaveUsuario", value: "FernandoOrozco")
        guardarDatosMemoria(key: "password", value: "123")
        guardarDatosMemoria(key: "Nombre", value: "El Fercho")
        guardarDatosMemoria(key: "e-Mail", value: "155244@udlondres.com")
        guardarDatosMemoria(key: "Genero", value: "M")
        guardarDatosMemoria(key: "Edad", value: "26")
        guardarDatosMemoria(key: "Telefono", value: "5548835143")
        guardarDatosMemoria(key: "Ocupacion", value: "Estudiante")
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // MARK: - Other Methods
    
    func leerArchivoJson(filename name: String) {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
                    print("JSON: \(json)")
                } else {
                    print("Given JSON is not a valid dictionary object.")
                }
            }
        } catch {
            print(error)
        }
    }
    
    @IBAction func ingresar_click(_ sender: Any) {
        if validacampos() {
            let usuario = RFC.text
            let password = Folio.text
            print(usuario as Any)
        }
        ConfirmacionControler().Id = Int(Folio.text ?? "0")!
        //printContent("Posicion \(Opcion.numberOfComponents)")
        //InicioControler().Tipo = Opcion.numberOfComponents
        self.view.endEditing(true)
        
    }
    
    func guardarDatosMemoria(key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func validacampos() -> Bool {
        guard let usuario = RFC.text, !usuario.isEmpty,
              let password = Folio.text, !password.isEmpty else {
            Mensaje.mostrarAlertaPrueba(en: self, mensaje: "Faltan campos por llenar")
            RFC.backgroundColor = .red
            Folio.backgroundColor = .red
            return false
        }
        
        RFC.backgroundColor = .white
        Folio.backgroundColor = .white
        
        if login(name: usuario, pass: password) {
            return true
        } else {
            Mensaje.mostrarAlertaPrueba(en: self, mensaje: "Usuario o contraseña no son correctos")
            return false
        }
    }
    
    func login(name: String, pass: String) -> Bool {
        let nombre = "Fer"
        let password = "123"
        
        return name == nombre && pass == password
    }
}

