//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Luann Luna on 27/12/18.
//  Copyright © 2018 luna. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbAnswered.text = "Perguntas respondidas: " + String(describing: totalAnswers)
        lbCorrect.text = "Perguntas corretas: " + String(describing: totalCorrectAnswers)
        lbWrong.text = "Perguntas erradas: " + String(describing: totalCorrectAnswers - totalCorrectAnswers)
        
        let score = (totalCorrectAnswers * 100) / totalAnswers
        lbScore.text = String(describing: score) + "%"
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
