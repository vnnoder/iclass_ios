//
//  SessionSerializer.m
//  iclass
//
//  Created by Ma Xiangmei on 5/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "SessionSerializer.h"
#import "Session.h"
#import "JSON.h"

@implementation SessionSerializer

/**
 returned JSON format:
 
 talk[title]:tttt
 talk[description]:dddd
 talk[status]:OPEN
 
 talk[start_date(1i)]:2013
 talk[start_date(2i)]:5
 talk[start_date(3i)]:5
 talk[end_date(1i)]:2013
 talk[end_date(2i)]:5
 talk[end_date(3i)]:5
 
 */
+ (NSDictionary *) toNSDictionary:(id)entity{
    Session *session = (Session*) entity;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:[NSNumber numberWithInteger:[session key]] forKey:@"talk[id]"];
    [dict setValue:[session title ] forKey:@"talk[title]"];
    [dict setValue:[session description ] forKey:@"talk[description]"];
    [dict setValue:[NSNumber numberWithInteger:[session ownerId]] forKey:@"talk[user_id]"];
    [dict setValue:[session status] forKey:@"talk[status]"];

    //TODO
//    [dict setValue:[session startDate] forKey:@"talk[start_date]"];
//    [dict setValue:[session endDate] forKey:@"talk[end_date]"];

    return dict;
}

+ (id) fromNSDictionary:(NSDictionary *) dict{
    Session *entity = [[Session alloc]init];
    entity.key = [[dict objectForKey: @"id"]integerValue];
    entity.title = [dict objectForKey:@"username"];
    entity.description = [dict objectForKey:@"name"];
    entity.ownerId = [[dict objectForKey: @"user_id"]integerValue];
    entity.status = [dict objectForKey:@"status"];
    return entity;
}

@end
