//
//  Flow.swift
//  TheGameEngine
//
//  Created by Luann Marques Luna on 26/01/21.
//

import Foundation

protocol RouterType {
    typealias AnswerCallback = (String) -> Void
    func routeTo(question: String, answerCallback: @escaping AnswerCallback)
    func routeTo(result: [String: String])
}

class Flow {
    let router: RouterType
    let questions: [String]
    
    private var result: [String: String] = [:]
    
    init(questions: [String], router: RouterType) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        if let question = questions.first {
            router.routeTo(question: question, answerCallback: routerNext(question))
        } else {
            router.routeTo(result: [:])
        }
    }
    
    
    private func routerNext(_ question: String) -> RouterType.AnswerCallback {
        return { [weak self] in self?.routeNext(question: question, answer: $0) }
    }
    
    private func routeNext(question: String, answer: String) {
        if let currentQuestionIndex = questions.firstIndex(of: question) {
            result[question] = answer
            if currentQuestionIndex + 1 < questions.count {
                let nextQuestion = questions[currentQuestionIndex + 1]
                router.routeTo(question: nextQuestion, answerCallback: routerNext(nextQuestion))
            } else {
                router.routeTo(result: result)
            }
        }
    }
}
