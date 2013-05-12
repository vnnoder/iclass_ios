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
    NSDictionary *obj = nil;
    if([map objectForKey:@"success"]){
        for (NSString *key in map) {
            if (![key isEqualToString:@"success"]){
                obj = [map objectForKey:key];
                break;
            }
        }
    }else{
        obj = map;
    }
    
    return [self fromNSDictionary:obj];
}


- (NSArray*) deserializeArray: (NSData*)jsonData{
 
//    NSArray *map = [self parseJSONData:jsonData];
    NSArray *array = nil;
    id map = [self parseJSONData:jsonData];
    if ([map isKindOfClass:[NSArray class]]){
        array = map;
    }else if([[map objectForKey:@"success"] isEqualToString:@"true"]){
        for (NSString *key in map) {
            if (![key isEqualToString:@"success"]){
                array = [map objectForKey:key];
                break;
            }
        }
        
    }
  
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSDictionary *item in array) {
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
