//
//  ServiceAPI.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Serializer.h"

// provid basic CRUD method
@interface ServiceAPI : NSObject

 @property(strong, nonatomic) NSString *path;
 @property(strong, nonatomic) Serializer *serializer;

- (id) create:(id)entity;
- (void) remove:(int)key;
- (void) update:(id)entity;
- (id) get:(int)key;
- (NSArray*) list;

/**
 sub class must provide its own path and serializer
 */
- (id) initWithPath: (NSString *) aPath
     withSerializer: (Serializer *)aSerializer;

+ (NSString *) pathPostfix;
@end
