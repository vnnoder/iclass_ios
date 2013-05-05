//
//  Serializer.h
//  iclass
//
//  Created by Ma Xiangmei on 5/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Serializer : NSObject
+ (NSData*) serialize: (id)entity;
+ (id) deserialize: (NSData*)jsonData;
+ (NSDictionary *) toNSDictionary:(id)entity;
+ (id) fromNSDictionary:(NSDictionary*) dict;

@end
