//
//  AppDelegate.h
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyJob.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,MyJobDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyJob *myJobInstance;

@end
