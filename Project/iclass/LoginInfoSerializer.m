//
//  LoginInfoSerializer.m
//  iclass
//
//  Created by Ma Xiangmei on 6/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "LoginInfoSerializer.h"
#import "LoginInfo.h"
@implementation LoginInfoSerializer
/**
 Example response:
 {"success":true,"auth_token":"cMWpy4tq3yy25ikLs9i4","username":"test"}
 
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
    BOOL success = [[dict objectForKey:@"sucess"]boolValue];
    entity.success = success;
    
    if(success){
        entity.fullName = [dict objectForKey:@"title"];
        entity.token = [dict objectForKey:@"auth_token"];
    }else{
        entity.error = [dict objectForKey:@"message"];
        
    }
    
    return entity;
}
@end
