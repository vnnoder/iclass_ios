//
//  Session.h
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Session : NSObject

@property (strong) NSString *name;
@property (strong) NSString *description;
@property (strong) NSDate *startDate;
@property (strong) NSDate *endDate;
@property (strong) NSString *status;
@property (strong) NSString *createdAt;
@property (strong) NSString *updatedAt;
@property (strong) User *owner;

@end
