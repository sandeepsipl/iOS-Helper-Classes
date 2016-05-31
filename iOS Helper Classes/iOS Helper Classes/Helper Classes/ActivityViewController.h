//
//  ActivityViewController.h
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityViewController : NSObject

+ (ActivityViewController *)sharedInstance;

- (void)startIndicator;
- (void)stopIndicator;
- (void)makeVisible;

@end
