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
    
//    blueKaiSDK = [[BlueKai alloc] initWithSiteId:@"19198" withAppVersion:@"1.0" withIdfa:@"ASHDJHJ-1231241-ASDASD" withView:self withDevMode:YES];
    
    blueKaiSDK = [[BlueKai alloc] initAutoIdfaEnabledWithSiteId:@"18517" withAppVersion:@"1.0" withView:self withDevMode:NO];
                  
//    blueKaiSDK = [[BlueKai alloc] initDirectAutoIdfaEnabledWithSiteId:@"18517" withAppVersion:@"1.0" withDevMode:NO];
    
    blueKaiSDK.useHttps = YES;
        
    #if !__has_feature(objc_arc)
    [blueKaiSDK retain];
    #endif
    
    //[blueKaiSDK setUseHttps:NO];
    
    blueKaiSDK.delegate = (id) self;
    
    [blueKaiSDK setOptInPreference:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appCameToForeground) name:UIApplicationWillEnterForegroundNotification object:nil];

}
- (IBAction)test:(id)sender {
    [blueKaiSDK updateWithDictionary:@{@"IAB1":[NSString stringWithFormat:@"%d", arc4random_uniform(1000)]}];
}

- (void)appCameToForeground
{
    [blueKaiSDK resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onDataPosted:(BOOL)status
{

}

@end
