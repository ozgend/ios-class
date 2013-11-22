//
//  ViewController.m
//  TestApp1
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "RootView.h"

@interface RootView ()

@end

@implementation RootView
@synthesize view2,view1;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear %i",animated);
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"viewDidDisappear %i",animated);
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"viewWillDisappear %i",animated);
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear %i",animated);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


- (void)btnClicked{
    self.view2.hidden = !self.view2.hidden;
}


- (IBAction)switchViewsClicked {
    self.view1.hidden = !self.view1.hidden;
    self.view2.hidden = !self.view2.hidden;
}



@end
