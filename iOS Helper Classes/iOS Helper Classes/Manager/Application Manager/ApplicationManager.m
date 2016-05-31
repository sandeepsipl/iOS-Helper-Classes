//
//  ApplicationManager.m
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "ApplicationManager.h"

@implementation ApplicationManager

@synthesize userData;

+ (ApplicationManager *)getInstance {
    static dispatch_once_t once;
    static ApplicationManager *sharedInstance;
    dispatch_once(&once, ^ { sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        //Allocate all variables
        userData=[[NSMutableDictionary alloc]initWithCapacity:0];
        
    }
    return self;
}

- (void)showAlertForVC:(id)vc withTitle:(NSString*)title andMessage:(NSString*)message
{
    // Show Alert with title and message only
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)logout {
    // Delete logged-in user objects
    
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:@{@"": @""} forName:[NSBundle mainBundle].bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"UserData"];
    alreadyRun = @"already-run";
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:alreadyRun];
    //    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self cleanAll];
    
}
-(void)cleanAll
{
    [userData removeAllObjects];
    userData=nil;
}


- (BOOL)rootCheck {
#if TARGET_IPHONE_SIMULATOR
    return NO;
#endif
    /* Check if device is Jailbroken */
    NSArray *jailbrokenPath = [NSArray arrayWithObjects:
                               @"/Applications/Cydia.app",
                               @"/Applications/RockApp.app",
                               @"/Applications/Icy.app",
                               @"/usr/sbin/sshd",
                               @"/usr/bin/sshd",
                               @"/usr/libexec/sftp-server",
                               @"/Applications/WinterBoard.app",
                               @"/Applications/SBSettings.app",
                               @"/Applications/MxTube.app",
                               @"/Applications/IntelliScreen.app",
                               @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
                               @"/Applications/FakeCarrier.app",
                               @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
                               @"/private/var/lib/apt",
                               @"/Applications/blackra1n.app",
                               @"/private/var/stash",
                               @"/private/var/mobile/Library/SBSettings/Themes",
                               @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
                               @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                               @"/private/var/tmp/cydia.log",
                               @"/private/var/lib/cydia", nil];
    
    BOOL rooted = NO;
    for(NSString *string in jailbrokenPath)
        if ([[NSFileManager defaultManager] fileExistsAtPath:string]) {
            rooted=YES;
            break;
        }
    return rooted;
}

@end
