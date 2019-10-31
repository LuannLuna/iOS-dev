//
//  MainCoordinator.swift
//  StartCoordinator
//
//  Created by Luann Marques Luna on 31/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    var nav: UINavigationController
    
    init(navigationController: UINavigationController) {
        nav = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        nav.pushViewController(vc, animated: false)
    }
    
    func buySubscription() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        nav.present(vc, animated: true, completion: nil)
    }
    
}
