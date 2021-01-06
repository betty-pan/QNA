//
//  ViewController.swift
//  QNA
//
//  Created by BettyPan on 2020/12/28.
//  Copyright © 2020 bettypan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var questionProgressSlider: UISlider!
    @IBOutlet weak var numOfQuestionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    //產生問題array
    var questions = [Question]()
    //題目
    var index = 0
    //顯示題數
    var count:Int = 1
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(description: "koala", answer: "Koala")
        questions.append(question1)
        let question2 = Question(description: "giraffe", answer: "Giraffe")
        questions.append(question2)
        let question3 = Question(description: "horse", answer: "Horse")
        questions.append(question3)
        let question4 = Question(description: "monkey", answer: "Monkey")
        questions.append(question4)
        let question5 = Question(description: "zebra", answer: "Zebra")
        questions.append(question5)
        let question6 = Question(description: "pig", answer: "Pig")
        questions.append(question6)
        let question7 = Question(description: "tiger", answer: "Tiger")
        questions.append(question7)
        let question8 = Question(description: "lion", answer: "Lion")
        questions.append(question8)
        let question9 = Question(description: "rhino", answer: "Rhino")
        questions.append(question9)
        let question10 = Question(description: "elephant", answer: "Elephant")
        questions.append(question10)
        
        //隨機出題
        questions.shuffle()
        //設題目圖片ImageView
        animalImageView.image = UIImage(named: questions[index].description)
        answerLabel.text = ""
        numOfQuestionLabel.text = "\(count)/10"
        
    }
    
    
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = questions[index].answer
    }
    
    @IBAction func speak(_ sender: UIButton) {
        var speechUtterance = AVSpeechUtterance()
        speechUtterance = AVSpeechUtterance(string: "\(answerLabel.text!)")
        speechUtterance.rate = 0.5
        speechUtterance.pitchMultiplier = 1.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)

    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        index = index + 1
        count = count + 1
        if count == questions.count+1 {
            index = 0
            count = 1
            //隨機出題
            questions.shuffle()
        }
        animalImageView.image = UIImage(named: questions[index].description)
        answerLabel.text = ""
        numOfQuestionLabel.text = "\(count)/10"
        questionProgressSlider.value = Float(count)
        
    }
        
    }
