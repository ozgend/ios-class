//
//  ObjectParse.h
//  Day2TabControl
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectParse : NSObject

+ (id) convertFromJson:(NSString *)response;
+ (id)convertFromObject:(id)object;

@end
