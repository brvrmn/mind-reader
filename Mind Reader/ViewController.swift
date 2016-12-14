//
//  ViewController.swift
//  Mind Reader
//
//  Created by Focused on 12/12/16.
//  Copyright © 2016 Braverman.IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentGuess: Int = 0
    var guessCount: Int = 1
    var currentStatus = ""
    var lowerBound = 1
    var higherBound = 101
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var higherButton: UIButton!
    @IBOutlet weak var guessesLeft: UILabel!
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        newGame()
    }


    @IBAction func nextButtonPressed(_ sender: UIButton) {
 
        hideButtons(hidden: false)
        questionLabel.text = "Is it \(currentGuess)?"
        
    }
   
    @IBAction func lowerButtonPressed(_ sender: UIButton) {
        currentStatus = "lower"
        guessNum()
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        currentStatus = "correct"
        guessNum()
    }
    
    @IBAction func higherButtonPressed(_ sender: UIButton) {
        currentStatus = "higher"
        guessNum()
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        newGame()
    }
    
    func newGame() {
        
        hideButtons(hidden: true)
        questionLabel.text = "Think of a number 1-100..."

        //reset variables
        
        guessCount = 1
        guessesLeft.text = "Guess number \(guessCount)"
        currentGuess = Int(arc4random_uniform(100)) + 1
        currentStatus = ""
        lowerBound = 0
        higherBound = 101
    
    }
    
    func guessNum() {
        
        
        guessCount += 1
        guessesLeft.text = "Guess number \(guessCount)"
        
        switch currentStatus {
            
            case "lower":
                
                higherBound = currentGuess
                currentGuess = currentGuess - ((currentGuess - lowerBound) / 2)
                questionLabel.text = "Is it \(currentGuess)?"
            
            
            case "higher":
                
               lowerBound = currentGuess
                currentGuess = currentGuess + (higherBound - currentGuess) / 2
                questionLabel.text = "Is it \(currentGuess)?"

            case "correct":
                questionLabel.text = "Yay, I win! Play again?"
                hideButtons(hidden: true)
                restartButton.isHidden = false
                nextButton.isHidden = true
            
            default:
                print("Uh-oh, you broke it!")
            }
        
    }
    
    func hideButtons (hidden: Bool) {
        
        lowerButton.isHidden = hidden
        higherButton.isHidden = hidden
        yesButton.isHidden = hidden
        guessesLeft.isHidden = hidden
        nextButton.isHidden = !hidden
        restartButton.isHidden = hidden
    }

}

