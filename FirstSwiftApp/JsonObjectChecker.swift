//
//  JsonObjectChecker.swift
//  FirstSwiftApp
//
//  Created by chen on 2017/4/18.
//  Copyright © 2017年 chenly. All rights reserved.
//

import Foundation
import UIKit


/*! @brief check jsonDictionary use keys in document and jsonObject from remote,only implement on viewDidLoad later
 *
 * @wordKys keys in document,for example @"aa,bb,cc,dd";
 *
 * @object jsonObject from remote
 *
 * @model show model,1 = NSLog,2=UIAlert
 *
 * @return result
 */
public func checkJsonDictionary(wordKeys : String, jsonDic : Dictionary<String,String>) -> Bool{

    return checkJsonDictionary(wordKeys: wordKeys, jsonDic: jsonDic, model: 2);

}


/*! @brief check jsonDictionary use keys in document and jsonObject from remote,if alertModel =2 ,only implement on viewDidLoad later
 *
 * @wordKys keys in document,for example @"aa,bb,cc,dd";
 *
 * @object jsonObject from remote
 *
 * @model show model,1 = NSLog,2=UIAlert
 *
 * @return result
 */
public func checkJsonDictionary(wordKeys : String, jsonDic : Dictionary<String,String>, model : Int) -> Bool{

    let keys : Array<String> = wordKeys.components(separatedBy: ",")
    if (keys.count <= 0) {
        showMessage(msg: "wordKys is invalid", model: model)
        return false
    }
    
    if (jsonDic.count <= 0) {
        showMessage(msg: "jsonDic is invalid", model: model)
        return false
    }
    
    print(keys.count,jsonDic.count)
    
    if (keys.count != jsonDic.count) {
        showMessage(msg: "wordKys or jsonObject of length is not invalid", model: model)
        return false
    }
    
    
    var errorKeys : String = ""
    for (key,value) in jsonDic{
        
        if ( !keys.contains(key) || (value.characters.count <= 0) ) {
            errorKeys.append("\(key),")
        }
    
    }
    
    if errorKeys.characters.count > 0 {
        showMessage(msg: "\(errorKeys) is invalid", model: model)
        return false
    }
    
    
    return true;
}


/*! @brief show Message
 *
 * @msg message
 *
 * @model show model,1 = NSLog,2=UIAlert
 *
 * @return result
 */
func showMessage(msg : String,model : Int) -> Void{
    
    if(model == 1){
        print(msg);
    
    }else if(model == 2){
        let alert = UIAlertController(title: "object error", message: msg, preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: nil));
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
        
        
    }
    

    
}



