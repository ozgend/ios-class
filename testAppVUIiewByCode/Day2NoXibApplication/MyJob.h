//
//  MyJob.h
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyJobDelegate <NSObject>

@required
- (void) sendJobFinishMessage;

@end

@interface MyJob : NSObject

@property (strong) id delegate;

- (id)initWithDelegate:(id)dlg;
- (void) doSomething;

@end
