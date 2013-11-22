//
//  AppDelegate.h
//  testptc
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobClassWithProtocol.h"
#import "NSString+CustomExtensions.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, JobMessageDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) JobClassWithProtocol *jobInstance;


@end
