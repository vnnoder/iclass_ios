//
//  Query.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseProcessor.h"

@interface QueryAsync : NSObject
    @property(strong, nonatomic) NSMutableData *buffer;
    @property(strong, nonatomic) NSURLConnection *conn;
    @property(weak) id <ResponseProcessor> processor;



@end
