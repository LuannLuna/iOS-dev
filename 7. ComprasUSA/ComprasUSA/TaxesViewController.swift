//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Luann Luna on 29/12/18.
//  Copyright © 2018 luna. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxesDescription: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    @IBOutlet weak var lbIOSDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }

    func calculateTaxes(){
        lbStateTaxesDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTaxe, withCurrency: ""))%)"
        lbIOSDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStateTaxes.text = tc.getFormattedValue(of: tc.stateTaxeValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ ")
        lbReal.text = tc.getFormattedValue(of: tc.calculate(usingCreditCard: swCreditCard.isOn), withCurrency: "R$ ")
    }
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
}
