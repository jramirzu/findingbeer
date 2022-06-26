//
//  DireccionesViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 23/06/22.
//

import UIKit

class DireccionesViewController: UIViewController {
    
    @IBOutlet weak var direccionesTableView: UITableView!
    
    var codigo = "p"
    
    var pilsenlata = [
        "Calle Independencia 270",
        "Calle Manco Capac 750",
        "Calle Tacna 980",
        "Av. Enrique Palacios 350"
    ]
    
    var cuzqueña = [
        "Aramburu 489",
        "Calle Lampara 290",
        "Av. ",
        "dir 4"
    ]
    
    var cervezas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        if codigo == "123456789" {
            cervezas = pilsenlata
        } else {
            cervezas = cuzqueña
        }
        direccionesTableView.dataSource = self
    }
}

extension DireccionesViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if codigo == "p" {
          return "Pilsen"
        } else {
          return "Cuzqueña"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cervezas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = cervezas[indexPath.row]
        return celda
    }

}

