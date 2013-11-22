//
//  ThirdViewController.h
//  Day2TabControl
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyHttpRequest.h"

@interface ThirdViewController :
UIViewController
<UISearchBarDelegate,
UITableViewDataSource,
UITableViewDelegate,
UIGestureRecognizerDelegate,
MyHttpRequestCallback>

@property (strong,nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *busyOverlay;

@property (strong, nonatomic) NSArray *list;

- (void) getJsonStringFromUrl;
- (void) toggleBusyOverlay:(BOOL)shouldDisplay;

@end
