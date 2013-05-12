//
//  LoginInfoSerializer.m
//  iclass
//
//  Created by Ma Xiangmei on 6/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "LoginInfoSerializer.h"
#import "LoginInfo.h"
#import "UserSerializer.h"
#import "User.h"
#import "JSON.h"
@implementation LoginInfoSerializer
/**
 Example response:
 "success":true,"auth_token":"Xq9xmerkwUAJEqDYzyFJ","user":"{\"created_at\":\"2013-05-05T03:07:08Z\",\"email\":\"\",\"id\":1,\"name\":null,\"password\":null,\"updated_at\":\"2013-05-08T17:52:36Z\",\"username\":\"test\"}"}
 
 Failure codes:
 
 422:
 
 {:success=>false, :message=>"missing user_login parameter"}
 
 401:
 
 {:success=>false, :message=>"Error with your login or password"}
 
 */
- (NSDictionary *) toNSDictionary:(id)entity{
    //NOT supported
    return nil;
}

- (id) fromNSDictionary:(NSDictionary *) dict{
    // check whether success
    LoginInfo *entity = [[LoginInfo alloc]init];
    NSString *token = [dict objectForKey:@"auth_token"];
    if(token){
        NSDictionary * userDict = [dict objectForKey:@"user"];
        User *user = [[[UserSerializer alloc]init]fromNSDictionary:userDict];
        entity.user = user;
        entity.token = token;
        entity.success = YES;
    }else{
        entity.error = [dict objectForKey:@"message"];
        entity.success=NO;
    }
    
    return entity;
}

- (id) deserialize:(NSData *)jsonData{
    NSDictionary *map = [self parseJSONData:jsonData];
    return [self fromNSDictionary:map];
}
@end
