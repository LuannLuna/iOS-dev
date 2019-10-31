//
//  Coordinator.swift
//  StartCoordinator
//
//  Created by Luann Marques Luna on 31/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var children: [Coordinator] { get set }
    var nav: UINavigationController { get set }
    
    func start()
}

