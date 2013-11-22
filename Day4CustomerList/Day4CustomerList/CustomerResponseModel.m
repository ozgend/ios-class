//
//  CustomerResponseModel.m
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "CustomerResponseModel.h"
#import "CustomerModel.h"

@implementation CustomerResponseModel
@synthesize Customers,Ok,Message;

- (id)initWithJsonData:(NSDictionary *)data{
    self = [super init];
    
    if(self!=nil && data!=nil){
        
        Ok = [[data objectForKey:@"Ok"] boolValue];
        Message = [data objectForKey:@"Message"];
        id list = [data objectForKey:@"Customers"];
        [self fillCustomers:list];
    }
    
    return self;
}

- (void)fillCustomers:(NSArray *)list{
    @autoreleasepool
    {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (id item in list) {
        CustomerModel* customer = [[CustomerModel alloc] initWithJsonData:item];
        [temp addObject:customer];
    }
    
    self.Customers = [temp copy];
    }
    
}








@end
