//
//  QueryUtil.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryUtil : NSObject
+ (NSDictionary *)request:(NSString*)path
                   method:(NSString *)method
                   params:(NSDictionary *)params
                     host:(NSString *)host
                withError:(NSError **)error;
@end
