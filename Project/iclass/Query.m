//
//  Query.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "Query.h"

@implementation Query

@synthesize buffer, conn, processor;
NSMutableData *a;

- (void) queryWithPath: (NSString *)path withProcessor: (id <ResponseProcessor>) aProcessor {
    self.processor = aProcessor;
    
    NSString *base = @"http://ec2-122-248-192-192.ap-southeast-1.compute.amazonaws.com";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", base, path]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    [request setHTTPMethod:@"GET"];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn){
        NSLog(@"Request start for url: %@", url);
        self.buffer = [NSMutableData data];
    }else{
        NSLog(@"Request failed to start for url: %@", url); 
    }

}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *) response {
	[buffer setLength:0];
}
-(void) connection:(NSURLConnection *) connection didReceiveData:(NSData *) data {
	[buffer appendData:data];
}
-(void) connection:(NSURLConnection *) connection didFailWithError:(NSError *) error {
    NSLog(@"Request Error: %@", [error description]);
    [processor processError];
    
}
-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
    NSLog(@"Request Done with bytes %d", [buffer length]);
    [processor processResponse:buffer];
}



@end
