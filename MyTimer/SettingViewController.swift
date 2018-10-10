//
//  SettingViewController.swift
//  MyTimer
//
//  Created by Kyohei Yamaguchi on 2018/09/27.
//  Copyright © 2018年 Kyohei Yamaguchi. All rights reserved.
//

import UIKit

//UIPickerViewに表示するデータをArrayで作成
let settingArray : [Int] = [10, 20, 30, 40, 50, 60]

//設定値を覚えるキー
let settingKey = "time_value"

class SettingViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    @IBAction func decisionButtonAction(_ sender: Any) {
    }
}
