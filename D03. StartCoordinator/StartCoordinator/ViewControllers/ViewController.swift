//
//  ViewController.swift
//  StartCoordinator
//
//  Created by Luann Marques Luna on 31/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: (Buying & AccountCreating)?
    
    @IBOutlet weak var product: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: UIButton) {
        coordinator?.buySubscription(to: product.selectedSegmentIndex)
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        coordinator?.createAccount()
    }
}

