//
//  SecondViewController.m
//  Day2TabControl
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *logo = [UIImage imageNamed:@"gnulogo.png"];
    [self.imageView setImage:logo];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];}

@end
