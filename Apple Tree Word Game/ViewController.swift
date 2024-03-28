//
//  ViewController.swift
//  Apple Tree Word Game
//
//  Created by Eva Derryberry on 3/27/24.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["party", "cat", "garfield", "python", "sparrow", "elephant", "sunflower", "watermelon", "brownie", "homework", "laptop", "apple"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    var currentGame: Game!
    
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

