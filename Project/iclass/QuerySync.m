//
//  QuerySync.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QuerySync.h"

@implementation QuerySync

- (void) queryWithPath: (NSString *)path withProcessor: (id <ResponseProcessor>) aProcessor {
    self.processor = aProcessor;
    
    NSString *base = @"http://ec2-122-248-192-192.ap-southeast-1.compute.amazonaws.com";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", base, path]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    [request setHTTPMethod:@"GET"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
}

@end
