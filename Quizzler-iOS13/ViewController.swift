//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueBottom: UIButton!
    
    @IBOutlet weak var falseBottom: UIButton!
    
    let quiz = [
        ["four + two is equal to six","True"],
        ["five - three is greater than one","True"],
        ["three + eigth is less tahn ten","false"]
    ]
     var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        updateUI()
        
    }

    @IBAction func answerbotton(_ sender: UIButton) {
        
        let userAnwers = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnwers == actualAnswer{
            print("Right")
        }else{
            print("wrong")
        }
        
        if questionNumber + 1 < quiz.count {
            
            questionNumber += 1
            
            }
        else {
            questionNumber = 0
        }
        updateUI()
    }
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
      
        
    }
}

