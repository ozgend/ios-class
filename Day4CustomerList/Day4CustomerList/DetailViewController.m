//
//  DetailViewController.m
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#define URL_EDIT @"http://192.168.2.32/sampledataservice/customersecure/edit"
#import "DetailViewController.h"
#import "CustomerResponseModel.h"
#import "ObjectParse.h"

@implementation DetailViewController
@synthesize detailItem,lblId,lblNAme,lblSurname,txtAddress,txtBirth,txtCity,txtEmail,txtCountry,txtPhone;

#pragma mark - Managing the detail item



- (void)configureView
{
    if (self.detailItem) {
        
        self.lblId.text = [self.detailItem.Id stringValue];
        self.lblNAme.text = self.detailItem.Firstname;
        self.lblSurname.text = self.detailItem.Lastname;
        
        self.txtAddress.text = self.detailItem.Address;
        self.txtBirth.text = self.detailItem.Birthdate;
        self.txtCity.text = self.detailItem.City;
        self.txtCountry.text = self.detailItem.Country;
        self.txtEmail.text = self.detailItem.Email;
        self.txtPhone.text = self.detailItem.Phone;
        
        [self.switchIsactive setOn:[self.detailItem.IsActive boolValue] animated:YES];
        
        self.scrollView.scrollEnabled = YES;
        [self.scrollView setContentSize:CGSizeMake(320, 640)];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnView)];
    [self.scrollView addGestureRecognizer:tap];
    
}

- (void) tapOnView{
    [self.txtAddress resignFirstResponder];
    [self.txtBirth resignFirstResponder];
    [self.txtCity resignFirstResponder];
    [self.txtCountry resignFirstResponder];
    [self.txtEmail resignFirstResponder];
    [self.txtPhone resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)switchValueChanged:(id)sender {
    self.detailItem.IsActive = [NSNumber numberWithBool:self.switchIsactive.isOn];
}

- (void)buttonUpdateClick{
    
    MyHttpRequest *request = [[MyHttpRequest alloc] initWithDelegate:self];
    [request getDataFromUrl:URL_EDIT withData:self.detailItem isSecure:YES];
}

- (void)myHttpRequestCompleted:(NSString *)responseString{
    NSDictionary *dict = [ObjectParse convertFromJson:responseString];
    
    CustomerResponseModel *response =
        [[CustomerResponseModel alloc] initWithJsonData:dict];
    
    
    [[[UIAlertView alloc]initWithTitle:@"info"
                               message:response.Message delegate:self
                     cancelButtonTitle:@"Ok"
                     otherButtonTitles: nil]
     show];
}


- (void)myHttpRequestFailed{
    [[[UIAlertView alloc]initWithTitle:@"error"
                               message:@"Request failed." delegate:self
                     cancelButtonTitle:@"Ok"
                     otherButtonTitles: nil]
     show];
}


- (void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    NSLog(@"textViewDidEndEditing tag %d",textView.tag);
}


- (IBAction)txtValueEdit:(id)sender {
    NSLog(@"txtValueEdit tag %@",((UITextView*)sender).text);
    
    int tag = ((UITextView*)sender).tag;
    
    switch (tag) {
        case TAG_ADDRESS:
            self.detailItem.Address = ((UITextView*)sender).text;
            break;
        case TAG_BIRTH:
            self.detailItem.Birthdate = ((UITextView*)sender).text;
            break;
        case TAG_CITY:
            self.detailItem.City = ((UITextView*)sender).text;
            break;
        case TAG_COUNTRY:
            self.detailItem.Country = ((UITextView*)sender).text;
            break;
        case TAG_EMAIL:
            self.detailItem.Email = ((UITextView*)sender).text;
            break;
        case TAG_PHONE:
            self.detailItem.Phone = ((UITextView*)sender).text;
            break;
            
            
        default:
            break;
    }

}
@end
