//
//  DireccionesViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 23/06/22.
//

import UIKit

class DireccionesViewController: UIViewController {
    
    @IBOutlet weak var direccionesTableView: UITableView!
    
    
    var cervezas: [Local] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
   
        direccionesTableView.dataSource = self
    }
}

extension DireccionesViewController: UITableViewDataSource  {
    
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

}






