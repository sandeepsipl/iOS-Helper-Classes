//
//  ViewController.m
//  iOS Helper Classes
//
//  Created by Sandeep Mahajan on 07/01/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                           @"1",@"id",
                           @"akshada",@"name",
                           @"sapre",@"lastname", nil];
    
    NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                           @"2",@"id",
                           @"diksha",@"name",
                           @"jhanginia",@"lastname", nil];
    
    NSMutableDictionary *dict3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                           @"3",@"id",
                           @"pranav",@"name",
                           @"khandelwal",@"lastname", nil];
    
    NSMutableDictionary *dict4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                           @"4",@"id",
                           @"aman",@"name",
                           @"gupta",@"lastname", nil];
    
    NSMutableDictionary *dict5 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                           @"5",@"id",
                           @"arpit",@"name",
                           @"jaiswal",@"lastname", nil];
    
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"2", @"4", @"5", @"1", @"9", @"2", nil];
    NSLog(@"%@",[array1 sortedArrayByKey:@"1" isDesc:YES]);
    
    NSArray *array2 = [[NSArray alloc] initWithObjects:dict1,dict2,dict3,dict4,dict5, nil];
    NSLog(@"%@",[array2 sortedArrayByKey:@"name" isDesc:YES]);
    
//    NSLog(@"%@",[NSDate dateFromString:@"20-12-2016" format:@"MM-dd-YYYY"]);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
