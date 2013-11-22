//
//  MyJob.m
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "MyJob.h"

@implementation MyJob

- (id)initWithDelegate:(id)dlg{
    self = [super init];
    
    if(self){
        self.delegate = dlg;
    }
    
    return self;
}

- (void)doSomething{
    [NSTimer
        scheduledTimerWithTimeInterval:2.0
        target:self
        selector:@selector(notifyJobFinish)
        userInfo:nil
        repeats:YES];
        
    
    [self performSelector:@selector(notifyJobFinish)];
    [self notifyJobFinish];
}

- (void)notifyJobFinish{
    [self.delegate sendJobFinishMessage];
}

@end
