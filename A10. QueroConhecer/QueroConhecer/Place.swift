//
//  Place.swift
//  QueroConhecer
//
//  Created by Luann Luna on 07/02/19.
//  Copyright © 2019 luna. All rights reserved.
//

import MapKit

struct Place: Codable {
    let name: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let address: String
    
    init(name: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees, address: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
    }
    
    var coordinate: CLLocationCoordinate2D {
        return  CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func getFormattedAddress(with placemark: CLPlacemark) -> String {
        var address = ""
        if let street = placemark.thoroughfare { // Rua
            address += street
        }
        if let number = placemark.subThoroughfare { // Numero
            address += " " + number
        }
        if let sublocality = placemark.subLocality { // Bairro
            address += ", " + sublocality
        }
        if let locality = placemark.locality { // Cidade
            address += ", " + locality
        }
        if let state = placemark.administrativeArea { // Estado
            address += " - " + state
        }
        if let postalCode = placemark.postalCode { // CEP
            address += "\nCEP: " + postalCode
        }
        if let country = placemark.country {
            address += " - " + country
        }
        return address
    }
}

extension Place: Equatable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
    }
}
