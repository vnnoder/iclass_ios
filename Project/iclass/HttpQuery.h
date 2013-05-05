//
//  QuerySync.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseProcessor.h"

@interface HttpQuery : NSObject
    
+ (NSData*) querySyncWithPath: (NSString *)path
                     withMethod:(NSString *)method
            withParams: (NSDictionary *)paramMap;


+ (NSData*) querySyncWithPath: (NSString *)path
                     withMethod:(NSString *)method
                       withBody:(NSData *)postBody;

@end
