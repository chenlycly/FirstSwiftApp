//
//  CSRequest.swift
//  FirstSwiftApp
//
//  Created by chen on 2017/4/14.
//  Copyright © 2017年 chenly. All rights reserved.
//

import UIKit


public func postRequest(url:String,parameters:Dictionary<String,String>, callBack:@escaping(_ result:Any?)->(),errorHandle:@escaping (_ error:Error?)->()) ->Void{
    
    var request:URLRequest = URLRequest(url: URL.init(string: url)!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 30)
    let session:URLSession = URLSession.shared
    request.httpMethod = "POST"
    
    var bodyStr:String=""
    for (key,value) in parameters{
        bodyStr += "\(key)=\(value)&"
    }
    
    let index = bodyStr.index(bodyStr.endIndex, offsetBy: -1)
    
    let body = bodyStr.substring(to: index)
    
    request.httpBody = body.data(using: .utf8)
    session.dataTask(with: request) { (data, resp, error) in
        
        if let err = error{
            errorHandle(err)
        }else
        {
            do{
                let obj = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                callBack(obj)
                
            }catch{
                errorHandle(error)
            }
        }
        }.resume()
}


public func getRequest(url:String,callBack:@escaping (_ result:Any?)->(),errorHandle:@escaping (_ backError:Error)->()){
    
    
    let session = URLSession.shared
    session.dataTask(with: URL.init(string: url)!) { (data , response, error) in
        
        if let e = error{
            errorHandle(e)
        }else{
            
            do{
                let obj = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                callBack(obj)
                
            }catch{
                errorHandle(error)
            }
            
        }
        
        }.resume()
}

//PHP Code - Get
/*
 <?php
 /**
 * 比较标准的接口输出函数
 * @param string  $info 消息
 * @param integer $code 接口错误码，很关键的参数
 * @param array   $data 附加数据
 * $param string  $location 重定向
 * @return array
 */
 function var_json($info = '', $code = 10000, $data = array(), $location = '') {
 $out['code'] = $code ?: 0;
 $out['info'] = $info ?: ($out['code'] ? 'error' : 'success');
 $out['data'] = $data ?: array();
 $out['location'] = $location;
 header('Content-Type: application/json; charset=utf-8');
 echo json_encode($out, JSON_HEX_TAG);
 exit(0);
 }
 
 $a = empty($_GET['a']) ? '' : $_GET['a'];
 $qq = empty($_GET['qq']) ? 0 : intval($_GET['qq']);
 
 //假设这是数据源，如MySQL
 $data = array();
 $data[979136] = array('qq'=>979136, 'vip'=>5,'level'=>128, 'reg_time'=>1376523234, 'qb'=>300);
 $data[979137] = array('qq'=>979137, 'vip'=>8,'level'=>101, 'reg_time'=>1377123144, 'qb'=>300);
 
 $obj['key'] = 'haha';
 $data[100] = $obj;
 
 preg_match('/^[a-zA-Z]+$/', $a) || var_json('非法调用');
 isset($data[$qq]) || var_json('用户不存在', 100001);
 
 switch ($a) {
 //获取用户基本信息
 case 'info':
 //你的更多业务逻辑 ...
 var_json('success', 0, $data[$qq]);
 break;
 //获取动态消息
 case 'message':
 var_json('您正在调用动态消息接口', 0);
 break;
 //获取好友列表
 case 'friends':
 var_json('你正在调用好友列表接口', 0);
 break;
 default:
 var_json('非法调用');
 }
 
 ?>
 
 
 
 */

//PHP Code - POST

/*
 <?php
 
 function getUserInfo($sex)
 {
 $user1 = array('uid'=>'111','name'=>'user1','sex'=>'female');
 $user2 = array('uid'=>'222','name'=>'user2','sex'=>'female');
 $user4 = array('uid'=>'444','name'=>'user4','sex'=>'male');
 $user5 = array('uid'=>'555','name'=>'user5','sex'=>'male');
 $data;
 
 if($sex == 'female'){
 $data = array($user1,$user2);
 }else{
 $data = array($user4,$user5);
 }
 outPutFunc("success",0,$data);
 }
 
 function returnError($msg,$code){
 $out['code'] = $code;
 $out['msg'] = $msg;
 $out[data] = array();
 echo json_encode($out);
 exit(0);
 }
 
 function outPutFunc($msg,$code,$data)
 {
 $out['code'] = $code;
 $out['msg'] = $msg;
 $out['data'] =$data;
 echo json_encode($out);
 exit(0);
 }
 
 //=============
 
 $method = $_POST['method'];
 
 
 
 switch ($method){
 case NULL:
 returnError('method not found','401');
 break;
 
 case 'getUserList':
 {
 $sex = $_POST['sex'];
 
 if($sex == NULL){
 returnError('par sex NULL','400');
 }else{
 getUserInfo($sex);
 }
 
 }
 break;
 
 default:
 returnError('parm not found','400');
 break;
 };
 
 ?>
 
 */
