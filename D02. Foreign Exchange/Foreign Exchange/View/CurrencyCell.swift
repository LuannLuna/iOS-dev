//
//   Configure the view for the selected state     }  CurrencyCell.swift
//  Foreign Exchange
//
//  Created by Luann Marques Luna on 30/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    var currencyRate : CurrencyRate? {
        didSet {
            
            guard let currencyRate = currencyRate else {
                return
            }
            
            rateLabel?.text = "\(currencyRate.rate)"
            currencyLabel?.text = currencyRate.currencyIso
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
