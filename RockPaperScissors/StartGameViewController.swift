//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Evan Barbour on 2/17/19.
//  Copyright © 2019 Evan Barbour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playRock() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserChoice(rockButton)
        present(vc, animated: true, completion: nil)
    }

    @IBAction func playPaper() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserChoice(paperButton)
        present(vc, animated: true, completion: nil)
    }

    @IBAction func playScissors() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserChoice(scissorsButton)
        present(vc, animated: true, completion: nil)
    }
    
    private func getUserChoice(_ sender: UIButton) -> GameChoices {
        let choice = sender.title(for: UIControl.State())!
        return GameChoices(rawValue: choice)!
    }
}
