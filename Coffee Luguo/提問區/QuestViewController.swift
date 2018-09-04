//
//  QuestViewController.swift
//  Coffee Luguo
//
//  Created by 陳冠宇 on 2015/9/19.
//  Copyright © 2015年 陳冠宇. All rights reserved.
//

import UIKit


class QuestViewController: UIViewController {


    @IBOutlet weak var headLabelLeadConst: NSLayoutConstraint!
    
    @IBOutlet weak var subTextLeadConst: NSLayoutConstraint!
    
    @IBOutlet weak var leftButtonButtomConst: NSLayoutConstraint!
    
    @IBOutlet weak var rightButtonButtomConst: NSLayoutConstraint!
    
    @IBOutlet weak var utubeView: YTPlayerView!
    
    @IBOutlet weak var headLabel: UILabel!
    
    @IBOutlet weak var subTextView: UITextView!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var sliderBar: UISlider!
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    
    //utube
    var uTubeAdress: [String] = ["35gCiF22P0k", "35gCiF22P0k", "35gCiF22P0k", "35gCiF22P0k", "35gCiF22P0k"]
    
    //view
    var headLabelText = ["香氣", "回甘", "酸度", "醇度", "苦感"]
    var subTextText = ["香味是咖啡品質的重要指標，產地的氣候、處理過程及烘焙技術，都是會左右咖啡豆香味的重要條件，香氣是指沖煮完成的咖啡所發出的味道，用來形容咖啡氣味包括有焦糖味、可可味、水果味、花香味、濃郁、香辛味等。一般來說，香氣的消失正意味著品質變差。", "形容咖啡入口之後回甘轉甜的完美感受，令人聯想到糖漿，這種回味無窮的的美味口感也正是優質咖啡才能散發出來的風味。新鮮是造成回甘最主要的因素，香氣從喉頭湧上一股酥麻的感覺持續約二三分鐘，這種令人陶醉的餘味會一直讓你念念不忘。在烘焙與沖泡過程中，如果處理過度會很容易喪失這種咖啡的甘甜味。", "雖然很多人都喝不慣酸溜溜的咖啡，但許多老饕級的咖啡品味家卻喜歡淺焙咖啡活潑、明朗、富味覺變化的多種層次感。他們不喜愛單調又缺乏果酸味的深焙咖啡。其實，優質的淺焙咖啡會呈現一種活潑酸味，剛入口時會感受到果酸刺激，不過，沒一會兒酸味就消失了，轉化成辛香味，或檸檬、柑橘般的清香味，最後呈現如可可般的甜香。", "醇度應是指咖啡在口中濃稠黏滑的觸感，可以用豐厚來形容質感濃稠的咖啡，質感單薄的咖啡喝起來就像是一般的飲料汽水一樣。醇度的感受可分為清淡如水般的淡薄，中度如全脂鮮奶的口感以及深度如糖漿般的超高濃脂狀。", "這是深焙豆的特徵，和酸味一樣，不一定會令人感到不愉悅。一般說來酸味較強的咖啡，苦味會較弱"]
    var rightButtonText = ["下一題", "下一題", "下一題", "下一題", "看結果"]
    var leftButtonText = ["", "上一題", "上一題", "上一題", "上一題"]
    var rightLabelText = ["香氣濃", "甜", "酸", "醇濃", "苦"]
    var leftLabelText = ["香氣淡", "不甜", "不酸", "清淡", "不苦"]
    
    
    
    //question
    var questionIndex = 0
    var dataAnswer: [Float] = [0, 0, 0, 0, 0]
    var totalName = ["RankJmaica", "RankBazil", "RankColombia", "RankEthiopia", "RankIndonesia", "RankSumatra"]
    var totalRank: [[Float]] = [[3, 3, 1, 3, 2], [2, 3, 2, 2, 1], [3, 2, 2, 3, 1], [3, 2, 2, 3, 2], [1, 2, 1, 2, 3], [3, 2, 1, 2, 3]]
    var RankJmaica = [3, 3, 1, 3, 2]
    var RankBazil = [2, 3, 2, 2, 1]
    var RankColombia = [3, 2, 2, 3, 1]
    var RankEthiopia = [3, 2, 2, 3, 2]
    var RankIndonesia = [1, 2, 1, 2, 3]
    var RankSumatra = [3, 2, 1, 2, 3]
    
    var result = [Float]()
    var resultIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.swichText(index: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.openYoutube()
    }
    
    func openYoutube() {
        self.utubeView.load(withVideoId: self.uTubeAdress[self.questionIndex])
    }

    
//calculate
    func calculateScore() -> [Float] {
        var score: [Float] = [0, 0, 0, 0, 0, 0]
        var index = 0
        for rank in self.totalRank {
            var i = 0
            var singleScore: Float = 0
            for num in rank {
                singleScore += num * (self.dataAnswer[i])
                i+=1
            }
            score[index] = singleScore
            index+=1
        }
        print("final score are: \(score)", terminator: "")
        return score
    }
    
    
    
    
//animation
    
    func animateButton(index: Int, forward: Bool) {
        let frameWidth = self.view.frame.width
        let frameHeight = self.view.frame.height / 2
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIViewAnimationOptions.curveEaseOut], animations: { () -> Void in
            
//            self.headLabelLeadConst.constant += frameWidth
//            self.leftButtonButtomConst.constant = frameHeight
//            self.rightButtonButtomConst.constant = frameHeight
//            self.subTextLeadConst.constant -= frameWidth
            self.view.layoutIfNeeded()
            }) { (bool) -> Void in
                if forward {
                    self.swichText(index: index + 1)
                }else {
                    self.swichText(index: index - 1)
                }
                
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            
//            self.headLabelLeadConst.constant -= frameWidth
//            self.leftButtonButtomConst.constant += frameHeight
//            self.rightButtonButtomConst.constant += frameHeight
//            self.subTextLeadConst.constant += frameWidth
            
            self.view.layoutIfNeeded()
            }) { (bool) -> Void in
                
        }
        
    }
    
    
    func swichText(index: Int) {
        self.headLabel.text = self.headLabelText[index]
        self.subTextView.text = self.subTextText[index]
        self.leftLabel.text = self.leftLabelText[index]
        self.rightLabel.text = self.rightLabelText[index]
        self.rightButton.setTitle(self.rightButtonText[index], for: .normal)
        self.leftButton.setTitle(self.leftButtonText[index], for: .normal)
        if index == 0 {
            self.leftButton.isHidden = true
        }else {
            self.leftButton.isHidden = false
        }
    }
    
    
    
    
//button action
    @IBAction func rightButtonTouch(_ sender: UIButton) {
        print("press right button on page: \(self.headLabelText[self.questionIndex])")
        
        switch self.questionIndex {
        case 0 :
            //香氣
            self.dataAnswer[0] = self.sliderBar.value
            self.animateButton(index: 0, forward: true)
            self.questionIndex += 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
            
        case 1 :
            //回甘
            self.dataAnswer[1] = self.sliderBar.value
            self.animateButton(index: 1, forward: true)
            self.questionIndex += 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
            
        case 2 :
            //酸感
            self.dataAnswer[2] = self.sliderBar.value
            self.animateButton(index: 2, forward: true)
            self.questionIndex += 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
        case 3 :
            //香醇
            self.dataAnswer[3] = self.sliderBar.value
            self.animateButton(index: 3, forward: true)
            self.questionIndex += 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
            
        case 4 :
            //苦味 => 進入答案
            self.dataAnswer[4] = self.sliderBar.value
            self.result = self.calculateScore()
            //self.resultIndex = self.result.indexOf(self.result.maxElement()!)!
            
            print("max element: \(self.resultIndex)")
            print(self.dataAnswer)
            self.performSegue(withIdentifier: "ResultSegue", sender: self)
            return
            
        default :
            print("final")
            
        }
    }
    
    
    @IBAction func leftButtonTouch(_ sender: AnyObject) {
        print("press left button on page: \(self.headLabelText[self.questionIndex])")
        
        switch self.questionIndex {
        case 0 :
            return
            //香氣 => end
            //end
            
        case 1 :
            //回甘
            self.dataAnswer[1] = self.sliderBar.value
            self.animateButton(index: 1, forward: false)
            self.questionIndex -= 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
        case 2 :
            //酸感
            self.dataAnswer[2] = self.sliderBar.value
            self.animateButton(index: 2, forward: false)
            self.questionIndex -= 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
        case 3 :
            //香醇
            self.dataAnswer[3] = self.sliderBar.value
            self.animateButton(index: 3, forward: false)
            self.questionIndex -= 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
            
        case 4 :
            //苦味 => 回去
            self.dataAnswer[4] = self.sliderBar.value
            self.animateButton(index: 4, forward: false)
            self.questionIndex -= 1
            self.sliderBar.setValue(self.dataAnswer[self.questionIndex], animated: true)
            
        default :
            print("final")
            
        }
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultSegue" {
            if let VC = segue.destination as? ResultViewController {
                print("perform segue to result")
                VC.result = self.resultIndex
                
            }
        }
    }

}
