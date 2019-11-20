//
//  BuyCoordinator.swift
//  StartCoordinator
//
//  Created by Luann Marques Luna on 20/11/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var children: [Coordinator]
    var nav: UINavigationController
    
    var productType = 0
    
    init(nav: UINavigationController) {
        self.nav = nav
        children = [Coordinator]()
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = productType
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
    
//    func didFinishBuying() {
//        parentCoordinator.childDidFinish(self)
//    }
    
}
