//
//  TestObject.h
//  TestApp1
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject{
@private NSString *_TestString;
@private NSNumber *_Value;
    
}

@property(strong,nonatomic) NSString *TestString;
@property(strong,nonatomic) NSNumber *Value;

- (void) shoutWithText:(NSString *)text;
- (void) shout;

- (id)initWithTestString:(NSString *)str andValue:(NSNumber *)number;
- (void) setTestString:(NSString *)TestString;

@end

