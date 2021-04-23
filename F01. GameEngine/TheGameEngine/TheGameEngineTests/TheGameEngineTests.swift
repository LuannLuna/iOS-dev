//
//  TheGameEngineTests.swift
//  TheGameEngineTests
//
//  Created by Luann Marques Luna on 26/01/21.
//

import XCTest
@testable import TheGameEngine

class TheGameEngineTests: XCTestCase {
    
    let router = RouterSpy()

    func test_start_noQuestions_doesNotRouteToQuestion() {
        let sut = makeSUT(questions: [])
        sut.start()
        
        XCTAssertTrue(router.routedQuestions.isEmpty)
    }
    
    func test_start_withOneQuestion_routesToQuestion() {
        let sut = Flow(questions: ["Q1"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestions.count, 1)
    }
    
    func test_start_withOneQuestion_routesToCorrectQuestion() {
        let sut = Flow(questions: ["Q1"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
    
    func test_startAndAnswerFirstQuestionAndSecondQuestion_withThreeQuestions_routesToSecondAndThirdQuestion() {
        let sut = makeSUT(questions: ["Q1", "Q2", "Q3"])
        sut.start()
        
        router.answerCallback("A1")
        router.answerCallback("A2")
        
        XCTAssertEqual(router.routedQuestions, ["Q1", "Q2", "Q3"])
        
    }
    
    func test_start_noQuestions_doesNotRouteToResult() {
        let sut = makeSUT(questions: [])
        sut.start()
        
        XCTAssertEqual(router.routedResult, [:])
    }
    
    func test_start_withOneQuestion_routesToResult() {
        let sut = makeSUT(questions: ["Q1"])

        sut.start()
        router.answerCallback("A1")

        XCTAssertEqual(router.routedResult!, ["Q1": "A1"])
    }
    
    func test_start_withTwoQuestion_routesToResult() {
        let sut = makeSUT(questions: ["Q1", "Q2"])

        sut.start()
        router.answerCallback("A1")
        router.answerCallback("A2")
        XCTAssertEqual(router.routedResult!, ["Q1": "A1", "Q2": "A2"])
    }
    
    func test_startAndAnswerFirstQuestion_withTwoQuestion_doesNotRoutesToResult() {
        let sut = makeSUT(questions: ["Q1", "Q2"])

        sut.start()
        router.answerCallback("A1")
        
        XCTAssertNil(router.routedResult)
    }
    
    
    //MARK: - Helpers
    
    func makeSUT(questions: [String]) -> Flow {
        return Flow(questions: questions, router: router)
    }
    
    
    class RouterSpy: RouterType {
        
        var routedQuestions: [String] = []
        var routedResult: [String: String]?
        var answerCallback: RouterType.AnswerCallback = { _ in }
        
        func routeTo(question: String, answerCallback: @escaping RouterType.AnswerCallback) {
            routedQuestions.append(question)
            self.answerCallback = answerCallback
        }
        
        func routeTo(result: [String : String]) {
            routedResult = result
        }
    }
}
