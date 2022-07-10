//
//  DireccionesViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 23/06/22.
//

import UIKit

class DireccionesViewController: UIViewController  {
    
    @IBOutlet weak var direccionesTableView: UITableView!
    
    
    var cervezas: [Local] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        direccionesTableView.delegate = self
        direccionesTableView.dataSource = self
    }
}

extension DireccionesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        cervezas.first?.marca
      
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cervezas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = cervezas[indexPath.row].direccion
        return celda
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("locales:\(cervezas[indexPath.row].direccion)")
        
        guard
        let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapsViewController")
        
        
            as?MapsViewController  else{
                return
            }
        main.cerveza = cervezas[indexPath.row]
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
    





