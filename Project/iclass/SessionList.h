//
//  SessionList.h
//  iclass
//
//  Created by Wiely Rabin on 9/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Session;

@interface SessionList : NSObject{
    NSMutableArray *DataList;
}

@property (nonatomic, strong) NSMutableArray *DataList;
- (void) addDummySession;
- (void) addSession:(Session *) aSession;
@end
