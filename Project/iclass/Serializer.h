//
//  Serializer.h
//  iclass
//
//  Created by Ma Xiangmei on 5/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Serializer : NSObject

// construct the object from json data
// used to parse result from HTTP request
- (id) deserialize: (NSData*)jsonData;

// construct array of object from json data
- (NSArray*) deserializeArray: (NSData*)jsonData;

// subclass need to implement the method for the specific entity
// use to send HTTP request
- (NSDictionary *) toNSDictionary:(id)entity;

// subclass need to implement the method for the specific entity
- (id) fromNSDictionary:(NSDictionary*) dict;

@end
