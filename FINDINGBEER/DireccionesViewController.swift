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
        super.viewDidLoad()
        view.backgroundColor = .systemPurple //ok
        
        direccionesTableView.delegate = self
        direccionesTableView.dataSource = self
    }
}

extension DireccionesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        locales.first?.marca //Dame la marca del primer elemento del arreglo cerveza
      
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locales.count //Consigue el número de locales del arreglo cerveza
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell
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
        
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("locales:\(locales[indexPath.row].direccion)")
        
        guard
        let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapsViewController")
        
        
            as?MapsViewController  else{
                return
            }
        main.local = locales[indexPath.row]
//
//                if let sheet = bottomSheet.sheetPresentationController {
//
//                    sheet.detents = [.medium()]
//
//                    sheet.prefersScrollingExpandsWhenScrolledToEdge = true
//
//                    sheet.prefersGrabberVisible = true
//
//                    sheet.preferredCornerRadius = 24
//
//                }

                self.present(main, animated: true)
        
    }
}
    





