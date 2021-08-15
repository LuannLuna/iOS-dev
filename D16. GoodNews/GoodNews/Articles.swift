//
//  Articles.swift
//  GoodNews
//
//  Created by Luann Luna on 15/08/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=9ae5003990a6457e929a934fdd531ee8")!
        
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String?
}
