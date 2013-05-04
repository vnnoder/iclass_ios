//
//  ResponseProcessor.h
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ResponseProcessor <NSObject>
- (void) processResponse:(NSMutableData *)data;


- (void) processError;
@end
