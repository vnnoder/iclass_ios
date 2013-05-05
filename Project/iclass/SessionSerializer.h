//
//  SessionSerializer.h
//  iclass
//
//  Created by Ma Xiangmei on 5/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Serializer.h"
#import "Session.h"
@interface SessionSerializer : NSObject <Serializer>
+ (NSData*) serialize: (Session*)user;
+ (Session*) deserialize: (NSData*)json;

@end