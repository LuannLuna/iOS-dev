//
//  GameOverViewController.swift
//  MoviaQuiz
//
//  Created by Luann Luna on 30/05/19.
//  Copyright © 2019 luannluna. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var lbScore: UILabel!
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbScore.text = "\(score)"
    }
    
    // MARK: - Navigation

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
