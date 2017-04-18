//
//  ViewController.swift
//  FirstSwiftApp
//
//  Created by chen on 2017/2/28.
//  Copyright © 2017年 chenly. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    let name = "aaaaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //get
        
//        let path = "http://127.0.0.1/ir.php?a=info&qq=100&ticket=test"
//        getRequest(url: path, callBack: {[weak self] (result) in
//            print(self!.name,result!)
//        }) { (error) in
//            print(error)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let dic : Dictionary<String,String> = ["11":"aa","22":"bb","33":"cc","44":"dd"];
        let keys : String = "11,22,33,44"
        
        
        
        let result = checkJsonDictionary(wordKeys: keys, jsonDic: dic, model: 2)
        
        if result {
            print("true")
        }
        
    }
    
    
    
}















