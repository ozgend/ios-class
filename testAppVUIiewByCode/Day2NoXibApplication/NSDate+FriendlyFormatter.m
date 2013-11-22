//
//  NSDate+FriendlyFormatter.m
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "NSDate+FriendlyFormatter.h"

@implementation NSDate (FriendlyFormatter)

+ (NSString *)formatToFriendly:(NSDate *)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, yyyy"];
    
    NSString *value = [formatter stringFromDate:date];
    return value;
}

@end
