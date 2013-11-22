//
//  DbTestRunner.m
//  testsqlite
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "DbTestRunner.h"

@implementation DbTestRunner

+ (NSArray *)testDatabase:(NSString *)name withQuery:(NSString *)query
{
    btSqlLite *database = [[btSqlLite alloc] initWithPath:name];
    NSArray *result = [database performQuery:query];
    return result;
}

@end
