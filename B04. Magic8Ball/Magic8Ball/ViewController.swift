//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Luann Marques Luna on 01/10/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivAnswer: UIImageView!
    
    var randomBallNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAnswer()
    }

    @IBAction func askButtonPressede(_ sender: UIButton) {
        updateAnswer()
    }
    
    func updateAnswer() {
        randomBallNumber = Int(arc4random_uniform(5)) + 1
        
        ivAnswer.image = UIImage(named: "ball\(randomBallNumber)")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateAnswer()
    }
    
}

