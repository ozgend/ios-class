//
//  NSString+CustomExtensions.m
//  testptc
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "NSString+CustomExtensions.h"

@implementation NSString (CustomExtensions)

+ (void)printTypeOfCaller:(id)object{
    NSLog(@"type of caller object is %@", NSStringFromClass([object class]));
}

@end
