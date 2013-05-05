//
//  Serializer.h
//  iclass
//
//  Created by Ma Xiangmei on 5/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Serializer : NSObject
// serializ the object to json data
+ (NSData*) serialize: (id)entity;

// construct the object from json data
+ (id) deserialize: (NSData*)jsonData;

// subclass need to implement the methodåÅ
+ (NSDictionary *) toNSDictionary:(id)entity;

// subclass need to implement the methodåÅ
+ (id) fromNSDictionary:(NSDictionary*) dict;

@end
