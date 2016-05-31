//
//  NSString+Helper.m
//  iOS Helper Classes
//
//  Created by Sandeep Mahajan on 07/01/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "NSString+Helper.h"
#import "NSData+Base64.h"

@implementation NSString (Helpers)

- (NSString*)getMD5String {
    unsigned char resultStr[CC_MD5_DIGEST_LENGTH];
    const char *cStr = [self UTF8String];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), resultStr);
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            resultStr[0], resultStr[1], resultStr[2], resultStr[3], resultStr[4], resultStr[5], resultStr[6], resultStr[7],
            resultStr[8], resultStr[9], resultStr[10], resultStr[11], resultStr[12], resultStr[13], resultStr[14], resultStr[15]
            ];
}

- (NSUInteger)getWordCount {
    //Taken From: http://stackoverflow.com/a/13367063
    __block NSUInteger wordCount = 0;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByWords | NSStringEnumerationLocalized
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                              wordCount++;
                          }];
    return wordCount;
}

- (NSString*)stringByUrlEncoding {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)CFBridgingRetain(self), NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    //return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString*)base64Encoding {
    NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedString = [stringData base64EncodedString];
    
    return encodedString;
}

- (NSString*)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)startsWith:(NSString*)s {
    if([self length] < [s length]) return NO;
    return [s isEqualToString:[self substringFrom:0 to:[s length]]];
}

- (BOOL)containsString:(NSString*)aString {
    NSRange range = [[self lowercaseString] rangeOfString:[aString lowercaseString]];
    return range.location != NSNotFound;
}

- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b {
    NSRange r;
    r.location = a;
    r.length = b - a;
    return [self substringWithRange:r];
}

- (BOOL)isNumeric {
    const char *s = [self UTF8String];
    for (size_t i=0;i<strlen(s);i++) {
        if (s[i]<'0' || s[i]>'9') {
            return NO;
        }
    }
    return YES;
}


@end
