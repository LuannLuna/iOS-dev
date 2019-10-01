//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Luann Luna on 27/12/18.
//  Copyright © 2018 luna. All rights reserved.
//

import Foundation
class Quiz {
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String){
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    public func validateOptions(_ index: Int) -> Bool{
        let answer = options[index]
        return answer == self.correctedAnswer
    }
    
    deinit{
        print("Liberou quiz da memória")
    }
}
