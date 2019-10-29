//
//  ViewController.swift
//  Idade de Cachorro
//
//  Created by Luann Marques Luna on 28/10/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var lbAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateAge(_ sender: UIButton) {
        if let ageString = tfAge.text {
            guard let age: Int = Int(ageString) else { return }
            lbAge.text = "A idade do seu cachorro é: \(age * 7)"
        }
    }
    
}

