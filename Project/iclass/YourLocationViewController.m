//
//  YourLocationViewController.m
//  iclass
//
//  Created by Wiely Rabin on 13/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "YourLocationViewController.h"

@interface YourLocationViewController ()

@end

@implementation YourLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
    
    MKCoordinateRegion region;
    
 	// define the distance (in degrees) to be display
	region.span.latitudeDelta = .005;
	region.span.longitudeDelta = .005;
	
    [self.mapView setRegion:region animated:TRUE];
    
    self.mapView.showsUserLocation = YES;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) locationManager:(CLLocationManager *)manager
   didUpdateToLocation: (CLLocation *)newLocation
		  fromLocation:(CLLocation *)oldLocation
{
    
    [self.mapView setCenterCoordinate:[newLocation coordinate]  animated:YES];
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error
{
	NSLog(@"Could not locate location: %@", error);
}

/*
- (void) annotateMap: (CLLocationCoordinate2D) newCoordinate {
    
    mapInfo *ma = [[mapInfo alloc] initWithCoordinate:newCoordinate                                                             title:@"76 Hougang Ave 7 Singapore"];
    [self.mapView addAnnotation:ma];
    [self.mapView setCenterCoordinate:newCoordinate animated:YES];
    
    // structure to define areas spanned by a map region
    MKCoordinateRegion region;
    
    region.center = newCoordinate;
    
    // define the distance (in degrees) to be display
    region.span.latitudeDelta = .005;
    region.span.longitudeDelta = .005;
    
    [self.mapView setRegion:region animated:TRUE];
    
    return;
}
*/
- (IBAction)SegmentAction:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex)
    {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        default:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
    }

}

@end
