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
#import "JSON.h"
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
        
        // save to user defaults
        [[NSUserDefaults standardUserDefaults] setValue:loginId forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setValue:pwd forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] setValue:[info token] forKey:@"auth_token"];

        [[NSUserDefaults standardUserDefaults] synchronize];
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
    
    //clean user defaults
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"auth_token"];

    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)updateDeviceToken:(NSString*)token{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:token forKey:@"device_token"];
    NSData* jsonData = [HttpQuery querySyncWithPath:@"/api/update_device_token"
                                         withMethod:@"POST"
                                         withParams:dict];
    
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSDictionary* result =  [json JSONValue];
    NSString *success = [result objectForKey:@"success"];
    if ([success isEqualToString:@"false"]){
        NSLog(@"Update Device Token failed. msg: %@", [result objectForKey:@"message"]);
    }
    
    /**
     response: 
     {"success":"true","device_token":{"created_at":"2013-05-12T14:09:29Z","device_token":"790dfc8982e59f7936db182c2ccda5d3707d5034c7dac8e001bfae5bc73403fd","id":1,"updated_at":"2013-05-12T14:09:29Z","user_id":1}}
     
     */

}
@end
