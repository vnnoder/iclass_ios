//
//  LoginModel.h
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfo : NSObject

@property (strong) NSString *fullName;
@property (strong) NSString *token;
@property (strong) NSString *error;
@property BOOL success;

@end
