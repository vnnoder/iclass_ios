//
//  SessionService.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "SessionService.h"
#import "SessionSerializer.h"
#import "SessionList.h"
#import "Session.h"
#import "HttpQuery.h"

@implementation SessionService


- (id) init{

    return [super initWithPath:@"/talks" withSerializer:[[SessionSerializer alloc]init]];
}
- (NSArray *)getOwnedSession{
    return [self list];
}

- (NSArray *)getJoinedSession{
    NSData* jsonData = [HttpQuery  querySyncWithPath:@"joined_talks" withMethod:@"GET" withParams:nil];
    return [self.serializer deserializeArray:jsonData];

}


@end
