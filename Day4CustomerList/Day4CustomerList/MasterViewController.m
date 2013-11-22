//
//  MasterViewController.m
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#define URL_LIST @"http://192.168.2.32/sampledataservice/customersecure/list"

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ObjectParse.h"
#import "CustomerModel.h"


@implementation MasterViewController
@synthesize responseModel,indexedCustomerList,indexList;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//ekran window a getirildi
-(void)viewDidAppear:(BOOL)animated{
    [self downloadCustomerList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.indexList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *keyIndex = [self.indexList objectAtIndex:section];
    return [[self.indexedCustomerList objectForKey:keyIndex] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.indexList[section];
}


-  (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.indexList;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customerCell"];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customerCell"];
    }
    
    NSString * sectionKey = self.indexList[indexPath.section];
    NSArray * sectionList = [self.indexedCustomerList objectForKey:sectionKey];
    CustomerModel *item = (CustomerModel*) sectionList[indexPath.row];
    
    
    UILabel *lbl1 = (UILabel *)[cell viewWithTag:100];
    lbl1.text = item.Fullname;
    
    UILabel *lbl2 = (UILabel *)[cell viewWithTag:101];
    lbl2.text = item.Address;
    
    if([item.IsActive boolValue]){
        lbl1.textColor = [UIColor blackColor];
        lbl2.textColor = [UIColor blackColor];
    }
    else{
        lbl1.textColor = [UIColor grayColor];
        lbl2.textColor = [UIColor grayColor];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString * sectionKey = self.indexList[indexPath.section];
        NSArray * sectionList = [self.indexedCustomerList objectForKey:sectionKey];
        CustomerModel *item = (CustomerModel*) sectionList[indexPath.row];
        
        [[segue destinationViewController] setDetailItem:item];
    }
}


- (void)downloadCustomerList
{
    MyHttpRequest *request = [[MyHttpRequest alloc] initWithDelegate:self];
    [request getDataFromUrl:URL_LIST withData:nil isSecure:YES];
}

- (void)myHttpRequestCompleted:(NSString *)responseString{
    NSDictionary *dict = [ObjectParse convertFromJson:responseString];
    self.responseModel = [[CustomerResponseModel alloc] initWithJsonData:dict];
    
    [self createIndexedDictionary];
    
    if(self.responseModel.Ok){
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView reloadData];
    }
    else{
        [[[UIAlertView alloc]initWithTitle:@"error"
                                   message:self.responseModel.Message delegate:self
                         cancelButtonTitle:@"Ok"
                         otherButtonTitles: nil]
         show];
    }
}

- (void)myHttpRequestFailed{
    [[[UIAlertView alloc]initWithTitle:@"error"
                               message:@"Request failed." delegate:self
                     cancelButtonTitle:@"Ok"
                     otherButtonTitles: nil]
     show];
}


- (void) createIndexedDictionary{
    NSMutableDictionary *temp = [NSMutableDictionary dictionary];
    
    for (CustomerModel *customer in self.responseModel.Customers) {
        NSMutableArray *array = [temp objectForKey:customer.IndexValue];
        
        if(array==nil){
            array = [NSMutableArray array];
            [temp setObject:array forKey:customer.IndexValue];
        }
        
        [array addObject:customer];
    }
    
    self.indexList = [[temp allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    self.indexedCustomerList = temp;
}












@end
