//
//  ViewController.swift
//  Tomiwa_ApplePie
//
//  Created by Tomiwa Babalola on 11/9/21.
//

import UIKit

var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]

let incorrectMovesAllowed = 7

var totalWins = 0
var totalLosses = 0
class ViewController: UIViewController {

    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
        
        var formattedWord: String {
        var guessedWord = ""
        for letter in word {
        if guessedLetters.contains(letter) {
        guessedWord += "\(letter)"
        }
        else {
        guessedWord += "_"
         }
        }
        return guessedWord
         }

    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
            }
        }
    }

    
    var currentGame: Game!
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining:
        incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }

    func updateUI() {
    var letters = [String]()
    for letter in currentGame.formattedWord {
        letters.append(String(letter))
    }
        _ = letters.joined(separator: " ")
    correctWordLabel.text = currentGame.formattedWord
    scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")

    }
    
    
    


    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()



    }
    
    

    


}

