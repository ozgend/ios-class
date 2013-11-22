//
//  StarterViewController.m
//  Day4CustomerList
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "StarterViewController.h"
#import "DataHelper.h"

@implementation StarterViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    
    id token = [DataHelper loadKey:@"KEY_USERTOKEN"];
    id segueIdentifier = @"displayLogin";
    
    if (token) {
        segueIdentifier = @"loadMaster";
    }
    
    [self performSegueWithIdentifier:segueIdentifier sender:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
