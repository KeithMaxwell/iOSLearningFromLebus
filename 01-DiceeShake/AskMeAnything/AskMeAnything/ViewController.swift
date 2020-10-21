//
//  ViewController.swift
//  AskMeAnything
//
//  Created by 胡晗 on 2020/10/21.
//  Copyright © 2020 maxwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    let answerImages = ["ball1","ball2","ball3","ball4","ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func answer(_ sender: Any) {
        updateAnswerImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateAnswerImage()
    }
    
    func updateAnswerImage(){
        let index = Int.random(in: 0..<answerImages.count)
        answerImageView.image = UIImage(named: answerImages[index])
    }
    
}

