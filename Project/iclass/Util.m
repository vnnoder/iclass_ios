//
//  Util.m
//  iclass
//
//  Created by Ma Xiangmei on 6/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "Util.h"

@implementation Util
+ (BOOL) isNull: (NSString *)string{
    if (string == (id)[NSNull null] || string.length == 0 ){
        return true;
    }
    
    return false;
}


+(NSDate*)parse:(NSString *)dateStr{
//    NSString *dateStr = @"Tue, 25 May 2010 12:53:58 +0000";
//    2013-05-11T18:31:01Z
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    return date;
}


+ (void)nofify:(NSString* )error{
    
}
@end
