//
//  AudienceSessionModel.m
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import "AudienceSessionModel.h"

@implementation AudienceSessionModel
@synthesize arraySession;


-(id) init{
    self=[super init];
    arraySession = [[NSMutableArray alloc] initWithObjects:@"iOS DEV", @"Android DEV", nil];
    return self;
}

@end
