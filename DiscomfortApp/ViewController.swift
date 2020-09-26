//
//  ViewController.swift
//  DiscomfortApp
//
//  Created by 米倉謙 on 2020/09/21.
//  Copyright © 2020 kenyonekura.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calcResultLabel.text = String("")
        explanation.text = String("")
//        テキストデータの情報を得るためのデリゲード
        temperatureLabel.delegate = self
        HumidityLabel.delegate = self
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
//    image用変数
    var dispImageNum = 0
    
    func dispImage() {
        let imageArray = ["samui","ojiisan","uchiwa","atsui","error"]
        let name = imageArray[dispImageNum]
        let image = UIImage(named: name)
        ResultImage.image = image
    }
    
//    計算結果を配列へ格納
    var resultArray:[String] = []
//    dateを配列へ格納
    var appendDate:[String] = []
//    温度を配列へ格納
    var temperatureArray:[String] = []
//    湿度を配列へ格納
    var HumidityArray:[String] = []
    
    
    /// DateFomatterクラスのインスタンス生成
    let dateFormatter = DateFormatter()
    
    //    テキストフィールドの外側タッチでキーボードを消す動作
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
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
            calcResultLabel.textColor = UIColor.blue
            explanation.text = "寒いので室温をあげてください"
        case 55..<60:
            calcResultLabel.text = String(calcresult)
            calcResultLabel.textColor = UIColor.blue
            explanation.text = "肌寒いのやや室温をあげてください"
        case 60..<65:
            calcResultLabel.text = String(calcresult)
            calcResultLabel.textColor = UIColor.black
            explanation.text = "快適な室温です､問題ありません"
            dispImageNum = 1
        case 65..<70:
            calcResultLabel.text = String(calcresult)
            calcResultLabel.textColor = UIColor.black
            explanation.text = "快適な室温です､問題ありません"
            dispImageNum = 1
        case 70..<75:
            calcResultLabel.text = String(calcresult)
            calcResultLabel.textColor = UIColor.orange
            explanation.text = "指数が少し高いですが､問題ない範囲です"
            dispImageNum = 1
        case 75..<80:
            calcResultLabel.text = String(calcresult)
            calcResultLabel.textColor = UIColor.orange
            explanation.text = "少し暑いので室温をやや下げてください"
            dispImageNum = 2
        case 80..<85:
            calcResultLabel.text = String(calcresult)
            calcResultLabel.textColor = UIColor.red
            explanation.text = "暑くるしい状態です｡室温を下げてください"
            dispImageNum = 2
        case 85..<100:
            calcResultLabel.text = String(calcresult)
            calcResultLabel.textColor = UIColor.red
            explanation.text = "直ちに室温を下げてください"
            dispImageNum = 3
        default:
            calcResultLabel.text = "100を超過しています"
            calcResultLabel.textColor = UIColor.black
            explanation.text = "再計算してください"
            dispImageNum = 4
        }
        dispImage()
        //        計算ボタンが押されたら､calcResultLabelの値を配列に追加する｡
        resultArray.append(calcResultLabel.text!)
        //        testOK!
//        print(resultArray)
        //        ユーザーデフォルトに保存する(resultArrayだと画像を変更されない)
        UserDefaults.standard.set(resultArray, forKey: "calc")
        /// カレンダー、ロケール、タイムゾーンの設定（未指定時は端末の設定が採用される）
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        /// 変換フォーマット定義（未設定の場合は自動フォーマットが採用される）
        dateFormatter.dateFormat = "yyyy年M月d日(EEEEE) H時m分"
        /// データ変換（Date→テキスト）
        let dateString = dateFormatter.string(from: Date())
        
        appendDate.append(dateString)
//        チェックOK!
//        print(appendDate)
        // ユーザーデフォルトに保存する(resultArrayだと画像を変更されない)
        UserDefaults.standard.set(appendDate, forKey: "date")
        
//        配列へ温度データを格納
        temperatureArray.append(temperatureLabel.text!)
//        温度入力値を保存
        UserDefaults.standard.set(temperatureArray, forKey: "temp")
//        配列へ湿度データを格納
        HumidityArray.append(HumidityLabel.text!)
//        湿度入力値を保存
        UserDefaults.standard.set(HumidityArray, forKey: "humi")
        
//        計算ボタン押下でキーボードを消す
        temperatureLabel.endEditing(true)
        HumidityLabel.endEditing(true)
        
        
    }
}

