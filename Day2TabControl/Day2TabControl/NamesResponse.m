//
//  NamesResponse.m
//  Day2TabControl
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "NamesResponse.h"

@implementation NamesResponse
@synthesize Names,Ok;

- (id)initWithJsonData:(NSDictionary *)dictionary{
    self = [super init];
    
    if(self!=nil && dictionary!=nil){
        Ok = [[dictionary objectForKey:@"Ok"] boolValue];
        Names = [dictionary objectForKey:@"Names"];
    }
    
    return self;
}


@end
