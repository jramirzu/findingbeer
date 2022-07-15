//
//  RegistroViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 24/06/22.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var marcaTextField: UITextField!
    
    let marcaCervezas = ["pilsen", "cuzqueña", "barbarian"]
    var pickerVieW = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marcaTextField.inputView = pickerVieW
        
        marcaTextField.backgroundColor = .white
        marcaTextField.placeholder = "Seleccionar tu marca preferida"
        marcaTextField.font = UIFont.boldSystemFont(ofSize: 14) // propiedades del TexField
        marcaTextField.textAlignment = .center
        
        pickerVieW.delegate = self
        pickerVieW.dataSource = self
    }
   
    
    
    @IBAction func registrar(_ sender: Any) {
      
 
       let marca = marcaTextField.text ?? "" // // default is nil
        print(marca)

        let locales = LocalRepository().getLocales()
     
       let localesFiltrado =  locales.filter{ local in
           return local.marca == String(marca)  // función filtrar de todo el arreglo de locales que tenga contengan exactamente la marca colocada en marcaTexTField
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DireccionesViewController") as! DireccionesViewController // Instanciando el viewcontroller desde el storyboard
        
        print("Estos son locales filtrados:\(localesFiltrado.count)") //agregado count
        
        vc.locales = localesFiltrado // asignando los locales filtrados
        show(vc, sender: nil)
    }
}


extension RegistroViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1 //método que retorna el número de columnas del display
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return marcaCervezas.count //retorna el número de filas de cada componente
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return marcaCervezas[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        marcaTextField.text = marcaCervezas[row]
        marcaTextField.resignFirstResponder()
        

    }
}

