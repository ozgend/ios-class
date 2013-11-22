//
//  ThirdViewController.m
//  Day2TabControl
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "ThirdViewController.h"
#import "ObjectParse.h"
#import "NamesResponse.h"


@implementation ThirdViewController
@synthesize searchBar,tableView,list,busyOverlay;

__strong NSMutableArray *filteredList;
BOOL isSearchMode = NO;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    filteredList = [[NSMutableArray alloc] init];
    
    [self getJsonStringFromUrl];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnTable)];
    [self.tableView addGestureRecognizer:tap];
    
}

- (void) getJsonStringFromUrl
{
    [self toggleBusyOverlay:YES];
    
    MyHttpRequest *myRequest = [[MyHttpRequest alloc] initWithDelegate:self];
    
    [myRequest getDataFromUrl:@"http://192.168.2.50/sampledataservice/customer/listnames" withData:nil];
}



- (void) tapOnTable{
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =
        [[UITableViewCell alloc]
         initWithStyle:UITableViewCellStyleDefault
         reuseIdentifier:@"cellIdentifier"];
    
    if(isSearchMode){
        cell.textLabel.text = filteredList[indexPath.row];
    }
    else{
        cell.textLabel.text = self.list[indexPath.row];
    }
        
    return cell; 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (isSearchMode) {
        return filteredList.count;
    }
    else{
        return self.list.count;
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"searchText = %@", searchText);
    
    isSearchMode = searchText.length > 0;
    
    if (!isSearchMode) {
        [self.tableView reloadData];
        [self.searchBar resignFirstResponder];
    }
    else{
        [filteredList removeAllObjects];
    
        for (int i =0; i<self.list.count; i++) {
            BOOL exists =
                [self.list[i] rangeOfString:searchText options:NSCaseInsensitiveSearch].location != NSNotFound;
            
            if(exists)
            {
                [filteredList addObject:self.list[i]];
            }
        }
    
        [self.tableView reloadData];
    }
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



- (void)myHttpRequestCompleted:(NSString *)responseString{
    
    NSDictionary *responseDictionary =
    [ObjectParse convertFromJson:responseString];
    
    NamesResponse *namesResponse =
    [[NamesResponse alloc] initWithJsonData:responseDictionary];
    
    self.list = namesResponse.Names;
    [self.tableView reloadData];
    
    [self toggleBusyOverlay:NO];
    
}

- (void)myHttpRequestFailed{
    NSLog(@"myHttpRequestFailed Callback");
    [self toggleBusyOverlay:NO];
}








@end
