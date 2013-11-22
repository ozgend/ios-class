//
//  NamesResponse.h
//  Day2TabControl
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NamesResponse : NSObject

@property (nonatomic,readwrite) BOOL Ok;
@property (nonatomic,strong) NSMutableArray *Names;

- (id)initWithJsonData:(NSDictionary *)dictionary;

@end
