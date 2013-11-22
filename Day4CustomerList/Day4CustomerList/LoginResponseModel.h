//
//  LoginResponseModel.h
//  Day4CustomerList
//
//  Created by ozgend on 11/22/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginResponseModel : NSObject

@property (nonatomic, strong) NSString * Token;
@property (nonatomic,readwrite) BOOL Ok;
@property (nonatomic, strong) NSString * Message;


- (id)initWithJsonData:(NSDictionary *)data;

@end
