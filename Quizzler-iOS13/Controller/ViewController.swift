//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //quizBrainへ委譲
    var quizBrain = QuizBrain()
    
    //アプリ起動時に一度だけされるアクション
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    //answerButtonPressedが押された時のアクション
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //userAnserという定数に、送り手のタイトルを代入
        guard let userAnswer = sender.currentTitle else { return }
        // userGotItRightという定数に、quizBrainで答えが合っているか調べたものを代入
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        //答え合わせし、答えが合っていたら、ボタンのカラーをグリーンにし間違っていたら赤にする
        sender.backgroundColor = userGotItRight ?  UIColor.green : UIColor.red
        
        //質問の進行をquizBrainに委譲
        quizBrain.nextQuestion()
        
        //タイマーの設定をする
        Timer.scheduledTimer(timeInterval:  0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //タイマーが終了したら画面を以下のように更新させろという指令
    @objc func updateUI () {
        //プログレスバーの今の状態を更新
        progressBar.progress = quizBrain.getProgress()
        //クイズ内容を更新
        questionLabel.text = quizBrain.getQuestionText()
        //スコア表示を更新
        scoreLabel.text = "Score: \(quizBrain.score)"
        //trueボタンのカラーをクリアに更新
        trueButton.backgroundColor = UIColor.clear
        //falseボタンのカラーをクリアに更新
        falseButton.backgroundColor = UIColor.clear
        
        
    }
}

