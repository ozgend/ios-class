//
//  sqlLiteDb.m
//  testsqlite
//
//  Created by ozgend on 11/22/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "btSqlLite.h"

@implementation btSqlLite

- (id)initWithPath:(NSString *)path {
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDirPath = [dirPaths objectAtIndex:0];
    NSString * databasePath = [[NSString alloc] initWithString: [docsDirPath stringByAppendingPathComponent: path]];
    
    NSLog(@"btSqlLite - initWithPath %@",databasePath);
    
    
    if (self = [super init]) {
        sqlite3 *dbConnection;
        if (sqlite3_open([path UTF8String], &dbConnection) != SQLITE_OK) {
            NSLog(@"btSqlLite - cannot open database [%@]",databasePath);
            return nil; 
        }
        database = dbConnection;
    }
    return self;
}

- (NSArray *)performQuery:(NSString *)query {
    sqlite3_stmt *statement = nil;
    const char *sql = [query UTF8String];
    if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) != SQLITE_OK) {
        NSLog(@"btSqlLite - sqlite3_prepare_v2 error [%@]",query);
    } else {
        NSMutableArray *result = [NSMutableArray array];
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSMutableArray *row = [NSMutableArray array];
            for (int i=0; i<sqlite3_column_count(statement); i++) {
                int colType = sqlite3_column_type(statement, i);
                id value;
                if (colType == SQLITE_TEXT) {
                    const unsigned char *col = sqlite3_column_text(statement, i);
                    value = [NSString stringWithFormat:@"%s", col];
                } else if (colType == SQLITE_INTEGER) {
                    int col = sqlite3_column_int(statement, i);
                    value = [NSNumber numberWithInt:col];
                } else if (colType == SQLITE_FLOAT) {
                    double col = sqlite3_column_double(statement, i);
                    value = [NSNumber numberWithDouble:col];
                } else if (colType == SQLITE_NULL) {
                    value = [NSNull null];
                } else {
                    NSLog(@"btSqlLite - cannot match type [%d]",colType);
                }
                
                [row addObject:value];
            }
            [result addObject:row];
        }
        return result;
    }
    return nil;
}

@end
