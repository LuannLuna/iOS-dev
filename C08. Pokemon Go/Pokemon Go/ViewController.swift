//
//  ViewController.swift
//  Pokemon Go
//
//  Created by Luann Marques Luna on 28/10/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var managerLocation: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        managerLocation.delegate = self
        
        managerLocation.requestWhenInUseAuthorization()
        managerLocation.startUpdatingLocation()
        
    }


}

extension ViewController: MKMapViewDelegate {
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse && status != .notDetermined {
            let alertController = UIAlertController(title: "Permissão de localização", message: "Para que você possa caçar Pokemon, precisamos da sua localização", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Configurações", style: .default, handler: { (action) in
                if let settings = NSURL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settings as URL)
                }
            }))
            alertController.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
    }
}
