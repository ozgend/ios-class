//
//  NoXibView.m
//  Day2NoXibApplication
//
//  Created by ozgend on 11/19/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "NoXibView.h"

@implementation NoXibView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

- (void)addToWindow:(UIWindow *)window{
    [window addSubview:self];
    [window bringSubviewToFront:self];
}

- (void) buttonClicked{
    [[[UIAlertView alloc] initWithTitle:@"alert" message:@"from button click" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: @"no",@"yes",nil] show];
}

- (void)createUI{
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor =[UIColor whiteColor];
    label.text = @"Nox Xib View";
    label.font = [UIFont boldSystemFontOfSize:20];
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithCustomView:label];
    toolbar.items = @[titleItem];
    toolbar.tintColor = [UIColor redColor];
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 70, 120,40);
    [button setTitle:@"click me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:toolbar];
    [self addSubview:button];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex = %d",buttonIndex);
    
}

@end
