//
//  Question.h
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Session.h"
#import "Entity.h"

@interface Question : Entity

@property (strong) NSString *title;
@property (strong) NSString *detail;
@property (strong) User *owner;
@property (strong) Session *session;
@property (strong) NSDate *createdAt;
@property (strong) NSDate *updatedAt;

@end
