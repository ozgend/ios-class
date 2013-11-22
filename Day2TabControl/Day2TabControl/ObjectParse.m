//
//  ObjectParse.m
//  Day2TabControl
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "ObjectParse.h"
#import "SBJson.h"

@implementation ObjectParse

+ (id)convertFromJson:(NSString *)response
{
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    id result = [parser objectWithString:response];
    return result;
}

@end
