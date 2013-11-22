//
//  CustomerModel.m
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "CustomerModel.h"

@implementation CustomerModel
@synthesize Phone,Address,Birthdate,City,Country,Email,Firstname,Id,IsActive,Lastname,Fullname,IndexValue;

- (id)initWithJsonData:(NSDictionary *)data{
    self = [super init];
    
    if(self!=nil && data!=nil){
    
        Address = [data objectForKey:@"Address"];
        Birthdate = [data objectForKey:@"Birthdate"];
        City = [data objectForKey:@"City"];
        Country = [data objectForKey:@"Country"];
        Email = [data objectForKey:@"Email"];
        Firstname = [data objectForKey:@"Firstname"];
        Id = [data objectForKey:@"Id"];
        IsActive = [data objectForKey:@"IsActive"];
        Lastname = [data objectForKey:@"Lastname"];
        Fullname = [NSString stringWithFormat:@"%@ %@",Firstname,Lastname];
        IndexValue = [Firstname substringWithRange:NSMakeRange(0, 1)];
    
        
        Phone = [data objectForKey:@"Phone"];
        
        if([Phone isKindOfClass:[NSNull class]]){
            Phone = @"";
        }
        
        
    }
    
    return self;
}

@end














