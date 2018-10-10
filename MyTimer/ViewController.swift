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
        if let nowTimer = timer{
            if nowTimer.isValid == true{
                nowTimer.invalidate()
            }
        }
        //画面遷移を行う
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        //カウントダウンを開始
        if let nowTimer = timer{
            //もしタイマーが実行中だったらスタートしない
            if nowTimer.isValid == true{
                return
            }
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        //タイマーを停止
        if let nowTimer = timer{
            //もしタイマーが実行中だったら停止
            if nowTimer.isValid == true{
                //タイマー停止
                nowTimer.invalidate()
            }
        }
    }
    
    //画面の更新をする(戻り値:remainCount:残り時間)
    func displayUpdate() -> Int{
        //UserDefaultsのインスタンスを作成
        let settings = UserDefaults.standard
        //取得した秒数をtimerValueに渡す
        let timerValue = settings.integer(forKey: settingKey)
        //残り時間(remainCount)を生成
        let remainCount = timerValue - count
        //残り時間をラベルに表示
        countDownLabel.text = "残り\(remainCount)秒"
        //戻り時間を戻り値に設定
        return remainCount
    }
    
    //経過時間の処理
    @objc func timerInterrupt(_ timer:Timer){
        //経過時間に+1していく
        count += 1
        //残り時間が0以下の時、タイマーを止める
        if displayUpdate() <= 0{
            //初期化処理
            count = 0
            //タイマー停止
            timer.invalidate()
            
            //ダイアログを作成
            //ポップアップダイアログ
            //let alertController = UIAlertController(title: "終了", message: "タイマー終了時間です", preferredStyle: .alert)
            //下からスライドして表示されるダイアログ
            let alertController = UIAlertController(title: "終了", message: "タイマー終了時間です", preferredStyle: .actionSheet)
            //ダイアログに表示されるOKボタンを作成
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            //アクションを追加
            alertController.addAction(defaultAction)
            //ダイアログの表示
            present(alertController, animated: true, completion: nil)
        }
    }
    
    //画面切り替えのタイミングで処理を行う
    override func viewDidAppear(_ animated: Bool){
        count = 0
        //タイマー表示を更新する
        _ = displayUpdate()
    }
}

