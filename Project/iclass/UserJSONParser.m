//
//  UserJSONParser.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "UserJSONParser.h"
#import "User.h"

@implementation UserJSONParser

-(id)toEntity: (NSDictionary *)map{
    User* user = [[User alloc]init];

    NSString* username = [map objectForKey:@"username"];
    NSString* password = [map objectForKey:@"password"];
    NSString* name = [map objectForKey:@"name"];
    NSString* key = [map objectForKey:@"key"];
    user.username = username;
    user.password = password;
    user.name = name;
}

@end
