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

int main(int argc, char *argv[])
{
    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        QuestionService *service = [[QuestionService alloc]init];
        NSArray *array = [service list];
        NSString *title = [[array objectAtIndex:0] title];
        NSLog(@"%@", title);
    }
}