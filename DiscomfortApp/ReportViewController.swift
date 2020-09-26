//
//  ReportViewController.swift
//  DiscomfortApp
//
//  Created by 米倉謙 on 2020/09/21.
//  Copyright © 2020 kenyonekura.com. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var reportDateLabel: UILabel!
    
    @IBOutlet var reportTempLabel: UILabel!
    
    @IBOutlet var reportHumiLabel: UILabel!
    
    @IBOutlet var reportIndexLabel: UILabel!
   
    @IBOutlet var logText: UITextField!
    
    @IBOutlet var logLabel: UILabel!
    
    @IBOutlet var addButton: UIButton!
    
    @IBAction func addButton(_ sender: Any) {
        
        if logText.text != ""{
            
            logLabel.text = String(logText.text!)
        }
        
//        logLabel.text = logText.text
//        print(logLabel.text as Any)
//      追加ボタン押下でキーボードを消す
        logText.endEditing(true)
    }
    
    //    テキストフィールドの外側タッチでキーボードを消す動作
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    var ReportDateLabel = ""
    var ReportTempLabel = ""
    var ReportHumiLabel = ""
    var ReportIndexLabel = ""

    

    override func viewDidLoad() {
        super.viewDidLoad()
        reportDateLabel.text = ReportDateLabel
        reportTempLabel.text = ("\(ReportTempLabel)℃")
        reportHumiLabel.text = ("\(ReportHumiLabel)%")
        reportIndexLabel.text = ReportIndexLabel
        logLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reportButton(_ sender: Any) {
       // 共有する項目
        let shareText = ReportDateLabel
        let shareText2 = ("温度：\(ReportTempLabel)℃")
        let shareText3 = ("湿度：\(ReportHumiLabel)%")
        let shareText4 = ("計算値：\(ReportIndexLabel)")
        let shareText5 = ("対応記録：\(logLabel.text!)")

        let activityItems = [shareText, shareText2, shareText3, shareText4, shareText5]

        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)


         // 使用しないアクティビティタイプ
         let excludedActivityTypes = [
         UIActivity.ActivityType.postToFacebook,
         UIActivity.ActivityType.postToTwitter,
         UIActivity.ActivityType.message,
         UIActivity.ActivityType.saveToCameraRoll,
         UIActivity.ActivityType.print
         ]

         activityVC.excludedActivityTypes = excludedActivityTypes

        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
