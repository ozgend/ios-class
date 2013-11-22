//
//  MasterViewController.h
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyHttpRequest.h"
#import "CustomerResponseModel.h"

@interface MasterViewController : UITableViewController <MyHttpRequestCallback>

@property (nonatomic,strong) CustomerResponseModel* responseModel;

@property (nonatomic,strong) NSArray * indexList;
@property (nonatomic,strong) NSMutableDictionary * indexedCustomerList;


- (void) downloadCustomerList;



@end
