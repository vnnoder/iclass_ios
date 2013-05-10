//
//  sessionListSample.m
//  iclass
//
//  Created by Wiely Rabin on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "sessionListSample.h"

@implementation sessionListSample

@synthesize arrayData;

-(id) init {
    self = [super init];
    arrayData = [[NSMutableArray alloc] initWithObjects:@"Class ID 001",@"Class ID 002", nil];
    return self;
}

@end
