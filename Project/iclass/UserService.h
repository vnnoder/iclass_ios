//
//  UserService.h
//  iclass
//
//  Created by Ma Xiangmei on 6/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceAPI.h"
@interface UserService : ServiceAPI
-(id)singInWithLoginId: (NSString *)loginId password: (NSString *)pwd;
-(id)singInwithToken;
-(void)singOut;
@end
