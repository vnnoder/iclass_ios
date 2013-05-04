//
//  JSONParser.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "JSONParser.h"
#import "JSON.h"

@implementation JSONParser



-(id)parse: (NSMutableData *)data{
    NSMutableString *jsonString = [[NSMutableString alloc] initWithBytes:[data mutableBytes] length:[data length] encoding:NSUTF8StringEncoding];
    
    NSDictionary *results = [jsonString JSONValue];
    return [self toEntity: results];
    
}

-(id)toEntity: (NSDictionary *)map{
    return nil;
}
@end
