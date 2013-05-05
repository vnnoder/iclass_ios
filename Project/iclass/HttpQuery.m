//
//  QuerySync.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "HttpQuery.h"

@implementation HttpQuery

+ (NSData*) querySyncWithPath: (NSString *)path
                     withMethod:(NSString *)method
                     withParams: (NSMutableDictionary *)paramMap{
        
    NSString *base = @"http://ec2-122-248-192-192.ap-southeast-1.compute.amazonaws.com";
    NSString *urlString = [base stringByAppendingString:path];
    
    NSString *paramString = [[NSString alloc]init];
    if(paramMap != nil){
        
        for (NSString * name in [paramMap allKeys]) {
            NSString * value = [paramMap objectForKey:name];
            paramString = [paramString stringByAppendingFormat:@"%@=%@&", [self encodeURIComponent:name], [self encodeURIComponent:value]];
        }
    }
    NSLog(@"Params: %@", paramString);

    BOOL isGETmethod = [@"GET"isEqualToString: method];
    
    
    if(isGETmethod){
        urlString = [urlString stringByAppendingString:@"?"];
        urlString = [urlString stringByAppendingString:paramString];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    [request setTimeoutInterval:30.0f];
    [request setHTTPMethod:method];
    
    if(!isGETmethod){
        NSData *postBody = [paramString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postBody length]];
        [request setHTTPBody:postBody];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    }

    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSLog(@"Synchronous request start. URL = %@, Method= %@", urlString, method);
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if ([data length] == 0 && error == nil){
        NSLog(@"No Data was returned");
    }else if (error != nil){
        NSLog(@"Error happend = %@", error);
    }
    
//    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return data;

}


+ (NSData*) querySyncWithPath: (NSString *)path
                     withMethod:(NSString *)method
                     withBody:(NSData *)postBody {
    
    NSString *base = @"http://ec2-122-248-192-192.ap-southeast-1.compute.amazonaws.com";
    NSString *urlString = [base stringByAppendingString:path];
    
    NSLog(@"Cotent body: %@", [NSString stringWithUTF8String:[postBody bytes]]);
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    [request setTimeoutInterval:30.0f];
    [request setHTTPMethod:method];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postBody length]];
    [request setHTTPBody:postBody];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSLog(@"Synchronous request start. URL = %@, Method= %@", urlString, method);
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if ([data length] == 0 && error == nil){
        NSLog(@"No Data was returned");
    }else if (error != nil){
        NSLog(@"Error happend = %@", error);
    }
    
//    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return data;
    
}


//+ (void) queryAsyncWithPath: (NSString *)path
//                 withMethod:(NSString *)method
//            withParams: (NSDictionary *)paramMap
//          withCallback:(void (^)(NSString *))handler{
//    
//    NSString *base = @"http://ec2-122-248-192-192.ap-southeast-1.compute.amazonaws.com";
//    NSString *urlString = [base stringByAppendingString:path];
//   
//    NSString *paramString = [[NSString alloc]init];
//    if(paramMap != nil){
//        paramString = [paramString stringByAppendingString:@"?"];
//        for (NSString * name in [paramMap allKeys]) {
//            NSString * value = [paramMap objectForKey:name];
//            paramString = [paramString stringByAppendingFormat:@"%@=%@&", [self encodeURIComponent:name], [self encodeURIComponent:value]];
//        }
//    }
//    
//    BOOL isGETmethod = [@"GET"isEqualToString: method];
//    
//    if(isGETmethod){
//        urlString = [urlString stringByAppendingString:paramString];
//    }
//    
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
//    [request setTimeoutInterval:30.0f];
//    [request setHTTPMethod:method];
//    
//    if(!isGETmethod){
//        [request setHTTPBody:[paramString dataUsingEncoding:NSUTF8StringEncoding]];
//    }
//    
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    
//    NSLog(@"ASynchronous request start. URL = %@, Method= %@", urlString, method);
//
//   [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//       NSLog(@"No Data was returned");
//
//       if ([data length] == 0 && error == nil){
//            NSLog(@"No Data was returned");
//        }else if (error != nil){
//            NSLog(@"Error happend = %@", error);
//        }
//        
//        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        handler(json);
//    }];
//    
//}


+ (NSString *)encodeURIComponent:(NSString *)string
{
    NSString *s = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}

+ (NSString *)decodeURIComponent:(NSString *)string
{
    NSString *s = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}

@end
