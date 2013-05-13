//
//  mapInfo.h
//  iclass
//
//  Created by Wiely Rabin on 13/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface mapInfo : NSObject <MKAnnotation> {
	NSString *title;
	CLLocationCoordinate2D coordinate;
    
}

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

-(id) initWithCoordinate: (CLLocationCoordinate2D)c
				   title:(NSString *)t;


@end
