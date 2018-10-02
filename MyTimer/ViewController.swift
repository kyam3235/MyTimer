//
//  ViewController.swift
//  MyTimer
//
//  Created by Kyohei Yamaguchi on 2018/09/27.
//  Copyright © 2018年 Kyohei Yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //タイマーの変数を作成
    var timer : Timer?
    //カウント(経過時間)の変数を作成
    var count = 0
    //設定値を扱うキーを設定
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UserDefaultsのインスタンスを作成
        let settings = UserDefaults.standard
        //UserDefaultsに初期値を登録
        settings.register(defaults: [settingKey:10])
    }


    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func settingButtonAction(_ sender: Any) {
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
    }
}

