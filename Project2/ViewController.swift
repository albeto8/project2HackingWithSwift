//
//  ViewController.swift
//  Project2
//
//  Created by Mario Alberto Barragán Espinosa on 9/28/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(scoreTapped))
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }
    
    @objc func scoreTapped() {
        let ac = UIAlertController(title: title, message: "Current score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if questionsAnswered == 3 {
            let ac = UIAlertController(title: "Finish", message: "Your final score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (alert) in
                self.questionsAnswered = 0
                self.score = 0
                self.correctAnswer = 0
                self.askQuestion()
            }))
            present(ac, animated: true)
        } else {
            countries.shuffle()
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            correctAnswer = Int.random(in: 0...2)
            title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        questionsAnswered += 1
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong  That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

