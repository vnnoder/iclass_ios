//
//  main.m
//  iclass
//
//  Created by Wiely Rabin on 28/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "HttpQuery.h"


int main(int argc, char *argv[])
{
    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        
        // get question
       NSData* response =  [HttpQuery querySyncWithPath:@"/talks.json" withMethod:@"GET" withParams:nil];
//        NSLog(@"=====> %@", response);
//
       NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@"description" forKey:@"talk[description]"];
        [params setObject:@"title" forKey:@"talk[title]"];
        [params setObject:@"1" forKey:@"talk[user_id]"];
        
     //
        
        response =  [HttpQuery querySyncWithPath:@"/talks.json" withMethod:@"POST" withParams:params];
        NSString *json = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

        NSLog(@"=====> %@", json);
//        NSError *error = [[NSError alloc]init];
        
//        [QueryUtil request:@"/talks.json" method:@"POST" params:params host:@"host" withError:error];
    }
}