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
#import "Session.h"
#import "SessionService.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        SessionService *service = [[SessionService alloc]init];
        NSArray *array = [service list];
        NSString *title = [[array objectAtIndex:0] title];
        NSLog(@"%@", title);
    }
}