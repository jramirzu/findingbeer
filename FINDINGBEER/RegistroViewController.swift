//
//  RegistroViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 24/06/22.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var codigoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codigoTextField.backgroundColor = .white
        codigoTextField.placeholder = "Registrar N° de Código de Barra"
        codigoTextField.font = UIFont.boldSystemFont(ofSize: 14)
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
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
