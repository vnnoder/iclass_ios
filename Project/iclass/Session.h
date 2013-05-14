//
//  Session.h
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Entity.h"
@interface Session : Entity

@property (strong) NSString *title;
@property (strong) NSString *description;
@property (strong) NSDate *startDate;
@property (strong) NSDate *endDate;
@property (strong) NSString *status;
@property (strong) NSString *passcode;
@property (strong) NSString *location;
@property NSInteger ownerId;

@end
