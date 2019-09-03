//
//  ViewController.swift
//  GuessTheNumber12
//
//  Created by Abhinav Tirath on 9/3/19.
//  Copyright © 2019 Abhinav Tirath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var numberField: UITextField!
    var numberOfGuesses = 0
    
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    
    //Mark: - Setup View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }
    
    func generateRandomNumber() {
        numberToGuess = Int.random(in: lowerBound...upperBound) //inclusive
    }
    
    //MARK: - User Interaction

    @IBAction func submitButton(_ sender: Any) {
        if let guess = numberField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses += 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(_ guess: Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            titleLabel.text = "Higher! ⬆️"
        } else if guess > numberToGuess {
            titleLabel.text = "Lower! ⬇️"
        } else {
            //You win yay!
            showWinAlert()
            titleLabel.text = "Guess the Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
        numberField.text = ""
    }
    
    //MARK: - Alerts
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Got it!", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! 🎉", message: "You won with a total of \(numberOfGuesses) guesses.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}

