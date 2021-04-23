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
    var locationManager: CLLocationManager = CLLocationManager()
    var counter: Int = 0
    var coreDataPokemon: CoreDataPokemon!
    var pokemons: [Pokemon] = []
    
    var totalPokemons: UInt32 { UInt32(pokemons.count) }
    
    var randomNumber: Double {
        (Double(arc4random_uniform(400)) - 200) / 100000.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        coreDataPokemon = CoreDataPokemon()
        pokemons = coreDataPokemon.getAllPokemons() ?? []
        
        Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { [weak self] _ in
            guard let strongSelf = self else { return }
            if  let coordinate = strongSelf.locationManager.location?.coordinate {
                
                let randomIndexNumber = arc4random_uniform(strongSelf.totalPokemons)
                
                let pokemon = strongSelf.pokemons[Int(randomIndexNumber)]
                
                let annotation = PokemonAnnotation(coordinate: coordinate,
                                                   pokemon: pokemon)
                
                annotation.coordinate.latitude += strongSelf.randomNumber
                annotation.coordinate.longitude += strongSelf.randomNumber
                
                strongSelf.mapView.addAnnotation(annotation)
            }
        }
    }

    @IBAction func centerPlayer(_ sender: UIButton) {
        centerPlayerOnMap()
    }
    
    @IBAction func openPokedex(_ sender: UIButton) {
        
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        if let pokemonImage = (annotation as? PokemonAnnotation)?.pokemon.nameImage {
            annotationView.image = UIImage(named: pokemonImage)
        } else {
            annotationView.image = #imageLiteral(resourceName: "player")
        }
        
        annotationView.frame.size = CGSize(width: 40, height: 40)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: true)
        
        guard let pokemonAnnotation = view.annotation as? PokemonAnnotation else { return }
        
        let region = MKCoordinateRegion(center: pokemonAnnotation.coordinate,
                                        latitudinalMeters: 200,
                                        longitudinalMeters: 200)
        mapView.setRegion(region, animated: true)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] timer in
            guard let strongSelf = self else { return }
            
            if let coordinate = strongSelf.locationManager.location?.coordinate {
                if mapView.visibleMapRect.contains(MKMapPoint(coordinate)) {
                    strongSelf.coreDataPokemon.savePokemon(pokemon: pokemonAnnotation.pokemon)
                    strongSelf.mapView.removeAnnotation(pokemonAnnotation)
                    
                    let alertController = UIAlertController(title: "Parabéns",
                                                            message: "Você capturou o pokemon \(pokemonAnnotation.pokemon.name ?? "")",
                                                            preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                    strongSelf.present(alertController, animated: true, completion: nil)
                }
            }
            
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    private func centerPlayerOnMap() {
        if  let coordinate = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
    }
    
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if counter < 5 {
            
            centerPlayerOnMap()
            
            counter += 1
            
        } else {
            locationManager.stopUpdatingLocation()
        }
    }
    
}
