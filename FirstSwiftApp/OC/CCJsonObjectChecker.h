//
//  CCJsonObjectChecker.h
//  CCTools
//
//  Created by chen on 2017/4/18.
//  Copyright © 2017年 chenly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCJsonObjectChecker : NSObject


/*! @brief check jsonDictionary use keys in document and jsonObject from remote,only implement on viewDidLoad later
 *
 * @wordKys keys in document,for example @"aa,bb,cc,dd";
 *
 * @object jsonObject from remote
 *
 * @return result
 */
+(BOOL)checkJsonDictionary:(NSString*)wordKeys jsonObject:(NSDictionary*)object;



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
+(BOOL)checkJsonDictionary:(NSString*)wordKeys jsonObject:(NSDictionary*)object alertModel:(int)model;
@end
