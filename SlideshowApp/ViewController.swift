//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 松下恭平 on 2020/10/06.
//  Copyright © 2020 kyohei.matsushita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var images: UIImageView!
    
    func setImaeges() {
        images.image = pic[currentIndexNo]
    }
    
    let pic = [UIImage(named: "a.jpg"), UIImage(named: "b.jpg"), UIImage(named: "c.jpg")]
    
    var currentIndexNo: Int = 0
    
    var timer: Timer!
    
    var timer_sec: Int = 0
    
    @IBOutlet weak var saisei: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        saisei.setTitle("再生", for: .normal)
        
        setImaeges()
        
    }
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        currentIndexNo += 1
        if currentIndexNo > 2 {
            currentIndexNo = 0
            timer_sec = 0
        }
        setImaeges()
    }
    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            saisei.setTitle("停止" , for: .normal)
            nextbutton.isEnabled = false // ボタン無効
            backbutton.isEnabled = false // ボタン無効
        }else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            saisei.setTitle("再生" , for: .normal)
            nextbutton.isEnabled = true // ボタン有効
            backbutton.isEnabled = true // ボタン有効
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        currentIndexNo += 1
        
        if currentIndexNo > 2 {
            currentIndexNo = 0
        }
        setImaeges()
    }
    @IBAction func back(_ sender: Any) {
        
        currentIndexNo -= 1
        
        if currentIndexNo < 0 {
            currentIndexNo = 2
        }
        setImaeges()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のKakudaiViewControllerを取得する
        let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        // 遷移先のKakudaiViewControllerで宣言している  に値を代入して渡す
        kakudaiViewController.x = pic[currentIndexNo]
    }
    @IBAction func kakudai(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            saisei.setTitle("再生" , for: .normal)
            nextbutton.isEnabled = true // ボタン有効
            backbutton.isEnabled = true // ボタン有効
        }else if self.timer == nil {
        }
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
