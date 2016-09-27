//
//  ViewController.swift
//  Guess The Number
//
//  Created by Alejandrina Patron on 8/30/16.
//  Copyright © 2016 Georgia Tech iOS Club. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!

    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    
    //MARK - View Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }

    
    //MARK: - User Interaction
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(_ guess: Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            guessLabel.text = "Higher! ⬆️"
        } else if guess > numberToGuess {
            guessLabel.text = "Lower! ⬇️"
        } else {
            // You win yay!
            showWinAlert()
            guessLabel.text = "Guess the Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
        guessTextField.text = ""
    }
    
    
    //MARK: - Alerts
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! 🎉", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
