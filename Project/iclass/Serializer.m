//
//  Serializer.m
//  iclass
//
//  Created by Ma Xiangmei on 5/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "Serializer.h"

@implementation Serializer
+ (NSData*) serialize: (id)user{
    NSDictionary *dict = [self toNSDictionary:user];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil){
        NSLog(@"Successfully serialized the User with key %d", [user key]);
    }else{
        NSLog(@"Error happens: %@", error);
    }
    
    return jsonData;
    
}

+ (User*) deserialize: (NSData*)jsonData{
    NSDictionary *map = [self parseJSONData:jsonData];
    return [self fromNSDictionary:map];
}


+ (NSArray*) deserializeArray: (NSData*)jsonData{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSArray *map = [self parseJSONData:jsonData];
    
    for (NSDictionary *item in map) {
        [result addObject:[self fromNSDictionary:item];
    }
    
    return result;
}

+ (NSDictionary *) toNSDictionary:(id)entity{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:[user fullName] forKey:@"user[name]"];
    [dict setValue:[user loginId] forKey:@"user[username]"];
    [dict setValue:[user email] forKey:@"user[email]"];
    [dict setValue:[user password] forKey:@"user[password]"];
    retrn dict;
}

+ (id) fromNSDictionary:(NSDictionary * dict){
    User *entity = [[User alloc]init];
    entity.loginId = [map objectForKey:@"username"];
    entity.fullName = [map objectForKey:@"name"];
    enitty.key = [map objectForKey: @"id"];
    return entity;
}


+ (id) parseJSONData: (NSData*) data{
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [json JSONValue];
}
@end
