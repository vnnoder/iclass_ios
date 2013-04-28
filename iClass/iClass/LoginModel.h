//
//  LoginModel.h
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

-(BOOL) verifyUser:(NSString*) userID andPassword:(NSString*)password;

-(BOOL) loginAsGuest;

@end
