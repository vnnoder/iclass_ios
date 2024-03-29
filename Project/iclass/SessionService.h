//
//  SessionService.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceAPI.h"

@interface SessionService : ServiceAPI
    
    - (NSArray *)getOwnedSession;
    - (NSArray *)getJoinedSession;
    - (id)joinSession: (int) sessionId;
    - (id)leaveSession: (int) sessionId;
    - (id)findByPasscode: (NSString *)passcode;
    - (id)endSession:(int)sessionId;
    - (id)startSession:(int)sessionId;

@end
