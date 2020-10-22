//
//  Question.swift
//  Quizzler
//
//  Created by 胡晗 on 2020/10/22.
//  Copyright © 2020 rongcosme. All rights reserved.
//

import Foundation

class Question{
    
    let answer: Bool
    let questionText: String
    
    init(text:String,correctAnswer:Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
