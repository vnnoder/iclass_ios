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
@end
