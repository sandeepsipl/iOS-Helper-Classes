//
//  NSString+Helper.h
//  iOS Helper Classes
//
//  Created by Sandeep Mahajan on 07/01/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Helpers)

- (NSString*)getMD5String;

- (NSUInteger)getWordCount;

- (NSString*)stringByUrlEncoding;

- (NSString*)base64Encoding;

- (NSString*)trim;

- (BOOL)startsWith:(NSString*)s;

- (BOOL)containsString:(NSString*)aString;

- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b;

- (BOOL)isNumeric;



@end
