//
//  BuyViewController.swift
//  StartCoordinator
//
//  Created by Luann Marques Luna on 31/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {

    weak var coordinator: BuyCoordinator?
    var selectedProduct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        coordinator?.didFinishBuying()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
