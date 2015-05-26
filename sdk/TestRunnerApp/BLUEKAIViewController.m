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
    
    blueKaiSDK = [[BlueKai alloc] initWithSiteId:@"19198"
                                  withAppVersion:@"1.0"
                                        withIdfa:@"ASHDJHJ-1231241-ASDASD"
                                        withView:self
                                     withDevMode:YES];
    
//    blueKaiSDK = [[BlueKai alloc] initDirectAutoIdfaEnabledWithSiteId:@"19198" withAppVersion:@"1.0" withDevMode:YES];
    
    blueKaiSDK.useHttps = NO;
    
    #if !__has_feature(objc_arc)
    [blueKaiSDK retain];
    #endif
    
    //[blueKaiSDK setUseHttps:NO];
    
    blueKaiSDK.delegate = (id) self;
    
    [blueKaiSDK setOptInPreference:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appCameToForeground) name:UIApplicationWillEnterForegroundNotification object:nil];

}
- (IBAction)test:(id)sender {
    
    [blueKaiSDK updateWithDictionary:@{@"IAB2":@"1", @"IAB22_gc_pgc":@"1"}];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
