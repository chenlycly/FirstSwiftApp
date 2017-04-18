//
//  PostViewController.swift
//  FirstSwiftApp
//
//  Created by chen on 2017/4/11.
//  Copyright © 2017年 chenly. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let path = "http://127.0.0.1/it.php"

        
        let param : Dictionary<String,String> = ["method":"getUserList","sex":"female"]
        
        postRequest(url: path, parameters: param, callBack: { (result) in
            print(result!)
            
        }) { (error) in

            if(error != nil){
                print("error:",error!)
            }
        }
        
        
    }

    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
