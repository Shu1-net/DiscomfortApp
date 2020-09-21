//
//  ViewController.swift
//  DiscomfortApp
//
//  Created by 米倉謙 on 2020/09/21.
//  Copyright © 2020 kenyonekura.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calcResultLabel.text = String("0")
    }
    
//    温度テキストフィールド
    @IBOutlet var temperatureLabel: UITextField!
    
//    湿度テキストフィールド
    @IBOutlet var HumidityLabel: UITextField!
    
//    計算ボタン
    @IBOutlet var CalcButton: UIButton!
    
    @IBOutlet var calcResultLabel: UILabel!
    
//    計算結果の初期値
    var calcresult:Double = 0

//    計算ボタンのアクション
    @IBAction func CalcButton(_ sender: Any) {
        if let temperature = Double(temperatureLabel.text!), let humidity = Double(HumidityLabel.text!){
                   //        不快指数＝0.81×気温+0.01×湿度x(0.99×温度－14.3)+46.3
                   calcresult = 0.81 * temperature + 0.01 * humidity * (0.99 * temperature - 14.3) + 46.3
                   print(calcresult)
               }
        
        }
        
    
        
    }

