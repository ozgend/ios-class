//
//  MyHttpRequest.m
//  Day2TabControl
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "MyHttpRequest.h"
#import "ObjectParse.h"
#import "DataHelper.h"

@implementation MyHttpRequest
@synthesize delegate;

- (id)initWithDelegate:(id)__delegate
{
    self = [super init];
    self.delegate = __delegate;
    return self;
}

- (void)getDataFromUrl:(NSString *)urlString withData:(id)data isSecure:(BOOL)secure

{
    
    NSLog(@"getDataFromUrl %@",urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest * request =
        [NSMutableURLRequest requestWithURL:url
                                cachePolicy:NSURLRequestReloadIgnoringCacheData
                            timeoutInterval:8.0];
    if(data){
        NSError *serializationError;
        id temp = [ObjectParse convertFromObject:data];
        NSData *postData =
                [NSJSONSerialization dataWithJSONObject:temp
                                                options:0
                                                  error:&serializationError];
                
        [request setHTTPMethod:@"POST"];
        [request setValue:[NSString stringWithFormat:@"%d",postData.length]
       forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:postData];
        
        
        NSLog(@"withData %@",temp);
    }
    
    if(secure){
        id token = [DataHelper loadKey:@"KEY_USERTOKEN"];
        [request setValue:token forHTTPHeaderField:@"Authentication-Token"];
    }
    
    [request setValue:@"application/json charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"myhttprequest - dispatch_async");
        
        NSURLResponse *response;
        NSError *error;
        NSData *responseData =
        [NSURLConnection sendSynchronousRequest:request
                              returningResponse:&response
                                          error:&error];
        
        
        if(error){
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                
                NSLog(@"NSHTTPURLResponse HTTP-%d error = %@",
                      httpResponse.statusCode,
                      error);
            }
                        
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate myHttpRequestFailed];
            });
            
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"dispatch_async success");
            NSString *serializedData = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            
            [self.delegate myHttpRequestCompleted:serializedData];
        });
    
    });
    
}












@end
