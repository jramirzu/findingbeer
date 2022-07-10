//
//  RegistroViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 24/06/22.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var codigoTextField: UITextField!
    
    
    let codigoCervezas = ["123", "1234"]
    var pickerVieW = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codigoTextField.inputView = pickerVieW
        
        codigoTextField.backgroundColor = .white
        codigoTextField.placeholder = "Registrar N° de Código de Barra"
        codigoTextField.font = UIFont.boldSystemFont(ofSize: 14)
        codigoTextField.textAlignment = .center
        
        pickerVieW.delegate = self
        pickerVieW.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrar(_ sender: Any) {
      
        let codigo = codigoTextField.text ?? ""
        print(codigo)
        
        let locales = LocalRepository().getLocales()
        print(locales[2].codigo)
        let localesFiltrado =  locales.filter{ local in
           return local.codigo == Int(codigo)
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DireccionesViewController") as! DireccionesViewController // Del identificador
        vc.cervezas = localesFiltrado
        show(vc, sender: nil)
    }
    
}

extension RegistroViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return codigoCervezas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return codigoCervezas[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        codigoTextField.text = codigoCervezas[row]
        codigoTextField.resignFirstResponder()
        

    }
}

