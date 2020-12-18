//
//  ResultViewController.swift
//  CalcGame
//
//  Created by 泰山恭輔 on 2020/12/18.
//

import UIKit

class ResultViewController: UIViewController {

    
    var point  = 0
    @IBOutlet weak var recordLabel: UILabel!
    
    @IBOutlet weak var highestRecordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordLabel.text = "あなたの記録 \(point)P"
        UserDefaults.standard.register(defaults: ["record":0])
        let highestRecord = UserDefaults.standard.integer(forKey: "record")
        
        if highestRecord < point {
            //最高記録更新の場合
            UserDefaults.standard.setValue(point, forKey: "record")
        }else{
            highestRecordLabel.text = "最高記録\(highestRecord)P"
        }

        // Do any additional setup after loading the view.
    }
    
    

}
