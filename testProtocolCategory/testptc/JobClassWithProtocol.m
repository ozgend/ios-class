//
//  MyClass.m
//  testptc
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "JobClassWithProtocol.h"

@implementation JobClassWithProtocol
@synthesize delegate;

- (id)initWithDelegate:(id)_delegate{
    self = [super init];
    if (self) {
        self.delegate = _delegate;
    }
    return self;
}

- (void)doSomething{
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self
                                   selector:@selector(callDelegete) userInfo:nil repeats:YES];
}


- (void) callDelegete{
    [[self delegate] sendJobDoneMessageFromCaller:self];
}

@end    
