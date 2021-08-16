//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Luann Luna on 15/08/21.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return articlesVM[index]
    }
}

struct ArticleViewModel {
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: Observable<String> {
        Observable.just(article.title)
    }
    
    var description: Observable<String> {
        Observable.just(article.description ?? "")
    }
}
