//
//  ViewController.m
//  testblk
//
//  Created by ozgend on 11/20/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize fadeView,resizeView;

BOOL visible = false;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) sampleBlockCall{
    
    int (^mathBlock)(int a, int b);
    
    mathBlock = ^int(int a, int b) {
        return a + b;
    };
    
    // call
    int sum = mathBlock(13,4);
    NSLog(@"13 + 4 = %d", sum);
}

- (void) animationBlockCall{
    void (^fadeAndFrameAnimation)(void);
    void (^animationCompletion)(BOOL);
    
    fadeAndFrameAnimation = ^void(void){
        double alpha;
        CGRect frame;
        
        if(visible){
            alpha = 0.0;
            frame = CGRectMake(-100,-100,0,0);
        }
        else{
            alpha = 1.0;
            frame = CGRectMake(60,60,100,100);
        }
        
        self.fadeView.alpha = alpha;
        self.resizeView.frame = frame;
        
    };
    
    animationCompletion = ^void(BOOL finished){
        NSLog(@"animationCompletionBlock");
        visible = !visible;
    };
    
    [UIView animateWithDuration:0.6 animations:fadeAndFrameAnimation completion:animationCompletion];
}


- (IBAction)toggleButtonClick {
    [self animationBlockCall];
}

@end
