//
//  NonARCClass.h
//  TestApp1
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NonARCClass : NSObject

@property (retain,nonatomic) NSArray *array;

- (void) foo;

@end
