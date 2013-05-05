//
//  QueryUtil.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QueryUtil.h"

@implementation QueryUtil
+ (NSDictionary *)request:(NSString*)path
                   method:(NSString *)method
                   params:(NSDictionary *)params
                     host:(NSString *)host
                withError:(NSError **)error

{
    // generate query string
    NSMutableString *queryString = [[NSMutableString alloc] initWithString:@"?"];
    for (NSString* key in params) {
        // Encore the key
        NSString *encodedKey = (__bridge id)CFURLCreateStringByAddingPercentEscapes(
                                                                                    NULL,
                                                                                    (CFStringRef)key,
                                                                                    NULL,
                                                                                    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                    kCFStringEncodingUTF8);
        
        // Encode the value
        NSString *encodedValue = (__bridge id)CFURLCreateStringByAddingPercentEscapes(
                                                                                      NULL,
                                                                                      (CFStringRef)[params objectForKey:key],
                                                                                      NULL,
                                                                                      (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                      kCFStringEncodingUTF8);
        
        // Append to querystring
        [queryString appendString:[NSString stringWithFormat:@"%@=%@&", encodedKey, encodedValue]];
    }
    
    // Init request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", host, path, queryString]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    if ([method isEqualToString:@"POST"]) {
        [request setHTTPBody:[[queryString substringFromIndex:1] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    // Set method
    [request setHTTPMethod:method];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    // Launch
    NSURLResponse *response = [[NSURLResponse alloc] init];
    NSData *result          = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:error];
    
    // Handle result
    if (result != nil) {
        // Successful
        NSDictionary *json= [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:error];
        
        // Handling the response
        if (json != nil) {
            // Return received data
            return json;
        } else {
            NSLog(@"JSON parsing failed");
        }
    }
    
    // If arriving here, then there was an issue
    return nil;
}
@end
