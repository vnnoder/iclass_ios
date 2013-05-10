//
//  LoginModel.h
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

- (BOOL) verifyUser:(NSString *) userID andPassword:(NSString *) password;

@end
