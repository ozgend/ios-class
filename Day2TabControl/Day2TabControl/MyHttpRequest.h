//
//  MyHttpRequest.h
//  Day2TabControl
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyHttpRequestCallback <NSObject>

@required
- (void) myHttpRequestCompleted:(NSString*)responseString;
- (void) myHttpRequestFailed;

@end

@interface MyHttpRequest : NSObject

@property (strong, nonatomic) id delegate;

- (id)initWithDelegate:(id)__delegate;

- (void) getDataFromUrl:(NSString *)urlString withData:(id)data;

@end
