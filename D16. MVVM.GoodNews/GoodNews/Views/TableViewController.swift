//
//  ViewController.swift
//  GoodNews
//
//  Created by Luann Luna on 15/08/21.
//

import UIKit
import RxCocoa
import RxSwift

class TableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    var articleListViewModel: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateNews()
    }
    
    private
    func populateNews() {
        
        URLRequest.load(resource: ArticleList.all)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.articleListViewModel = ArticleListViewModel(result.articles)
                    self?.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel?.articlesVM.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let article = articleListViewModel?.articleAt(indexPath.row)
        
        article?.title
            .asDriver(onErrorJustReturn: "")
            .drive(cell.textLabel!.rx.text)
            .disposed(by: disposeBag)
        article?.description
            .asDriver(onErrorJustReturn: "")
            .drive(cell.detailTextLabel!.rx.text)
            .disposed(by: disposeBag)
        
        return cell
    }
    
}

