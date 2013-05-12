//
//  Util.h
//  iclass
//
//  Created by Ma Xiangmei on 6/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+(BOOL)isNull:(NSString*)string;
+(NSDate*)parse:(NSString *)dataStr;
+ (void)nofify:(NSString* )error;
@end
