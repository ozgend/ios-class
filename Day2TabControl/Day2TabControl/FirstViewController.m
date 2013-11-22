//
//  FirstViewController.m
//  Day2TabControl
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController
@synthesize webView,searchBar,busyOverlay;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;
    self.busyOverlay.alpha = 0.0;
    self.searchBar.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"shouldStartLoadWithRequest = %@",request);
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad -- ");
    [self toggleBusyOverlay:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad -- ");
    [self toggleBusyOverlay:NO];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError -- %@", error);
    [self toggleBusyOverlay:NO];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    if (self.searchBar.text.length > 0) {
        [self searchInGoogle: self.searchBar.text];
    }
}


- (void)searchInGoogle:(NSString *)text{
    
    NSString *searchUrl = [NSString stringWithFormat:@"http://www.google.com/search?q=%@",text];
    NSURL *url = [NSURL URLWithString:searchUrl];
    
    NSURLRequest *request =
    [[NSURLRequest alloc] initWithURL: url
                          cachePolicy: NSURLRequestReloadIgnoringLocalCacheData
                      timeoutInterval: 5.0];
    
    [self.webView loadRequest:request];
}

- (void) toggleBusyOverlay:(BOOL)shouldDisplay{
    float alpha = 0.0;
    if(shouldDisplay){
        alpha = 0.5;
        self.busyOverlay.hidden = NO;
    }
    
    void (^fadeAnimation)(void);
    void (^completeAnimation)(BOOL);
    
    
    fadeAnimation = ^void(void){
        self.busyOverlay.alpha = alpha;
    };
    
    completeAnimation = ^void(BOOL finished){
        self.busyOverlay.hidden = !shouldDisplay;
    };
    
    [UIView animateWithDuration:0.3 animations:fadeAnimation completion:completeAnimation];
    
}



















@end
