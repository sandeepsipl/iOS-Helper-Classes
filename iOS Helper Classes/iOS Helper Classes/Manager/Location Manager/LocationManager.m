//
//  LocationManager.m
//  iOS Helper Classes
//
//  Created by Akshada on 5/31/16.
//  Copyright © 2016 Systematix Infotech Pvt. Ltd. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

+ (LocationManager*)getInstance {
    static dispatch_once_t once;
    static LocationManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        //Allocate all variables
        locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

/*
- (void)getCurrentLocation
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    if(iOS8)
        [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    
}
*/

- (void) getCurrentLocation
{
    if ([CLLocationManager locationServicesEnabled])
    {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [locationManager requestWhenInUseAuthorization];
        }
        [locationManager startUpdatingLocation];
    }
    else{
        
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled" message:@"You currently have all location services for this device disabled. If you proceed, you will be showing past informations. To enable, Settings->Location->location services->on" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:@"Continue",nil];
        servicesDisabledAlert.tag=1;
        [servicesDisabledAlert show];
        
        [servicesDisabledAlert setDelegate:self];
    }
}

- (void)requestWhenInUseAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // If the status is denied or only granted for when in use, display an alert
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location services are off" : @"Background location is not enabled";
        NSString *message = @"To use background location you must turn on 'Always' in the Location Services Settings";
        
        UIAlertView *alertViews = [[UIAlertView alloc] initWithTitle:title
                                                             message:message
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles:@"Settings", nil];
        alertViews.tag=2;
        [alertViews show];
    }
    // The user has not enabled any location services. Request background authorization.
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [locationManager requestWhenInUseAuthorization];
    }
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //    [errorAlert show];
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
        {
            // do some error handling
        }
            break;
        default:{
            [locationManager startUpdatingLocation];
        }
            break;
    }
}

/*
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    CLLocation *location;
    location =  [manager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    _currentLocation = [[CLLocation alloc] init];
    _currentLocation = newLocation;
    _longitude = [NSString stringWithFormat:@"%f",coordinate.longitude];
    _latitude = [NSString stringWithFormat:@"%f",coordinate.latitude];
    //    globalObjects.longitude = [NSString stringWithFormat:@"%f",coordinate.longitude];
    //    globalObjects.latitude = [NSString stringWithFormat:@"%f",coordinate.latitude];
}
*/

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    // Assigning the last object as the current location of the device
    CLLocation *currentLocation = [locations lastObject];
    CLLocationCoordinate2D coordinate = [currentLocation coordinate];
    _longitude = [NSString stringWithFormat:@"%f",coordinate.longitude];
    _latitude = [NSString stringWithFormat:@"%f",coordinate.latitude];
    
}

#pragma mark - UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag==1) {
        
    }
    else if (alertView.tag==2) {
        if (buttonIndex==1) {
            NSURL *url = [NSURL URLWithString: UIApplicationOpenSettingsURLString];
            if([[UIApplication sharedApplication] canOpenURL: url]){
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }
}

@end
