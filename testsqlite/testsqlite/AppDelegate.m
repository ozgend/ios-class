//
//  AppDelegate.m
//  testsqlite
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "AppDelegate.h"
#import "DbTestRunner.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    id result = [DbTestRunner testDatabase:@"btadb.sqlite" withQuery:@"SELECT * FROM MYTABLE"];
    
    NSLog(@"id -- col1  -- col2");
    
    for (NSArray *row in result) {
        int dataId = [[row objectAtIndex:0] intValue];
        NSString *col1 = [row objectAtIndex:1];
        NSString *col2 = [row objectAtIndex:1];
        NSLog(@"%d -- %@  -- %@", dataId, col1, col2);
    }
    
    return YES;
}


@end
