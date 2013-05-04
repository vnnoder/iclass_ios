//
//  ServiceAPI.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "ServiceAPI.h"

@implementation ServiceAPI
@synthesize path;


- (id) initWithPath: (NSString *) aPath{
    self = [super init];
    if(self){
        self.path = aPath;
    }
    return self;
}



@end
