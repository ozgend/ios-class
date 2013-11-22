//
//  AppDelegate.m
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "AppDelegate.h"
#import "NoXibView.h"
#import "NSString+MyExtensionMethods.h"
#import "NSDate+FriendlyFormatter.h"

@implementation AppDelegate
@synthesize myJobInstance;

- (void)sendJobFinishMessage{
    NSLog(@"sendJobFinishMessage called from delegate");
    [NSString printTypeOfCaller:self];
    id value = [NSDate formatToFriendly:[[NSDate alloc] initWithTimeIntervalSinceNow:0]];
    NSLog(@"format friendly date %@",value);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.myJobInstance = [[MyJob alloc] initWithDelegate:self];
    [self.myJobInstance doSomething];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NoXibView *noXibView = [[NoXibView alloc] initWithFrame:self.window.frame];
    
    [noXibView addToWindow:self.window];
    
    [noXibView createUI];
    
    /*UIViewController *controller = [[UIViewController alloc] init];
    self.window.rootViewController = controller;
    controller.view = noXibView;
    */
    [self.window makeKeyAndVisible];
    return YES;
}



@end
