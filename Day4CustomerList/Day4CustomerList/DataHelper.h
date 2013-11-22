//
//  DataHelper.h
//  Day4CustomerList
//
//  Created by ozgend on 11/22/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHelper : NSObject

+ (void) persistKey:(NSString*)key withValue:(NSString*)value;
+ (NSString*) loadKey:(NSString*)key;

@end
