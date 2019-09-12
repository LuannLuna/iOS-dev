//
//  UIViewController+TaxesCaculator.swift
//  ComprasUSA
//
//  Created by Luann Luna on 05/01/19.
//  Copyright © 2019 luna. All rights reserved.
//

import UIKit
extension UIViewController {
    var tc: TaxesCalculator {
        return TaxesCalculator.shared
    }
}
