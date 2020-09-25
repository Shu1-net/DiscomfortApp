//
//  ReportViewController.swift
//  DiscomfortApp
//
//  Created by 米倉謙 on 2020/09/21.
//  Copyright © 2020 kenyonekura.com. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    
    @IBOutlet var reportDateLabel: UILabel!
    
    @IBOutlet var reportTempLabel: UILabel!
    
    @IBOutlet var reportHumiLabel: UILabel!
    
    @IBOutlet var reportIndexLabel: UILabel!
    
    @IBOutlet var logText: UITextField!
    
    @IBAction func logText(_ sender: Any) {
    }
    
    @IBAction func reportButton(_ sender: Any) {
    }
    
    var ReportDateLabel = ""
    var ReportTempLabel = ""
    var ReportHumiLabel = ""
    var ReportIndexLabel = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportTempLabel.text = ReportTempLabel
        reportDateLabel.text = ReportDateLabel
        reportHumiLabel.text = ReportHumiLabel
        reportIndexLabel.text = ReportIndexLabel
        
        // Do any additional setup after loading the view.
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
