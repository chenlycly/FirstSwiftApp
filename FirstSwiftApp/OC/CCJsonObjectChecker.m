//
//  CCJsonObjectChecker.m
//  CCTools
//
//  Created by chen on 2017/4/18.
//  Copyright © 2017年 chenly. All rights reserved.
//

#import "CCJsonObjectChecker.h"
#import <UIKit/UIKit.h>

@implementation CCJsonObjectChecker
/*! @brief check jsonDictionary use keys in document and jsonObject from remote,only implement on viewDidLoad later
 *
 * @wordKys keys in document,for example @"aa,bb,cc,dd";
 *
 * @object jsonObject from remote
 *
 * @return result
 */
+(BOOL)checkJsonDictionary:(NSString*)wordKeys jsonObject:(NSDictionary*)object{
    
    return [CCJsonObjectChecker checkJsonDictionary:wordKeys jsonObject:object alertModel:2];
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
+(BOOL)checkJsonDictionary:(NSString*)wordKeys jsonObject:(NSDictionary*)object alertModel:(int)model{
    NSArray* keys = [wordKeys componentsSeparatedByString:@","];
    
    if (!keys || keys.count <= 0) {
        [CCJsonObjectChecker showAlertMessage:@"wordKys is invalid" alertModel:model];
        return NO;
    }
    
    if (!object || ![object isKindOfClass:[NSDictionary class]]) {
        [CCJsonObjectChecker showAlertMessage:@"jsonObject is invalid" alertModel:model];
        return NO;
    }
    
    if (keys.count != object.count) {
        [CCJsonObjectChecker showAlertMessage:@"wordKys or jsonObject of length is not invalid" alertModel:model];
        return NO;
    }
    
    NSString* errorKeys = @"";
    
    for (int i =0; i < keys.count; i++) {
        
        NSString* key = keys[i];
        NSString* value = [object valueForKey:key];
        
        if (!value || [value isKindOfClass:[NSNull class]] || value.length < 1  ) {
            errorKeys = [errorKeys stringByAppendingPathComponent:key];
        }
        
        
    }
    
    if (errorKeys.length > 1) {
        NSString* msg = [NSString stringWithFormat:@"keys: %@  is invalid",errorKeys];
        [CCJsonObjectChecker showAlertMessage:msg alertModel:2];
        return NO;
    }
    
    
    
    return YES;
}



+(int)jsonDictionaryKeysCount:(NSDictionary*)object
{
    return (int)object.allValues.count;
}

+(void)showAlertMessage:(NSString*)msg alertModel:(int)model
{
    if (model == 1) {
        
        NSLog(@"%@", msg);
        
    }else if(model == 2)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"error" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }
    
    
}

@end
