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

@synthesize ActiveSessions;

- (id) init{
    inSessionSequenceNo = 1;
    
    ActiveSessions = [[SessionList alloc] init];
    
    return [super initWithPath:@"/talks" withSerializer:[[SessionSerializer alloc]init]];
}

- (void) create:(NSString *) sessionTitle description:(NSString *) sessionDesc owner:(NSInteger) sessionOwnerID
{
    Session *aNewSession = [[Session alloc]init];
    
    NSLog(@"SessionService create: [%@][%@][%d]", sessionTitle, sessionDesc, sessionOwnerID );
    
    aNewSession.title = sessionTitle;
    aNewSession.description = sessionDesc;
    aNewSession.ownerId = sessionOwnerID;
    aNewSession.key = inSessionSequenceNo;
    inSessionSequenceNo++;
    
    // web service function to create the new session at host side
    
    [ActiveSessions addSession:aNewSession];
}

- (void) update:(NSString *) sessionKey sessionStatus:(NSInteger) sessionStatus
{
    NSLog(@"SessionService update: [%@][%d]", sessionKey, sessionStatus );
    
    // web service function to create the new session at host side
    
}

- (void) join:(NSString *) sessionTitle
{
    NSLog(@"SessionService join: [%@] ", sessionTitle );

    Session *aNewSession = [[Session alloc]init];
    
    aNewSession.title = sessionTitle;
    aNewSession.description = @"this is description";
    aNewSession.ownerId = 1234;
    aNewSession.key = inSessionSequenceNo;
    inSessionSequenceNo++;
    
    [ActiveSessions addSession:aNewSession];
    
}


- (NSArray*) getSessionByUserId: (int) userid{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSString stringWithFormat:@"%d",userid] forKey:@"user_id"];
    NSData *data = [HttpQuery querySyncWithPath:@"/talks/" withMethod:@"GET" withParams:dict];
    return [self.serializer deserializeArray:data];
}


@end
