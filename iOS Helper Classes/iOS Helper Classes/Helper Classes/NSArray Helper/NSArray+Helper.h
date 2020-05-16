//
//  NSArray+Helper.h
//  iOS Helper Classes
//
//  Created by Akshada on 6/2/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Helper)

- (NSArray*)sortedArrayByKey:(NSString*)key isDesc:(BOOL)desc;

- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSArray *)shuffled;

@end
