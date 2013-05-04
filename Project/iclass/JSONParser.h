//
//  JSONParser.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

-(id)parse: (NSMutableData *)data;
-(id)toEntity: (NSMutableDictionary *)map;

@end
