//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Luann Marques Luna on 05/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with article: ArticleViewModel) {
        self.textLabel?.text = article.title
        self.detailTextLabel?.text = article.description
    }

}
