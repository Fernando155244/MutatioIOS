import UIKit

class GraficasControler: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData: [String] = ["Selecciona","Todos", "Cambio", "Permuta"]
    var pickerReferencia: [String] = ["Selecciona", "Nivel Educativo", "Estados"]
    var pickerEstatus: [String] = ["Selecciona", "Todos", "R", "C"]

    @IBOutlet weak var Opcion: UITextField!
    @IBOutlet weak var Referencia: UITextField!
    @IBOutlet weak var Estado: UITextField!

    var opcionesPicker = UIPickerView()
    var ReferenciasPicker = UIPickerView()
    var EstatusPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        Opcion.inputView = opcionesPicker
        Referencia.inputView = ReferenciasPicker
        Estado.inputView = EstatusPicker

        Opcion.placeholder = "Tipo de Solicitud"
        Referencia.placeholder = "Referencias"
        Estado.placeholder = "Estatus"
        

        opcionesPicker.delegate = self
        opcionesPicker.dataSource = self
        ReferenciasPicker.delegate = self
        ReferenciasPicker.dataSource = self
        EstatusPicker.delegate = self
        EstatusPicker.dataSource = self

        opcionesPicker.tag = 1
        ReferenciasPicker.tag = 2
        EstatusPicker.tag = 3
    }

    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return pickerData.count
        case 2:
            return pickerReferencia.count
        case 3:
            return pickerEstatus.count
        default:
            return 0
        }
    }

    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return pickerData[row]
        case 2:
            return pickerReferencia[row]
        case 3:
            return pickerEstatus[row]
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch pickerView.tag {
        case 1:
            Opcion.text = pickerData[row]
            Opcion.resignFirstResponder()
        case 2:
            Referencia.text = pickerReferencia[row]
            Referencia.resignFirstResponder()
        case 3:
            Estado.text = pickerEstatus[row]
            Estado.resignFirstResponder()
        default:
            break
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Implementación necesaria si es requerida
    }
}
