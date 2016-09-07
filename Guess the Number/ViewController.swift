//
//  ViewController.swift
//  Guess the Number
//
//  Created by Arihan Shah on 9/6/16.
//  Copyright © 2016 Arihan Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var guestLabel: UILabel!
    @IBOutlet weak var guestTextField: UITextField!
    
    //Variables
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess : Int!
    var numberOfGuesses = 0
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    @IBAction func submitButtonPress(sender: UIButton) {
        if let guess = guestTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(guess: Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            guestLabel.text = "Higher⬆️"
        } else if guess > numberToGuess {
            guestLabel.text = "Lower⬇️"
        } else {
            showSuccessAlert()
            guestLabel.text = "Guess the Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Got it!", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "You Win!", message: "Congratulations!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Nice!", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

