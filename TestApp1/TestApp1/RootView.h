//
//  ViewController.h
//  TestApp1
//
//  Created by ozgend on 11/18/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootView : UIViewController

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIButton *button1;

- (IBAction)btnClicked;
- (IBAction)switchViewsClicked;


@end
