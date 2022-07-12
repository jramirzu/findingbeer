//
//  ModalViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 23/06/22.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {
    var local: Local?
    
    @IBOutlet weak var mapas: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func atras(_ sender: Any) {
        self.dismiss(animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
            guard let local = local else {
                return
            }

        map(local: local)
            createMarkers(latitude: local.latitude, longitude: local.longitude)
        // Do any additional setup after loading the view.
        
    }
    
}

extension MapsViewController : GMSMapViewDelegate {
    func map(local: Local) {
        
        
        let camera = GMSCameraPosition.camera(withLatitude: local.latitude,  longitude: local.longitude, zoom: 18)
        
        //update camera
        
        mapas.camera = camera

        
        do {
            
            if let styleURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") {
                
                mapas.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                
            } else {
                
                NSLog("Unable to find style.json")
                
            }
            
        } catch {
            
            NSLog("One or more of the map styles failed to load. \(error)")
            
        }
        
        //create map with code
        
        /*
         
         mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
         
         self.view.addSubview(mapView)
         
         */
        
    }
    
    func createMarkers (latitude: Double, longitude: Double) {
        
        // Creates a marker in the center of the map.
        
            
            let marker = GMSMarker()
            
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            
            marker.title = "T"
            
            marker.snippet = "testDecription"
            
            marker.map = mapas
        
    }
}


