//
//  ViewController.swift
//  GuessingNumberGame
//
//  Created by Adisorn Chatnaratanakun on 3/27/2560 BE.
//  Copyright © 2560 Adisorn Chatnaratanakun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var guessingNumberTextField: UITextField!
    @IBOutlet var yourNumberLabel: UILabel!
    @IBOutlet var generateNumberLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var guessingNumberButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var randomData: Random?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        guessingNumberButton.addTarget(self, action: #selector(generateNumber), for: UIControlEvents.touchDown)
        answerLabel.isHidden = true
        configureActivityIndicator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureActivityIndicator() {
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.center = view.center
        view.addSubview(self.activityIndicator)
    }
    
    
    // MARK: Generate Number Function
    func generateNumber(){
        
        guard guessingNumberTextField.text != "" || guessingNumberTextField.text != nil else {
            displayAlert(title: "Please enter the number!!", message: "Please enter the number between 1000 and 9999")
            return
        }
        
        guard let guessingNumber = Int(guessingNumberTextField.text!) else {
            
            displayAlert(title: "Please enter the number!!", message: "Please enter the number between 1000 and 9999")
            
            return
        }
        
        switch guessingNumber {
    
        case 1000...9999:
            
            answerLabel.isHidden = false
            fetchRandomNumber()
            
        default:
            
            displayAlert(title: "Please enter the number!!", message: "Please enter the number between 1000 and 9999")
            break
            
        }
        
    }
    
    
    func fetchRandomNumber() {
        
        self.activityIndicator.startAnimating()
        
        LibrayAPI.sharedInstance.generateNumber().then {
            (data:Random) -> () in
            
            self.randomData = data
            self.yourNumberLabel.text = "Your guess number are: \(self.guessingNumberTextField!.text!)"
        
            guard let randomNumber = data.randomNumber!.data!.first else {
                print("Number is nil")
                return
            }
            
            self.generateNumberLabel.text = "The number are: \(randomNumber)"
            self.checkNumber()
            self.activityIndicator.stopAnimating()
            
            }.catch { (error) in
                print("error")
                self.activityIndicator.stopAnimating()
        }
    }
    
    func checkNumber() {
        
        guard let randomNumber = self.randomData?.randomNumber?.data else {
            
            print("Number is nil")
            
            return
        }
        
        guard let guessingNumber = Int(guessingNumberTextField.text!) else {
            print("Input number is nil")
            return
        }
        
        if guessingNumber == randomNumber.first {
            answerLabel.text = "You guessed it right!!"
        }else{
            answerLabel.text = "You guessed it wrong!!"
        }
        
    }
    func displayAlert(title: String, message: String) {
        
        let alertViewController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alertViewController.addAction(alertAction)
        
        self.present(alertViewController, animated: true, completion: nil)
    }

}

