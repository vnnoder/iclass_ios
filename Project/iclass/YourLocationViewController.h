//
//  YourLocationViewController.h
//  iclass
//
//  Created by Wiely Rabin on 13/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "mapInfo.h"

@interface YourLocationViewController : UIViewController

<CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
