//
//  BaseViewController.swift
//  Mensagens
//
//  Created by Luann Luna on 28/12/18.
//  Copyright © 2018 Luann Luna. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var lbMessage: UILabel!
    var message: Message!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColor(_ sender: UIButton){
        if let delegate = self as? ColorPickerDelegate{
            let colorPicker = storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
            colorPicker.modalPresentationStyle = .overCurrentContext
            colorPicker.delegate = delegate
            present(colorPicker, animated: true, completion: nil)
        }
    }

}
