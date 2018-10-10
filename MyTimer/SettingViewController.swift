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
        
        //timerSettingPickerのデリゲートとデータソースの通知先を指定
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        //UserDefaultの取得
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        //Pickerの選択を合わせる
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue{
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
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

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    @IBAction func decisionButtonAction(_ sender: Any) {
    }
}
