//
//  RegistroViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 24/06/22.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var marcaTextField: UITextField!
    
    let marcaCervezas = ["pilsen", "cuzqueña"]
    var pickerVieW = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marcaTextField.inputView = pickerVieW
        
        marcaTextField.backgroundColor = .white
        marcaTextField.placeholder = "Seleccionar tu marca preferida"
        marcaTextField.font = UIFont.boldSystemFont(ofSize: 14)
        marcaTextField.textAlignment = .center
        
        pickerVieW.delegate = self
        pickerVieW.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrar(_ sender: Any) {
      
        let marca = marcaTextField.text ?? ""
        print(marca)
        

        let locales = LocalRepository().getLocales()
        print(locales[2].marca)
        let localesFiltrado =  locales.filter{ local in
           return local.marca == String(marca)
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DireccionesViewController") as! DireccionesViewController // Del identificador
        print("Estos son locales filtrados:\(localesFiltrado)")
        
        vc.locales = localesFiltrado // asignando los locales filtrados
        show(vc, sender: nil)
    }
    
}

extension RegistroViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return marcaCervezas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return marcaCervezas[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        marcaTextField.text = marcaCervezas[row]
        marcaTextField.resignFirstResponder()
        

    }
}

