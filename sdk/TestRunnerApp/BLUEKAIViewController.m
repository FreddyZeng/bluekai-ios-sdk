//
//  BLUEKAIViewController.m
//  TestRunnerApp
//
//  Created by Shun Chu on 5/20/14.
//  Copyright (c) 2014 BlueKai. All rights reserved.
//

#import "BLUEKAIViewController.h"
#import "Bluekai.h"

@interface BLUEKAIViewController ()

@end

@implementation BLUEKAIViewController
BlueKai      *blueKaiSDK;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    blueKaiSDK = [[BlueKai alloc] initWithSiteId:@"2"
//                                  withAppVersion:@"1.0"
//                                        withIdfa:@"TEST123"
//                                        withView:self
//                                     withDevMode:YES];
    
    blueKaiSDK = [[BlueKai alloc] initDirectAutoIdfaEnabledWithSiteId:@"2" withAppVersion:@"1.0" withDevMode:YES];
    
    [blueKaiSDK setUseHttps:YES];
    
    blueKaiSDK.delegate = (id) self;
    
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"settings"];

  
}
- (IBAction)test:(id)sender {
    
    [blueKaiSDK updateWithDictionary:@{@"key1":@"value1"}];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
