//
//  HeroTableViewCell.swift
//  HeroisMarvel
//
//  Created by Luann Marques Luna on 05/07/19.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepareCell(with hero: Hero) {
        lbName.text = hero.name
        lbDescription.text = hero.description
        ivThumb.kf.indicatorType = .activity
        ivThumb.kf.setImage(with: URL(string: hero.thumbnail.url)!)
        
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height / 2
        ivThumb.layer.borderColor = UIColor.red.cgColor
        ivThumb.layer.borderWidth = 2
    }

}
