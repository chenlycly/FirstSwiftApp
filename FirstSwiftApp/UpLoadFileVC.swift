//
//  UpLoadFileVC.swift
//  FirstSwiftApp
//
//  Created by chen on 2017/4/12.
//  Copyright © 2017年 chenly. All rights reserved.
//

import UIKit

class UpLoadFileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        upLoadPng(url: "http://127.0.0.1/UpLoadFile.php", pngName: "upimgfile.png") { (result) in
            print(result!)
        };
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
