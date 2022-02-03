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
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var tercerboton: UIButton!
    
    
    var quizBrain = QuizBrain()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        updateUI()
        
    }

    @IBAction func answerbotton(_ sender: UIButton) {
        
        
        
        let userAnwers = sender.currentTitle! // esta se llama a los dos botones con acciones que tienen true o false
        let userGotIt = quizBrain.checkAnswer(userAnwers) // aca llamos la func de quizbrain y se reemplaza por el outpus
        
        if userGotIt {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false) // con updateUI llamamos la funcion que retrasamos
    }
    @objc func updateUI() {
        
        
        questionLabel.text = quizBrain.getQuestiontext()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueBottom.backgroundColor = UIColor.clear
        falseBottom.backgroundColor = UIColor.clear
        tercerboton.backgroundColor = UIColor.clear
        trueBottom.setTitle(quizBrain.getTrueBotton(), for: .normal)
        falseBottom.setTitle(quizBrain.getFalseBotton(), for: .normal)
        tercerboton.setTitle(quizBrain.getTercerBotton(), for: .normal)
        
    }
}

