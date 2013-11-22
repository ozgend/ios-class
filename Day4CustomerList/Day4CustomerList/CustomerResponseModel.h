//
//  CustomerResponseModel.h
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomerResponseModel : NSObject

@property(nonatomic,readwrite) BOOL Ok;
@property(nonatomic,strong) NSArray *Customers;
@property(nonatomic,strong) NSString *Message;

- (id)initWithJsonData:(NSDictionary *)data;

- (void)fillCustomers:(NSArray *)list;

@end
