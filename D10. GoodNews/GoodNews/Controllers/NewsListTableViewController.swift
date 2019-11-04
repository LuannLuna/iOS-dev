//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mohammad Azam on 2/5/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        let url: URL = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-04&sortBy=publishedAt&apiKey=9ae5003990a6457e929a934fdd531ee8")!
        
        Webservice().getArticles(url: url) { _ in
            
        }
        
        
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        
    }
    
}
