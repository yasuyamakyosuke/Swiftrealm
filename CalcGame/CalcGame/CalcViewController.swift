//
//  CalcViewController.swift
//  CalcGame
//
//  Created by 泰山恭輔 on 2020/12/16.
//

import UIKit
import AVFoundation

class CalcViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var answer = 0
    var point = 0
    var time = 20
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        makeNewQuestion()
        setButtonTitle()
        
        button1.addTarget(self, action: #selector(onBuntton(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(onBuntton(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(onBuntton(_:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(onBuntton(_:)), for: .touchUpInside)
    }
    
    @objc func countTime(){
        time = time - 1
        timeLabel.text = "残り\(time)秒"
        if time  == 0{
            //残り時間が0になったとき
            timer?.invalidate()
            performSegue(withIdentifier: "result", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ResultViewController
        nextVC.point = point
    }
    
    @objc func onBuntton(_ sender:UIButton){
        let input = Int(sender.currentTitle!)
        //正解だったときの処理
        if input == answer {
            point = point + 10
            resultLabel.text = "前回の問題:正解"
            playSound(name: "maruSound")
        }else{
            //不正解だったときの処理
            point = point - 10
            resultLabel.text = "前回の問題:不正解"
            playSound(name: "batsuSound")
        }
        
    }
    
    func makeNewQuestion(){
        let num1 = Int.random(in: 0...9)
        let num2 = Int.random(in: 0...9)
        questionLabel.text = "\(num1) + \(num2) ="
        answer = num1 + num2
    }
    
    func setButtonTitle(){
        var answerList = [answer]
        while answerList.count < 4 {
            let randomAnswer = Int.random(in: 0...18)
            if !answerList.contains(randomAnswer){
                answerList.append(randomAnswer)
            }
        }
        answerList.shuffle()
        button1.setTitle(String(answerList[0]), for: .normal)
        button2.setTitle(String(answerList[1]), for: .normal)
        button3.setTitle(String(answerList[2]), for: .normal)
        button4.setTitle(String(answerList[3]), for: .normal)
    }
    
    var player:AVAudioPlayer?
    
    func playSound(name:String){
        let path = Bundle.main.bundleURL.appendingPathComponent(name+".mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player?.play()
        } catch  {
            print ("error")
        }
    }
    

}
