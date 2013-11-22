//
//  ViewController.h
//  testblk
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *fadeView;
@property (strong, nonatomic) IBOutlet UIView *resizeView;
- (IBAction)toggleButtonClick;
- (void) animationBlockCall;
@end
