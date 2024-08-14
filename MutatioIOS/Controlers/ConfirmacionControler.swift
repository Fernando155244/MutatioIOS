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
    var Revision: [Revision] = []
    var Tipo: Int = Int()
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
                self.Revision = ConexionRevision().Revisado
                if(Tipo == 0)
                {
                    txtSolicitud.text! = " Solicitud de Cambio con Id: \(delegate.Id)"
                }else if (Tipo == 1)
                {
                    txtSolicitud.text! = " Solicitud de Permuta con Id: \(delegate.Id)"
                }
                txtSolicitud.text! = ""
                txtNombre.text! = "Del trabajador: \(delegate.Paterno) \(delegate.Materno) \(delegate.Nombre)"
                txtActual.text! = "\(delegate.actual)"
                txtOpcion1.text! = "\(delegate.Opcion1)"
                txtOpcion2.text! = "\(delegate.Opcion2)"
                txtNivel.text! = "\(delegate.Nivel)"
            } else {
                print("Error: No se pudo crear el parser")
            }
        } else {
            print("Error: No se pudo encontrar el archivo XML")
        }
    }

}
