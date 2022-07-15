//
//  DireccionesViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 23/06/22.
//

import UIKit

class DireccionesViewController: UIViewController  {
    
    @IBOutlet weak var direccionesTableView: UITableView!
    

    var locales: [Local] = [] // ok
    
    override func viewDidLoad() {
        super.viewDidLoad()  // llamando a la clase padre, con super estamos llamando a la clase padre para que ejecute la funcion viewDiLoad y después ejecute después nuestras propias funcionalidad.es
        
        view.backgroundColor = .systemPurple // propiedad
        
        direccionesTableView.delegate = self //
        direccionesTableView.dataSource = self // el dataSource maneja la estructura de la tabla
    }
}

extension DireccionesViewController: UITableViewDataSource, UITableViewDelegate { // dentro estamos implementando el método que  me dé  la marca del primer elemento del arrelgo de locales, consiga el número de locales del arrelgo  y el número de  la fila.
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        locales.first?.marca //Dame la marca del primer elemento del arreglo locales
      
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locales.count //Consigue el número de locales del arreglo locales
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell //Aqui cada Label que viene por defecto en la customTableViewCell, le voy a colocar un texto. indextpath trae el número de fila y sección de la celda.
        
        let local = locales[indexPath.row] 
      
        celda?.direccionLocalLabel?.text = local.direccion //
        celda?.nameLocalLabel?.text = local.nombreLocal
        celda?.telefonoLocalLabel.text = String(local.telefono)
        celda?.codigo?.text = String(local.codigo)
        celda?.horarioLocalLabel.text = local.horario
        
//
        if let url = URL(string: local.image_url) {
                    let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
                        
                        DispatchQueue.main.async { /// execute on main threadself.imageView.image = UIImage(data: da
                            celda?.localImageView?.image = UIImage(data: data)
                        }
                    }
                    
                    task.resume()
                }
                
                celda?.localImageView?.image = UIImage()
        
        
        
//
        return celda!
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150 // me retorna el ancho del tableView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("locales:\(locales[indexPath.row].direccion)")
        
        guard
        let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapsViewController")
        
        
            as?MapsViewController  else{
                return
            }
        main.local = locales[indexPath.row]

                self.present(main, animated: true)
        
    }
}
    





