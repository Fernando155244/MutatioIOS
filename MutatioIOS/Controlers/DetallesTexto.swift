//
//  DetallesTexto.swift
//  MutatioIOS
//
//  Created by user260925 on 8/21/24.
//

import Foundation
import UIKit
class DetallesTexto: UIViewController
{
    var producto: Pregunta?
    @IBOutlet weak var texto : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        texto.text = producto?.ask ?? ""
    }
}
