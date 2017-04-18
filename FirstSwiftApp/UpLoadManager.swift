//
//  UpLoadManager.swift
//  FirstSwiftApp
//
//  Created by chen on 2017/4/13.
//  Copyright © 2017年 chenly. All rights reserved.
//

import UIKit


 func makePngImageForUpLoad(_ pngName:String) -> Data?{
    
    let boundary :String = "--"
    
    //head
    var headstr = boundary + "ccc\n"
    headstr += "Content-Disposition: form-data; name=\"file\"; filename=\"upimgfile.png\"\n"
    headstr += "Content-Type: image/png\n\n"
    
    //foot
    var footStr = boundary + "ccc"
    footStr += "Content-Disposition: form-data; name=\"submit\"\n\n"
    footStr += "Submit\n"
    footStr += boundary + "ccc--\n"
    
    //png
    let img = UIImage(named: pngName);
    guard let tempimg = img else {
        return nil
    }
    
    var data = headstr.data(using: .utf8)
    data?.append(UIImagePNGRepresentation(tempimg)!)
    data?.append(footStr.data(using: .utf8)!)
    
    return data
    
}

public func upLoadPng(url:String,pngName:String,callBack:@escaping (_ data:Any?)->()) {
    
    //pngData:Data
    //post
    var urlRequest:URLRequest = URLRequest(url: URL.init(string: url)!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 5)
    urlRequest.httpMethod = "POST"
    
    
    let pData : Data? = makePngImageForUpLoad(pngName)
    
    guard let pngData = pData else {
        print("image Data is not invalid")
        return
    }
    
    urlRequest.httpBody = pngData
    
    urlRequest.setValue("\(pngData.count)", forHTTPHeaderField: "Content-Length")
    urlRequest.setValue("multipart/form-data;boundary=ccc", forHTTPHeaderField: "Content-Type")
    
    
    
    
    
    let session:URLSession = URLSession.shared
    session.dataTask(with: urlRequest) { (data, resp, error) in
        
        do{
            
            let obj = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            
            
            callBack(obj)
            
            
        }catch{
            print(error)
        }
        
        
        }.resume()
    
    
}

class UpLoadManager: NSObject {

    
    
    

    
    /*  ///PHP code //////
     
     if ($_FILES["file"]["error"] > 0) {
     echo $_FILES["file"]["error"]; // 错误代码
     } else {
     $fillname = $_FILES['file']['name']; // 得到文件全名
     $dotArray = explode('.', $fillname); // 以.分割字符串，得到数组
     $type = end($dotArray); // 得到最后一个元素：文件后缀
     
     $nName = md5(uniqid(rand())).'.'.$type;
     $path = "files/".$nName; // 产生随机唯一的名字
     
     
     $result = move_uploaded_file( // 从临时目录复制到目标目录
     $_FILES["file"]["tmp_name"], // 存储在服务器的文件的临时副本的名称
     $path);
     
     
     if(result){
     echo json_encode(array('msg' => 'upload ok','fileName' => $nName));
     
     }else{
     echo json_encode(array('msg' => 'upload error','fileName' =>''));
     
     }
     exit(0);
     
     
     }
     
     
     
     
     */
}
