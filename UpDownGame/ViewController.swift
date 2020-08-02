//
//  ViewController.swift
//  UpDownGame
//
//  Created by 윤정섭 on 2020/07/31.
//  Copyright © 2020 Jungsub Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action)
                                        in self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 7"
        
        if randomValue == hitValue {
            showAlert(message: "정답!!!")
            reset()
            return
        }
        if tryCount >= 7 {
            showAlert(message: "틀렸어요. 정답은 \(randomValue) 입니다.")
            reset()
            return
        }
        if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
            //else if andomValue < hitValue 를 else로 변환
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender:UIButton){
        print("touch up reset button")
        reset()
    }
    func reset() {
        print("reset!!!")
        randomValue = Int.random(in: 0...1000)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 7"
        slider.minimumValue = 0
        slider.maximumValue = 1000
        slider.value = 500
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "1000"
        sliderValueLabel.text = "500"
    }

}

