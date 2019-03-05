//
//  ViewController.swift
//  Async
//
//  Created by 永見彰宏 on 2019/03/05.
//  Copyright © 2019 永見彰宏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ActivityIndicator: UIActivityIndicatorView!
    var result:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ActivityIndicatorを作成＆中央に配置
        ActivityIndicator = UIActivityIndicatorView()
        ActivityIndicator.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        ActivityIndicator.center = self.view.center
        
        // クルクルをストップした時に非表示する
        ActivityIndicator.hidesWhenStopped = true
        // 色を設定
        ActivityIndicator.style = UIActivityIndicatorView.Style.gray
        //Viewに追加
        self.view.addSubview(ActivityIndicator)
        // クルクルスタート
        ActivityIndicator.startAnimating()
        
        
        
        
        DispatchQueue.global().async {
            // グローバルキューで実行される
            for i in 0..<5 {
                print(i)
                Thread.sleep(forTimeInterval: 1.0)
                if i == 4 {
                    self.result = i
                }
                
            }
            
            DispatchQueue.main.async {
                // メインキューで実行される
                // クルクルストップ
                self.ActivityIndicator.stopAnimating()
                let label = UILabel()
                label.frame = CGRect(x:150, y:200, width:160, height:30)
                label.text = "結果は" + String(self.result)
                self.view.addSubview(label)
            }
        }
    }
    
  
    



}

