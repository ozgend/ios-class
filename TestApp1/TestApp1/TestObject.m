//
//  TestObject.m
//  TestApp1
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "TestObject.h"



@implementation TestObject
@synthesize TestString = _TestString, Value = _Value;


- (id)initWithTestString:(NSString *)str andValue:(NSNumber *)number{
    self = [super init];
    if (self != nil) {
        self.TestString = str;
        self.Value = number;
    }
    return self;
}


- (void)shoutWithText:(NSString *)text{
    NSLog(@"%@",text);
}

- (void)shout{
    NSLog(@"Value= %@ TestString= %@",self.Value, self.TestString);
}

- (void)setTestString:(NSString *)testString{
    _TestString = [NSString stringWithFormat:@"my string = %@",testString ];
}

@end
