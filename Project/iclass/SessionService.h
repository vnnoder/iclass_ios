//
//  SessionService.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceAPI.h"

@class SessionList;

@interface SessionService : ServiceAPI{
    NSInteger inSessionSequenceNo;
    SessionList *ActiveSessions;
}

@property (nonatomic, strong) SessionList *ActiveSessions;

- (void) create:(NSString *) sessionTitle description:(NSString *) sessionDesc owner:(NSInteger) sessionOwnerID;
- (void) update:(NSString *) sessionKey sessionStatus:(NSInteger) sessionStatus;
- (void) join:(NSString *) sessionTitle;

@end
