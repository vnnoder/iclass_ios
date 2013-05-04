//
//  User.h
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface User : Entity

@property (strong) NSString *username;
@property (strong) NSString *password;
@property (strong) NSDate *createdAt;
@property (strong) NSDate *updatedAt;
@property (strong) NSString *name;

@end
