//
//  AppDelegate.m
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "AppDelegate.h"
#import "DataHelper.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(
                                                                           UIRemoteNotificationTypeAlert |
                                                                           UIRemoteNotificationTypeBadge |
                                                                           UIRemoteNotificationTypeSound )];
    
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    NSString* apnToken  =
    [[[deviceToken description]
      stringByReplacingOccurrencesOfString:@"<>" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"success = %@",apnToken);
    [DataHelper persistKey:@"KEY_APNTOKEN" withValue:apnToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"failed to register= %@", error);
}

@end
