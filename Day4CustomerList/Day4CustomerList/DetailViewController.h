//
//  DetailViewController.h
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#define TAG_BIRTH   200
#define TAG_EMAIL   201
#define TAG_PHONE   202
#define TAG_COUNTRY 203
#define TAG_CITY    204
#define TAG_ADDRESS 205

#import <UIKit/UIKit.h>
#import "CustomerModel.h"
#import "MyHttpRequest.h"

@interface DetailViewController : UIViewController
<MyHttpRequestCallback,UITextViewDelegate>

- (IBAction)txtValueEdit:(id)sender;

@property (strong, nonatomic) CustomerModel* detailItem;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UILabel *lblId;
@property (strong, nonatomic) IBOutlet UILabel *lblNAme;
@property (strong, nonatomic) IBOutlet UILabel *lblSurname;
@property (strong, nonatomic) IBOutlet UITextField *txtBirth;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtCountry;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UISwitch *switchIsactive;

- (IBAction)switchValueChanged:(id)sender;

- (IBAction)buttonUpdateClick;

@end
