//
//  NoXibView.h
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoXibView : UIView <UIAlertViewDelegate>

- (void) createUI;
- (void) addToWindow:(UIWindow*)window;

@end
