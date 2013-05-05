//
//  SessionService.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "SessionService.h"
#import "SessionSerializer.h"
@implementation SessionService

- (id) init{
    return [super initWithPath:@"/talks" withSerializer:[[SessionSerializer alloc]init]];
}

@end
