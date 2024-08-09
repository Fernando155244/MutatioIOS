//
//  Mensajes.swift
//  Ropa Tecnologica
//
//  Created by user260925 on 7/2/24.
//

import Foundation
import UIKit
class Mensaje{



    



    public static func mostrarAlerta(en controlador: UIViewController , titulo: String, mensaje: String, tituloBoton: String, tituloBotonNo:String?, accion: (()-> Void)?){



        //create alerta



        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)



        



        let btnAction = UIAlertAction(title: tituloBoton, style: UIAlertAction.Style.default){



            UIAlertAction in accion?()



        }



        //se agrega la accion al alerta



        alert.addAction(btnAction)



        



        //mostrar el alerta



        controlador.present(alert, animated:true, completion:nil)



        



    }



    



    



    public static func mostrarAlertaPrueba(en controlador: UIViewController, mensaje: String){



        



        mostrarAlerta(en: controlador, titulo: "Prueba Alerta", mensaje: mensaje, tituloBoton: "OK", tituloBotonNo: nil, accion: nil)



        



    }



}
