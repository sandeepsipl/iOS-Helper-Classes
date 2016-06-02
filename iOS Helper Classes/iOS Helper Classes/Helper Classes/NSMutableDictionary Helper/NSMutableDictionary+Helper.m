//
//  NSMutableDictionary+Helper.m
//  iOS Helper Classes
//
//  Created by Akshada on 6/2/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "NSMutableDictionary+Helper.h"

@implementation NSMutableDictionary (Helper)

-(void)setObjectIfNotNil:(id)object ForKey:(NSString*)key {
    if (object!=nil) {
        [self setObject:object forKey:key];
    }
}

- (id) getObjectForKey:(NSString *)key {
    NSArray *array_allKeys = [self allKeys];
    if ([array_allKeys containsObject: key])
    {
        // Having key in dictionary
        return [self objectForKey:key];
    }
    return nil;
}

- (NSString*)stringFromKey:(NSString*)key {
    return [NSString stringWithFormat:@"%@",[self objectForKey:key]];
}

-(NSNumber*)intFromKey:(NSString*)key {
    return [NSNumber numberWithInt:[[self objectForKey:key] intValue]];
}

-(NSNumber*)doubleFromKey:(NSString*)key{
    return [NSNumber numberWithDouble:[[self objectForKey:key] doubleValue]];
}

-(BOOL)boolForKey:(NSString *)key {
    return [[self objectForKey:key] boolValue];
}

-(void)setFloat:(float)value forKey:(NSString *)key {
    NSNumber *floatNumber = [NSNumber numberWithFloat:value];
    [self setObject:[floatNumber stringValue] forKey:key];
}

-(void)setDouble:(double)value forKey:(NSString *)key {
    NSNumber *doubleNumber = [NSNumber numberWithDouble:value];
    [self setObject:[doubleNumber stringValue] forKey:key];
}

-(void)setBool:(BOOL)value forKey:(NSString *)key {
    NSNumber *boolNumber = [NSNumber numberWithBool:value];
    [self setObject:[boolNumber stringValue] forKey:key];
}

-(void)setInt:(int)value forKey:(NSString *)key {
    NSNumber *intNumber = [NSNumber numberWithInt:value];
    [self setObject:[intNumber stringValue] forKey:key];
}

@end
