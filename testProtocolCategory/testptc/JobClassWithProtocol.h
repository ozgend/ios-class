//
//  MyClass.h
//  testptc
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

//#1
@protocol JobMessageDelegate <NSObject>
@required
- (void) sendJobDoneMessageFromCaller:(id)caller;
@end

@interface JobClassWithProtocol : NSObject

@property (strong) id delegate;


- (id)initWithDelegate:(id)_delegate;
- (void) doSomething;


@end
