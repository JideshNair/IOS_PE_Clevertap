//
//  ViewController.m
//  notif10objc
//
//  Created by pwilkniss on 9/15/16.
//  Copyright © 2016 CleverTap. All rights reserved.
//

#import "ViewController.h"
#import <CleverTapSDK/CleverTap.h>
#import <CleverTapSDK/CleverTap+ProductConfig.h>

@interface ViewController ()<CleverTapProductConfigDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *stringValue = [[[[CleverTap sharedInstance] productConfig] get:@"key"] stringValue];

    BOOL boolValue = [[[[CleverTap sharedInstance] productConfig] get:@"key"] boolValue];

    NSNumber *numberValue = [[[[CleverTap sharedInstance] productConfig] get:@"key"] numberValue];

    id jsonValue = [[[[CleverTap sharedInstance] productConfig] get:@"key"] jsonValue];

    [CleverTap sharedInstance].productConfig.delegate = self;
}
- (void)ctProductConfigInitialized {
   
    NSLog(@"Product Config Initialized");
}
 
- (void)ctProductConfigFetched {
   
    NSLog(@"Product Config Fetched");
}
 
- (void)ctProductConfigActivated {
    
    NSLog(@"Product Config Activated");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
