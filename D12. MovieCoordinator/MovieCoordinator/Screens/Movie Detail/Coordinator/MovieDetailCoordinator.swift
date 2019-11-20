//
//  MovieDetailCoordinator.swift
//  MovieCoordinator
//
//  Created by Luann Marques Luna on 20/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class MovieDetailCoordinator: Coordinator {
    
    var children: [Coordinator]
    var navigationController: UINavigationController
    
    private var view: MovieDetailViewController?
    
    private let movie: Movie
    
    init(_ navigationController: UINavigationController, movie: Movie) {
        self.navigationController = navigationController
        self.movie = movie
        children = [Coordinator]()
    }
    
    func start() {
        view = MovieDetailViewController()
        view?.movie = movie
        
        guard let view = view else {
            fatalError("Could not initialize MovieDetailViewController")
        }
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
}
