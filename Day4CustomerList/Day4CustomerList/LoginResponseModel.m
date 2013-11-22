//
//  LoginResponseModel.m
//  Day4CustomerList
//
//  Created by ozgend on 11/22/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "LoginResponseModel.h"

@implementation LoginResponseModel
@synthesize Token,Ok,Message;


- (id)initWithJsonData:(NSDictionary *)data{
    
    self = [super init];
    
    if (self!= nil && data!=nil) {
        Token = [data objectForKey:@"Token"];
        Message = [data objectForKey:@"Message"];
        Ok =[[data objectForKey:@"Ok"] boolValue];
    }
    
    return self;
}

@end
