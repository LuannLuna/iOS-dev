//
//  MainCoordinator.swift
//  StartCoordinator
//
//  Created by Luann Marques Luna on 31/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var children: [Coordinator] = []
    var nav: UINavigationController
    
    init(navigationController: UINavigationController) {
        nav = navigationController
    }
    
    func start() {
        nav.delegate = self
        let vc = ViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.coordinator = self
        nav.pushViewController(vc, animated: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        if let child = child {
            for (index, coordinator) in children.enumerated() {
                if coordinator === child {
                    children.remove(at: index)
                }
            }
        }
    }
    
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = nav.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if nav.viewControllers.contains(fromViewController) {
            return
        }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
}

extension MainCoordinator: AccountCreating {
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        nav.present(vc, animated: true, completion: nil)
    }
}

extension MainCoordinator: Buying {
    func buySubscription(to productType: Int) {
        let child = BuyCoordinator(nav: nav)
        child.parentCoordinator = self
        child.productType = productType
        children.append(child)
        child.start()
    }
}
