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
        if UserDefaults.standard.object(forKey: "calc") != nil {

            resultArray2 = UserDefaults.standard.object(forKey: "calc") as![String]

            print(resultArray2)

        }
        
        logTableView.delegate = self
        logTableView.dataSource = self
        
    }
    
    var resultArray2:[String] = []
    
    
    @IBOutlet var logTableView: UITableView!
    
    //    TableViewのCellの数を指定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //    計算結果を取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray2.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = logTableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        
        cell.textLabel?.text = "\(resultArray2[indexPath.row])"
        
        print(resultArray2)
        
        return cell
    }
    
//    削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            resultArray2.remove(at: indexPath.row)
            
            UserDefaults.standard.set(resultArray2, forKey: "calc")
            
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
