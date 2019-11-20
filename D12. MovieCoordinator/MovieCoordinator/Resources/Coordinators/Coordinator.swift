//
//  Coordinator.swift
//  MovieCoordinator
//
//  Created by Luann Marques Luna on 20/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
