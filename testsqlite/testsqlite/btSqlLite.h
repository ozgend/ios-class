//
//  sqlLiteDb.h
//  testsqlite
//
//  Created by ozgend on 11/22/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <sqlite3.h>

@interface btSqlLite : NSObject {
    sqlite3 *database;
}

- (id)initWithPath:(NSString *)path;
- (NSArray *)performQuery:(NSString *)query;

@end
