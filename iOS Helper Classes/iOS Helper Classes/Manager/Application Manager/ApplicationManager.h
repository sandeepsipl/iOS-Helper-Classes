//
//  ApplicationManager.h
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationManager : NSObject
{
    NSMutableDictionary *userData;
    BOOL islogin;
    NSString *alreadyRun;
}

@property(nonatomic,strong)NSMutableDictionary *userData;
@property (nonatomic, readwrite) NSUInteger productId;

+ (ApplicationManager*)getInstance;

//- (void)showAlertForVC:(id)vc withTitle:(NSString*)title andMessage:(NSString*)message;
- (void)logout;
- (BOOL)rootCheck;

@end
