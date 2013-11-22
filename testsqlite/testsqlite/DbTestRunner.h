//
//  DbTestRunner.h
//  testsqlite
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "btSqlLite.h"

@interface DbTestRunner : NSObject

+ (NSArray *) testDatabase:(NSString *)name withQuery:(NSString *)query;

@end
