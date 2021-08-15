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
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateNews()
    }
    
    private
    func populateNews() {
        
        URLRequest.load(resource: ArticleList.all).subscribe(onNext: { [weak self] result in
            if let result = result {
                self?.articles = result.articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.description
        
        return cell
    }
    
}

