//
//  ViewController.swift
//  dicegame
//
//  Created by Monica Lo on 2021/5/2.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var leftDiceImage: [UIImageView]!
    @IBOutlet var rightDiceImage: [UIImageView]!
    
    @IBOutlet weak var leftPoint: UILabel!
    @IBOutlet weak var rightPoint: UILabel!
    @IBOutlet weak var totalPoint: UILabel!
    
    let images = ["one", "two", "three", "four", "five", "six"]
    
    func roll(){
        var leftTotal = 0
        var rightTotal = 0
        var allTotal = 0
        
        for diceImage in leftDiceImage{
            let number = Int.random(in: 1...6)
            diceImage.image = UIImage(named: images[number - 1])
            leftTotal += number
        }
        
        for diceImage in rightDiceImage{
            let number = Int.random(in: 1...6)
            diceImage.image = UIImage(named: images[number - 1])
            rightTotal += number
        }
        
        leftPoint.text = "\(leftTotal)"
        rightPoint.text = "\(rightTotal)"
        
        allTotal = leftTotal + rightTotal
        totalPoint.text = "\(allTotal)"
    }
    
    let player = AVPlayer()
    
    func soundOfDice(){
         let fileUrl = Bundle.main.url(forResource: "diceRolling", withExtension: "mp3")!
         let playerItem = AVPlayerItem(url: fileUrl)
         player.replaceCurrentItem(with: playerItem)
         player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rollingDice(_ sender: UIButton) {
        soundOfDice()
        roll()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
       if motion == .motionShake {
          print("shake")
        
          soundOfDice()
          roll()
       }
    }
}


