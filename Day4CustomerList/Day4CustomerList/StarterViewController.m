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
    
    CLLocationManager* manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.distanceFilter = kCLDistanceFilterNone;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    [manager startUpdatingLocation];
}

- (void)viewDidAppear:(BOOL)animated{
    
    id token = [DataHelper loadKey:@"KEY_USERTOKEN"];
    id segueIdentifier = @"displayLogin";
    
    if (token) {
        segueIdentifier = @"loadMaster";
    }
    
    //[self performSegueWithIdentifier:segueIdentifier sender:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"location error = %@",error);

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation* location= (CLLocation*)locations[0];
    NSLog(@"didUpdateLocations = %@",locations);
    
    NSLog(@"current location = %f, %f",
          location.coordinate.latitude,
          location.coordinate.longitude);
    
}












@end
