//
//  ActivityViewController.m
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@property(strong, nonatomic) UIActivityIndicatorView *activityView;
@property(retain) AppDelegate *delegate;
@property(strong, nonatomic) UIView *view;

@end

@implementation ActivityViewController

static ActivityViewController *sharedInstance = nil;

+(ActivityViewController *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

- (id)init {
    if ( (self = [super init]) ) {
        // your custom initialization
    }
    return self;
}

-(void)startIndicator
{
    [self makeVisible];
    [self.activityView startAnimating];
}

-(void)stopIndicator
{
    [self.activityView stopAnimating];
    [self.view removeFromSuperview];
    
}

-(void)makeVisible {
    self.delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityView.center = self.view.center;
    [self.view addSubview:self.activityView];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.alpha = 0.7;
    [self.delegate.window addSubview:self.view];
}

@end
