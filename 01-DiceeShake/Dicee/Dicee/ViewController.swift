//
//  ViewController.swift
//  Dicee
//
//  Created by 胡晗 on 2020/10/21.
//  Copyright © 2020 maxwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceeImageView1: UIImageView!
    @IBOutlet weak var diceeImageView2: UIImageView!
    
    let diceeImages = ["dice1","dice2","dice3","dice4","dice5","dice6"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //初始化骰子值
        updateDiceImages()
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    //Roll 按钮被点击时调用这个函数
    @IBAction func roll(_ sender: Any) {
        updateDiceImages()
    }
    
    //更新骰子图片
    func updateDiceImages(){
        let index1 = Int.random(in: 0...5)
        let index2 = Int.random(in: 0...5)
        
        diceeImageView1.image = UIImage(named: diceeImages[index1])
        diceeImageView2.image = UIImage(named: diceeImages[index2])
    }
}

