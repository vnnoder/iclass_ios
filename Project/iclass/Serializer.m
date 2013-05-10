//
//  Serializer.m
//  iclass
//
//  Created by Ma Xiangmei on 5/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "Serializer.h"
#import "JSON.h"

@implementation Serializer
- (NSData*) serialize: (id)user{
    NSDictionary *dict = [self toNSDictionary:user];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil){
        NSLog(@"Successfully serialized the User with key %@", [user key]);
    }else{
        NSLog(@"Error happens: %@", error);
    }
    
    return jsonData;
    
}

- (id) deserialize: (NSData*)jsonData{
    NSDictionary *map = [self parseJSONData:jsonData];
    return [self fromNSDictionary:map];
}


- (NSArray*) deserializeArray: (NSData*)jsonData{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSArray *map = [self parseJSONData:jsonData];
    
    for (NSDictionary *item in map) {
        [result addObject:[self fromNSDictionary:item]];
    }
    
    return result;
}

- (NSDictionary *) toNSDictionary:(id)entity{
    return nil;
}

- (id) fromNSDictionary:(NSDictionary *) dict{
    return nil;
}


- (id) parseJSONData: (NSData*) data{
    if (data.length == 0) {
        
        return nil;
    }

    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [json JSONValue];
}
@end
