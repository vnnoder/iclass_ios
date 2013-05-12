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
#import "SessionSerializer.h"
#import "Question.h"
#import "QuestionService.h"
#import "UserService.h"
#import "LoginInfo.h"
#import "SessionService.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        UserService *service = [[UserService alloc]init];
        LoginInfo *info = [service singInWithLoginId:@"michael" password:@"michael"];
        NSLog(@"%@", [[info user]fullName]);
        
        SessionService *sessionSer= [[SessionService alloc]init];
        NSArray *list = [sessionSer list];
//        NSLog(@"%@", [[info user]fullName]);
        for (Session *item in list) {
            NSLog(@"%@", item.title);
        }
       
    }
}