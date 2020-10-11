//
//  KakudaiViewController.swift
//  SlideshowApp
//
//  Created by 松下恭平 on 2020/10/06.
//  Copyright © 2020 kyohei.matsushita. All rights reserved.
//

import UIKit

class KakudaiViewController: UIViewController {

    @IBOutlet weak var kakudaiimage: UIImageView!
   
    var x:UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        kakudaiimage.image = x
 
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
