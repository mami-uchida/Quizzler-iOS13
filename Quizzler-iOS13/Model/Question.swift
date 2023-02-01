//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 内田麻美 on 2022/11/18.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
//クイズの構造
struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String){
        text = q
        answer = a
    }
}
