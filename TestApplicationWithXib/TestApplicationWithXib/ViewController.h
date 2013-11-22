//
//  ViewController.h
//  TestApplicationWithXib
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"


@interface ViewController : UIViewController
@property (nonatomic, strong) SecondViewController *secondViewController;

- (IBAction)buttonItemTap:(id)sender;

@end
