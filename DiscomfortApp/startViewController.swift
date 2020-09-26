//
//  startViewController.swift
//  DiscomfortApp
//
//  Created by 米倉謙 on 2020/09/26.
//  Copyright © 2020 kenyonekura.com. All rights reserved.
//

import UIKit

class startViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        // ②遷移先NavigationControllerのインスタンス取得
           //   Navigation ControllerのStoryboard IDが"NC1"に設定されている例
           //   インスタンスのクラスはUINavigationController
        let nextView = storyboard?.instantiateViewController(withIdentifier: "Calc") as! UITabBarController
        
           // ③画面遷移（presentメソッドを使う）
           self.present(nextView, animated: true, completion: nil)
        
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
