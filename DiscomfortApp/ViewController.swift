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
        calcResultLabel.text = String("")
        explanation.text = String("")
        
    }
    
    //    温度テキストフィールド
    @IBOutlet var temperatureLabel: UITextField!
    
    //    湿度テキストフィールド
    @IBOutlet var HumidityLabel: UITextField!
    
    //    計算ボタン
    @IBOutlet var CalcButton: UIButton!
    
    //    計算結果を表示させるLabel
    @IBOutlet var calcResultLabel: UILabel!
    
    //    計算結果と同じくイメージを表示するLabel
    @IBOutlet var ResultImage: UIImageView!
    
    //    説明Label
    @IBOutlet var explanation: UILabel!
    
    
    
    //    計算結果の初期値
    var calcresult:Double = 0
    
    var dispImageNum = 0
    
    func dispImage() {
        let imageArray = ["samui","ojiisan","uchiwa","atsui"]
        let name = imageArray[dispImageNum]
        let image = UIImage(named: name)
        ResultImage.image = image
    }
    
    var resultArray:[String] = []
    let date = Date()
    
    
    //    計算ボタンのアクション
    @IBAction func CalcButton(_ sender: Any) {
        //        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        if let temperature = Double(temperatureLabel.text!), let humidity = Double(HumidityLabel.text!){
            //        不快指数＝0.81×気温+0.01×湿度x(0.99×温度－14.3)+46.3
            calcresult = 0.81 * temperature + 0.01 * humidity * (0.99 * temperature - 14.3) + 46.3
//            print(calcresult)
        }
        
        
        switch calcresult {
        case 0..<55:
            calcResultLabel.text = String(calcresult)
            explanation.text = "寒い"
        case 55..<60:
            calcResultLabel.text = String(calcresult)
            explanation.text = "肌寒い"
        case 60..<65:
            calcResultLabel.text = String(calcresult)
            explanation.text = "何も感じない"
            dispImageNum = 1
        case 65..<70:
            calcResultLabel.text = String(calcresult)
            explanation.text = "快い"
            dispImageNum = 1
        case 70..<75:
            calcResultLabel.text = String(calcresult)
            explanation.text = "暑くない"
            dispImageNum = 1
        case 75..<80:
            calcResultLabel.text = String(calcresult)
            explanation.text = "やや暑い"
            dispImageNum = 2
        case 80..<85:
            calcResultLabel.text = String(calcresult)
            explanation.text = "暑くて汗がでる"
            dispImageNum = 2
        case 85..<100:
            calcResultLabel.text = String(calcresult)
            explanation.text = "暑くてたまらない"
            dispImageNum = 3
        default:
            calcResultLabel.text = "error"
        }
        
        dispImage()
        //        計算ボタンが押されたら､calcResultLabelの値を配列に追加する｡
        resultArray.append(calcResultLabel.text!)
        //        testOK!
        print(resultArray)
        //        ユーザーデフォルトに保存する(resultArrayだと画像を変更されない)
        UserDefaults.standard.set(resultArray, forKey: "calc")
        
    }
    
    
}

