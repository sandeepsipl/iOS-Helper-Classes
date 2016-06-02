//
//  NSArray+Helper.m
//  iOS Helper Classes
//
//  Created by Akshada on 6/2/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)

-(NSArray*)sortedArrayByKey:(NSString*)key isDesc:(BOOL)desc{
    
    if ([self count]>0) {
        
        if ([[self objectAtIndex:0] isKindOfClass:[NSString class]]) {
            NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:(!desc) selector:@selector(localizedCaseInsensitiveCompare:)];
            return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
            
//            return [self sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        }
        else if ([[self objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:key  ascending:(!desc) selector:@selector(localizedCaseInsensitiveCompare:)];
            return [self sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
            
        }
    }
    
    return self;
}

@end
