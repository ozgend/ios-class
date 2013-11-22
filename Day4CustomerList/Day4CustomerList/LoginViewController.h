//
//  LoginViewController.h
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyHttpRequest.h"

@interface LoginViewController : UIViewController
<MyHttpRequestCallback>

- (IBAction)btncloginClick:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@end
