//
//  PlaceAnnotation.swift
//  QueroConhecer
//
//  Created by Luann Luna on 19/02/19.
//  Copyright © 2019 luna. All rights reserved.
//

import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    enum PlaceType {
        case place
        case poi
    }
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: PlaceType
    var address: String?
    
    init(coordinate: CLLocationCoordinate2D, type: PlaceType) {
        self.coordinate = coordinate
        self.type = type
    }
    
}
