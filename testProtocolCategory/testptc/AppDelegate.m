//
//  AppDelegate.m
//  testptc
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize jobInstance;

- (void)sendJobDoneMessageFromCaller:(id)caller{
    //#1
    NSLog(@"caller = %@",[caller description]);
    
    //#2
    [NSString printTypeOfCaller:caller];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    jobInstance = [[JobClassWithProtocol alloc] initWithDelegate:self];
    [jobInstance doSomething];
    
    return YES;
}



@end
