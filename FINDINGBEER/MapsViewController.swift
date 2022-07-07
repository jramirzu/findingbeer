//
//  ModalViewController.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 23/06/22.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {
    var cerveza: Local?
    
    @IBOutlet weak var mapas: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
        override func viewDidAppear(_ animated: Bool) {
            guard let cerveza = cerveza else {
                return
            }

        map(cerveza: cerveza)
            createMarkers(latitude: cerveza.latitude, longitude: cerveza.longitude)
        // Do any additional setup after loading the view.
        
       
    }
    
}

extension MapsViewController : GMSMapViewDelegate {
    func map(cerveza: Local) {
        
        
        let camera = GMSCameraPosition.camera(withLatitude: cerveza.latitude,  longitude: cerveza.longitude, zoom: 18)
        
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
            
        
           // marker.userData = cerveza (Aqui se envía cualquier tipo de archivo
            
            marker.title = "testTitulo"
            
            marker.snippet = "testDecription"
            
            marker.map = mapas
        
    }
}


