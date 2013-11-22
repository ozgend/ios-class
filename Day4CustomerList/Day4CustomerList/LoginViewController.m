//
//  LoginViewController.m
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#define URL_LOGIN @"http://192.168.2.32/sampledataservice/user/login"

#import "LoginViewController.h"
#import "ObjectParse.h"
#import "UserModel.h"
#import "LoginResponseModel.h"
#import "DataHelper.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated{
    NSString* username = [DataHelper loadKey:@"key_username"];
    NSString* password = [DataHelper loadKey:@"key_password"];
    
    self.txtPassword.text = password;
    self.txtUsername.text = username;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btncloginClick:(id)sender {
    
    //  http://192.168.2.32/sampledataservice/user/login
    
    UserModel *user = [[UserModel alloc] init];
    user.Username = self.txtUsername.text;
    user.Password = self.txtPassword.text;
    
    MyHttpRequest *loginRequest = [[MyHttpRequest alloc] initWithDelegate:self];
    [loginRequest getDataFromUrl:URL_LOGIN withData:user isSecure:NO];
    
}

- (void)myHttpRequestCompleted:(NSString *)responseString{
    
    NSDictionary *dict = [ObjectParse convertFromJson:responseString];
    LoginResponseModel *response = [[LoginResponseModel alloc] initWithJsonData:dict];
    
    if (response.Ok) {
        [DataHelper persistKey:@"key_username" withValue:self.txtUsername.text];
        [DataHelper persistKey:@"key_password" withValue:self.txtPassword.text];
        [DataHelper persistKey:@"KEY_USERTOKEN" withValue:response.Token];
        
        [self performSegueWithIdentifier:@"loadMasterFromLogin" sender:self];
    }
    else{
        [[[UIAlertView alloc] initWithTitle:@"error" message:response.Message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    
}

- (void)myHttpRequestFailed{
    
}


@end
