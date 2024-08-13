//
//  ConfirmacionControler.swift
//  MutatioIOS
//
//  Created by user260925 on 7/22/24.
//

import Foundation
import UIKit

class ConfirmacionControler: UIViewController
{
    @IBOutlet weak var IngresarBTN :UIButton!
    @IBOutlet weak var txtSolicitud:UILabel!
    @IBOutlet weak var txtNombre:UILabel!
    @IBOutlet weak var txtActual:UILabel!
    @IBOutlet weak var txtOpcion1:UILabel!
    @IBOutlet weak var txtOpcion2:UILabel!
    @IBOutlet weak var txtNivel:UILabel!
        override func viewDidLoad() {
        super.viewDidLoad()
        parseXML()
    }
    func parseXML() {
        if let path = Bundle.main.url(forResource: "Revision", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                var delegate = ConexionRevision()
                parser.delegate = delegate
                parser.parse()
                
                // Una vez finalizado el parsing, asignamos los datos y recargamos la tabla
                self.Revisado = ConexionRevision().Revisado
                txtSolicitud.text! = ""
                txtNombre.text! += "\(delegate.Paterno) \(delegate.Materno) \(delegate.Nombre)"
            } else {
                print("Error: No se pudo crear el parser")
            }
        } else {
            print("Error: No se pudo encontrar el archivo XML")
        }
    }

}
