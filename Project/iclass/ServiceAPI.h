//
//  ServiceAPI.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QueryAsync.h"
@interface ServiceAPI : NSObject

 @property(strong, nonatomic) NSString *path;

- (id) create:(id)entity WithCallbackBlock:(void (^)(id))callbackBlock;
- (void) remove:(int)key WithCallbackBlock:(void (^)(id))callbackBlock;
- (void) update:(id)entity WithCallbackBlock:(void (^)(id))callbackBlock;
- (void) get:(int)key WithCallbackBlock:(void (^)(id))callbackBlock;

@end
