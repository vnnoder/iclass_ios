//
//  QuerySync.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseProcessor.h"

@interface QuerySync : NSObject
    @property(weak) id <ResponseProcessor> processor;
@end
