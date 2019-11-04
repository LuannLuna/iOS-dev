//
//  Article.swift
//  GoodNews
//
//  Created by Luann Marques Luna on 04/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
