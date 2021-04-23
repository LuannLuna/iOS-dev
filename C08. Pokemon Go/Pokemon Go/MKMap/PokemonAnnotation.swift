//
//  PokemonAnnotation.swift
//  Pokemon Go
//
//  Created by Luann Marques Luna on 23/04/21.
//  Copyright © 2021 Luann Luna. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    
    init(coordinate: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coordinate
        self.pokemon = pokemon
    }
}
