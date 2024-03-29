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

    return [super initWithPath:@"/api/talks" withSerializer:[[SessionSerializer alloc]init]];
}
- (NSArray *)getOwnedSession{
    NSData* jsonData = [HttpQuery querySyncWithPath:@"/api/talks" withMethod:@"GET" withParams:nil];
    
    return [self.serializer deserializeArray:jsonData];

}

- (NSArray *)getJoinedSession{
    NSData* jsonData = [HttpQuery querySyncWithPath:@"/api/joined_talks" withMethod:@"GET" withParams:nil];
    
    return [self.serializer deserializeArray:jsonData];

}

- (id)joinSession: (int) sessionId{
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/join", sessionId]
                                         withMethod:@"POST"
                                         withParams:nil];
    
    return [self.serializer deserialize:jsonData];
}

- (id)leaveSession: (int) sessionId{
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/leave", sessionId]
                                         withMethod:@"POST"
                                         withParams:nil];
    
    return [self.serializer deserialize:jsonData];
}

-(id)findByPasscode: (NSString *)passcode{
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/passcode/%@", passcode]
                                         withMethod:@"GET"
                                         withParams:nil];
    
    return [self.serializer deserialize:jsonData];
}

- (id)endSession:(int)sessionId{
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/close", sessionId]
                                         withMethod:@"POST"
                                         withParams:nil];
    
    return [self.serializer deserialize:jsonData];
}
- (id)startSession:(int)sessionId{
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/start", sessionId]
                                         withMethod:@"POST"
                                         withParams:nil];
    
    return [self.serializer deserialize:jsonData];
}

@end
