//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Evan Barbour on 2/17/19.
//  Copyright © 2019 Evan Barbour. All rights reserved.
//

import UIKit

enum GameChoices: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    static func randomChoice() -> GameChoices {
        let randChoice = Int(arc4random_uniform(3))
        let choices = ["Rock", "Paper", "Scissors"]
        return GameChoices(rawValue: choices[randChoice])!
    }
}

class ResultsViewController: UIViewController {
    
    var userChoice: GameChoices!
    let opponentChoice: GameChoices = GameChoices.randomChoice()
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var playagainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        gameResult()
    }
        

        func gameResult() {
            var text: String
            let match = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
            
            switch (userChoice!, opponentChoice) {
            case let (user, opponent) where user == opponent:
                text = "\(match): it's a tie!"
            case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
                text = "\(match): you win!"
            default:
                text = "\(match): you lose!"
        }
            resultsLabel.text = text
        }

    @IBAction func playAgain() {
        performSegue(withIdentifier: "playAgain", sender: playagainButton)
    }
}
