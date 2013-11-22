//
//  ViewController.m
//  TestApplicationWithXib
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize secondViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonItemTap:(id)sender {
    if (secondViewController==nil) {
        secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    }

    secondViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    //secondViewController.modalPresentationStyle = UIModalpre;
    [self presentViewController:secondViewController animated:YES completion:nil];
}
@end
