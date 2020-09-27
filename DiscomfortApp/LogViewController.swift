//
//  LogViewController.swift
//  DiscomfortApp
//
//  Created by 米倉謙 on 2020/09/21.
//  Copyright © 2020 kenyonekura.com. All rights reserved.
//

import UIKit

class LogViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ViewControllerのユーザーデフォルトで保存した計算結果のnilチェック
        //        　nil以外だった場合はresultArray2に保存する
//        if UserDefaults.standard.object(forKey: "calc") != nil {
//
//            resultArray2 = UserDefaults.standard.object(forKey: "calc") as![String]
//            print(resultArray2)
//        }
//        if UserDefaults.standard.object(forKey: "date") != nil {
//
//            appendDate2 = UserDefaults.standard.object(forKey: "date") as![String]
//
//            print(appendDate2)
//        }
//        if UserDefaults.standard.object(forKey: "temp") != nil {
//
//            temperatureArray2 = UserDefaults.standard.object(forKey: "temp") as![String]
//
//            print(temperatureArray2)
//        }
//        if UserDefaults.standard.object(forKey: "humi") != nil {
//
//            HumidityArray2 = UserDefaults.standard.object(forKey: "humi") as![String]
//
//            print(HumidityArray2)
//        }
        logTableView.delegate = self
        logTableView.dataSource = self

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let indexPath = logTableView.indexPathForSelectedRow {
                 let nextView = segue.destination as! ReportViewController
//                destination.animal = animals[indexPath.row]
                nextView.ReportDateLabel = appendDate2[indexPath.row]
                nextView.ReportTempLabel = temperatureArray2[indexPath.row]
                nextView.ReportHumiLabel = HumidityArray2[indexPath.row]
                nextView.ReportIndexLabel = resultArray2[indexPath.row]
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if UserDefaults.standard.object(forKey: "calc") != nil {
            
            resultArray2 = UserDefaults.standard.object(forKey: "calc") as![String]
            print(resultArray2)
        }
        if UserDefaults.standard.object(forKey: "date") != nil {
            
            appendDate2 = UserDefaults.standard.object(forKey: "date") as![String]
            
            print(appendDate2)
        }
        if UserDefaults.standard.object(forKey: "temp") != nil {
            
            temperatureArray2 = UserDefaults.standard.object(forKey: "temp") as![String]
            
            print(temperatureArray2)
        }
        if UserDefaults.standard.object(forKey: "humi") != nil {
            
            HumidityArray2 = UserDefaults.standard.object(forKey: "humi") as![String]
            
            print(HumidityArray2)
        }
        
        logTableView.reloadData()
        print("viewWillAppear")
    }
    
    
    var resultArray2:[String] = []
    var appendDate2:[String] = []
    var temperatureArray2:[String] = []
    var HumidityArray2:[String] = []
    
    
   
    
    @IBOutlet var logTableView: UITableView!
    
    //    TableViewのCellの数を指定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //    計算結果を取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray2.count
        return appendDate2.count
        return temperatureArray2.count
        return HumidityArray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = logTableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        
        let appendDateLabel = cell.viewWithTag(1) as! UILabel
        appendDateLabel.text = appendDate2[indexPath.row]
        
        let resultArrayLabel = cell.viewWithTag(2) as! UILabel
        resultArrayLabel.text = resultArray2[indexPath.row]
        
        let temperatureArrayLabel = cell.viewWithTag(3) as! UILabel
        temperatureArrayLabel.text = temperatureArray2[indexPath.row]
        
        let HumidityArrayLabel = cell.viewWithTag(4) as! UILabel
        HumidityArrayLabel.text = HumidityArray2[indexPath.row]
        
        return cell
    }
    
    //    削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            resultArray2.remove(at: indexPath.row)
            appendDate2.remove(at: indexPath.row)
            temperatureArray2.remove(at: indexPath.row)
            HumidityArray2.remove(at: indexPath.row)
            
            UserDefaults.standard.set(resultArray2, forKey: "calc")
            UserDefaults.standard.set(appendDate2, forKey: "date")
            UserDefaults.standard.set(temperatureArray2, forKey: "temp")
            UserDefaults.standard.set(HumidityArray2, forKey: "humi")
            
            logTableView.reloadData()
        }
        
        
        
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
