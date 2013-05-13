//
//  mapInfo.m
//  iclass
//
//  Created by Wiely Rabin on 13/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "mapInfo.h"

@implementation mapInfo

@synthesize coordinate, title;

-(id) initWithCoordinate: (CLLocationCoordinate2D) c title:(NSString *)t
{
	if (self =[super init]) {
        coordinate =c;
        [self setTitle:t];
    }
	return self;
}

@end

