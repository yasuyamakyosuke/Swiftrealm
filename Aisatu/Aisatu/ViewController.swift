//
//  ViewController.swift
//  Aisatu
//
//  Created by 泰山恭輔 on 2020/12/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ok(_ sender: Any) {
        let name = textField.text!
        if name.count == 0 {
            nameLabel.text = "こんにちは"
            
        }else{
        nameLabel.text = "こんにちは" + textField.text! + "さん"
        }
    }
    
}

