//
//  PreguntasController.swift
//  MutatioIOS
//
//  Created by user260925 on 7/22/24.
//

import Foundation
import UIKit

class PreguntasController: UICollectionViewController {
    private let reuseIdentifier = "dataCell"
    
    @IBOutlet weak var ingresarBtn: UIButton!
    
    var preguntas: [Pregunta] = [
        Pregunta(ask: "¿La página https://cambiosinterestatales.sep.gob.mx\n es para Cambios dentro del mismo Estado?"),
        Pregunta(ask: "¿Hay diferencia entre el Proceso de Cambios \ny en el Proceso de Permutas de \nAdscripción de Estado a Estado?"),
        Pregunta(ask: "¿El participar en los procesos \ngarantiza que mi cambio o permuta \nsea autorizado?"),
        Pregunta(ask: "¿En qué consiste el Proceso de Cambios de \nAdscripción de Estado a Estado?"),
        Pregunta(ask: "¿En qué consiste el Proceso de Permutas de \nAdscripción de Estado a Estado?"),
        Pregunta(ask: "¿Puedo elegir la ubicación en el Proceso de \nCambios o Permutas de Adscripción \nde Estado a Estado?"),
        Pregunta(ask: "¿Es posible que el sistema me registre en \nel proceso incorrecto, es decir, que inicie \nmi registro en cambios y me pase a permutas?"),
        Pregunta(ask: "Me equivoqué en el registro, \nseleccioné incorrectamente Cambios cuando quiero \nsolicitar Permuta o viceversa, \n¿Qué puedo hacer para corregir?"),
        Pregunta(ask: "No tengo el número de solicitud ya que no concluí\n el registro, ¿Cómo lo obtengo?"),
        Pregunta(ask: "¿No encuentro mi categoría en el combo del nivel \neducativo en el que me registré?"),
        Pregunta(ask: "¿Cómo consulto o cómo sé cuál es mi categoría?"),
        Pregunta(ask: "Ya consulté mi categoría, revisando mi \ntalón de pago y el Sistema me indica que no se encontraron resultados, \n¿qué procede?"),
        Pregunta(ask: "No puedo imprimir, ya que me aparece que \nno tengo nombramientos registrados, ¿qué hago?"),
        Pregunta(ask: "Descargué mi solicitud, pero está en blanco \n¿cómo lo soluciono?"),
        Pregunta(ask: "No ubico los datos para registrar mi unidad \ny subunidad, ¿Cómo o de dónde los obtengo?"),
        Pregunta(ask: "¿Participo en los Procesos de Cambios\n y Permutas de Adscripción de Estado a \nEstado solo con el registro?"),
        Pregunta(ask: "¿Qué documentos debo anexar a mi solicitud?"),
        Pregunta(ask: "¿En dónde entrego mi solicitud y documentos?"),
        Pregunta(ask: "No me llega el correo de registro, \n¿Qué pasa en este caso, cómo lo obtengo?"),
        Pregunta(ask: "Deseo cancelar mi participación en el \nProceso de Cambios de Adscripción de Estado a Estado ¿Qué debo hacer?"),
        Pregunta(ask: "Deseo cancelar mi participación en el \nProceso de Permutas de Adscripción de Estado a \nEstado ¿Qué debo hacer?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = false
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue){

       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        collectionView.allowsMultipleSelection = false
            if segue.identifier == "showDetail" {
                if let indexPaths = collectionView.indexPathsForSelectedItems, !indexPaths.isEmpty {
                    let destinationController = segue.destination as! PreguntaControler
                    print("\(indexPaths) Valor \(indexPaths[0].row)")
                    destinationController.pregunta = preguntas[indexPaths[0].row]
                    collectionView.deselectItem(at: indexPaths[0], animated: false)
                }
            
            /*if let indexPaths = collectionView.indexPathsForSelectedItems{
                let destinationController = segue.destination as! PreguntaControler
                print("\(indexPaths) Valor \(indexPaths[0].row)")
                
                destinationController.pregunta = preguntas[indexPaths[0].row]
                
                
                collectionView.deselectItem(at: indexPaths[0], animated: false)
                
            }*/
            
        }

        }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                performSegue(withIdentifier: "showDetail", sender: nil)

        }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return preguntas.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PreguntaCelda
    
        let elemento = preguntas[indexPath.row]
        cell.pregunta.text = elemento.ask
        // Configure the cell
    
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate
    
    // Otros métodos de UICollectionViewDelegate pueden ir aquí si los necesitas
}
