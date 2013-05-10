//
//  SessionList.m
//  iclass
//
//  Created by Wiely Rabin on 9/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "SessionList.h"
#import "Session.h"

@implementation SessionList

@synthesize DataList;

- (id) init {
    self = [super init];
    DataList = [[NSMutableArray alloc] init];
    return self;
}

- (void) addDummySession
{
    Session *aSession;
    aSession = [[Session alloc]init];
 
    aSession.title = @"DummySession";
    aSession.description = @"DummyDesc";
    aSession.status = @"what a status";
    
    [self addSession:aSession];
}


- (void) addSession:(Session *) aSession
{
    [DataList addObject:aSession];
}


@end
