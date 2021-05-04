//
//  ViewController.swift
//  dicegame
//
//  Created by Monica Lo on 2021/5/2.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var dice1ImageView: UIImageView!
    @IBOutlet weak var dice2ImageView: UIImageView!
    @IBOutlet weak var dice3ImageView: UIImageView!
    @IBOutlet weak var dice4ImageView: UIImageView!
    @IBOutlet weak var dice5ImageView: UIImageView!
    @IBOutlet weak var dice6ImageView: UIImageView!
    
    @IBOutlet weak var leftPoint: UILabel!
    @IBOutlet weak var rightPoint: UILabel!
    @IBOutlet weak var totalPoint: UILabel!
    
    let image = ["1", "2", "3", "4", "5", "6"]
    
    var leftTotal = 0
    var rightTotal = 0
    var allTotal = 0
       
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func soundOfDice(){
         let fileUrl = Bundle.main.url(forResource: "diceRolling", withExtension: "mp3")!
         let playerItem = AVPlayerItem(url: fileUrl)
         player.replaceCurrentItem(with: playerItem)
         player.play()
    }

    @IBAction func rollingDice(_ sender: UIButton) {
        let dice1Index = Int.random(in: 1...6)
        let dice2Index = Int.random(in: 1...6)
        let dice3Index = Int.random(in: 1...6)
        let dice4Index = Int.random(in: 1...6)
        let dice5Index = Int.random(in: 1...6)
        let dice6Index = Int.random(in: 1...6)
        
        soundOfDice()
        
        dice1ImageView.image = UIImage(named: "\(dice1Index)")
        dice2ImageView.image = UIImage(named: "\(dice2Index)")
        dice3ImageView.image = UIImage(named: "\(dice3Index)")
        dice4ImageView.image = UIImage(named: "\(dice4Index)")
        dice5ImageView.image = UIImage(named: "\(dice5Index)")
        dice6ImageView.image = UIImage(named: "\(dice6Index)")
        
        leftTotal = dice1Index + dice2Index + dice3Index
        leftPoint.text = "\(leftTotal)"
        
        rightTotal = dice4Index + dice5Index + dice6Index
        rightPoint.text = "\(rightTotal)"
        
        allTotal = dice1Index + dice2Index + dice3Index + dice4Index + dice5Index + dice6Index
        totalPoint.text = "\(allTotal)"
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
       if motion == .motionShake {
          print("shake")
         
          let dice1Index = Int.random(in: 1...6)
          let dice2Index = Int.random(in: 1...6)
          let dice3Index = Int.random(in: 1...6)
          let dice4Index = Int.random(in: 1...6)
          let dice5Index = Int.random(in: 1...6)
          let dice6Index = Int.random(in: 1...6)
        
          soundOfDice()
        
          dice1ImageView.image = UIImage(named: "\(dice1Index)")
          dice2ImageView.image = UIImage(named: "\(dice2Index)")
          dice3ImageView.image = UIImage(named: "\(dice3Index)")
          dice4ImageView.image = UIImage(named: "\(dice4Index)")
          dice5ImageView.image = UIImage(named: "\(dice5Index)")
          dice6ImageView.image = UIImage(named: "\(dice6Index)")
        
          leftTotal = dice1Index + dice2Index + dice3Index
          leftPoint.text = "\(leftTotal)"
        
          rightTotal = dice4Index + dice5Index + dice6Index
          rightPoint.text = "\(rightTotal)"
        
          allTotal = dice1Index + dice2Index + dice3Index + dice4Index + dice5Index + dice6Index
          totalPoint.text = "\(allTotal)"
       }
    }
    
}


