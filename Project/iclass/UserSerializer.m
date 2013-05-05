//
//  UserJSONParser.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "UserSerializer.h"
#import "User.h"
#import "JSON.h"

@implementation UserSerializer

/**
 json data received:
 user[name]:Lewis
 user[username]:Lewis
 user[password]:pass123
*/
+ (NSDictionary *) toNSDictionary:(id)entity{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:[user fullName] forKey:@"user[name]"];
    [dict setValue:[user loginId] forKey:@"user[username]"];
    [dict setValue:[user email] forKey:@"user[email]"];
    [dict setValue:[user password] forKey:@"user[password]"];
    retrn dict;
}

+ (id) fromNSDictionary:(NSDictionary * dict)entity{
    User *entity = [[User alloc]init];
    entity.loginId = [map objectForKey:@"username"];
    entity.fullName = [map objectForKey:@"name"];
    enitty.key = [map objectForKey: @"id"];
    return entity;
}

@end
