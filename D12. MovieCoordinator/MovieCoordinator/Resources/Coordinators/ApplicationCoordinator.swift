//
//  ApplicationCoordinator.swift
//  MovieCoordinator
//
//  Created by Luann Marques Luna on 20/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var children: [Coordinator]
    var navigationController: UINavigationController
    
    private let window: UIWindow
    
    init(window: UIWindow, movies: [Movie]) {
        self.window = window
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        
        children = [Coordinator]()
        children.append(MovieListCoordinator(navigationController: navigationController, movies: movies))
    }
    
    func start() {
        window.rootViewController = navigationController
        children.first?.start()
        window.makeKeyAndVisible()
    }
    
}
