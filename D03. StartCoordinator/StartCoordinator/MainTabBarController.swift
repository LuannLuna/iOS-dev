//
//  MainTabBarController.swift
//  StartCoordinator
//
//  Created by Luann Marques Luna on 20/11/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    override func viewDidLoad() {
        super.viewDidLoad()

        main.start()
        viewControllers = [main.nav]
    }

}
