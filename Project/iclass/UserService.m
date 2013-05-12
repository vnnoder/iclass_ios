//
//  UserService.m
//  iclass
//
//  Created by Ma Xiangmei on 6/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "UserService.h"
#import "HttpQuery.h"
#import "UserSerializer.h"
#import "LoginInfo.h"
#import "LoginInfoSerializer.h"
#import "Util.h"
@implementation UserService

- (id) init{
    return [super initWithPath:@"/api/users" withSerializer:[[UserSerializer alloc]init]];
}


/**
 POST to ec2-122-248-192-192.ap-southeast-1.compute.amazonaws.com/api/sign_in
 with the following fields:
 userlogin[username]
 userlogin[password]
 */

-(id)singInWithLoginId: (NSString *)loginId password: (NSString *)pwd{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:loginId forKey:@"user_login[username]"];
    [dict setValue:pwd forKey:@"user_login[password]"];
    
    NSData* jsonData = [HttpQuery querySyncWithPath:@"/api/sign_in"
                                         withMethod:@"POST"
                                         withParams:dict];
//    NSLog(@"Response from login: %@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    LoginInfoSerializer *serializer =  [[LoginInfoSerializer alloc]init];
    LoginInfo *info = [serializer deserialize:jsonData];
    if([info success]){
        [UserService setAuthToken:[info token]];
        [UserService setCurrentUser:[info user]];
        return info;
    }else{
        [Util nofifyError:[info error]];
        return nil;
    
    }
}
-(id)singInwithToken{
    return nil;
}
-(void)singOut{
    [UserService setAuthToken:nil];
    [UserService setCurrentUser:nil];
}
@end
