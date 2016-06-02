//
//  NSMutableDictionary+Helper.h
//  iOS Helper Classes
//
//  Created by Akshada on 6/2/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Helper)

-(void)setObjectIfNotNil:(id)object ForKey:(NSString*)aKey;
-(id) getObjectForKey:(NSString *)aKey;
-(NSString*)stringFromKey:(NSString*)key;
-(NSNumber*)intFromKey:(NSString*)key;
-(NSNumber*)doubleFromKey:(NSString*)key;
-(BOOL)boolForKey:(NSString *)key;
-(void)setFloat:(float)value forKey:(NSString *)key;
-(void)setDouble:(double)value forKey:(NSString *)key;
-(void)setBool:(BOOL)value forKey:(NSString *)key;
-(void)setInt:(int)value forKey:(NSString *)key;

@end
