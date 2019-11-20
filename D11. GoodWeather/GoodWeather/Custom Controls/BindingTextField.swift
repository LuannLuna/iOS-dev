//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Luann Marques Luna on 19/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit

class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func bind(callback: @escaping (String) -> ()){
        textChangeClosure = callback
    }
    
    private func commonInit() {
        addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            textChangeClosure(text)
        }
    }
    
}
