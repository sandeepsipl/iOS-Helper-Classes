//
//  NSDictionary+BVJSONString.h
//  iOS Helper Classes
//
//  Created by Akshada on 6/24/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BVJSONString)

-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint;

@end
