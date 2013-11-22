//
//  NSString+MyExtensionMethods.m
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "NSString+MyExtensionMethods.h"

@implementation NSString (MyExtensionMethods)

+ (void)printTypeOfCaller:(id)object{
    NSLog(@"type of caller = %@" , NSStringFromClass([object class]));
}

@end
