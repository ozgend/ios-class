//
//  FirstViewController.h
//  Day2TabControl
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
    <UIWebViewDelegate,UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIView *busyOverlay;


- (void) toggleBusyOverlay:(BOOL)shouldDisplay;
- (void) searchInGoogle:(NSString *)text;
@end
