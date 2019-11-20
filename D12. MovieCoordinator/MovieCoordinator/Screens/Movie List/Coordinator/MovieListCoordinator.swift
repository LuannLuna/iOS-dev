//
//  MovieListCoordinator.swift
//  MovieCoordinator
//
//  Created by Luann Marques Luna on 20/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class MovieListCoordinator: Coordinator {
    
    var children: [Coordinator]
    var navigationController: UINavigationController
    
    private var movies: [Movie]
    private var view: MovieListViewController?
    
    init(navigationController: UINavigationController, movies: [Movie]) {
        self.navigationController = navigationController
        self.movies = movies
        children = [Coordinator]()
    }
    
    func start() {
        view = MovieListViewController()
        view?.movies = movies
        view?.delegate = self
        
        guard let view = view else {
            fatalError("Error initialize MovieListViewController")
        }
        
        navigationController.pushViewController(view, animated: true)
    }
    
}

extension MovieListCoordinator: MovieListViewControllerDelegate {
    func movieListViewController(_ controller: MovieListViewController, didSelect movie: Movie) {
        let movieDetailCoordinator = MovieDetailCoordinator(navigationController, movie: movie)
        children.append(movieDetailCoordinator)
        movieDetailCoordinator.start()
    }
}
