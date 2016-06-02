//
//  NSDate+Helper.m
//  iOS Helper Classes
//
//  Created by Akshada on 6/2/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

+(NSDate *)dateFromString:(NSString*)date format:(NSString*)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    if (dateFromString) {
        return dateFromString;
    }
    return nil;
}

@end
