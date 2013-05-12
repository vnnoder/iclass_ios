//
//  ServiceAPI.m
//  iclass
//
//  Created by Ma Xiangmei on 4/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "ServiceAPI.h"
#import "HttpQuery.h"
#import "Entity.h"
#import "User.h"

@implementation ServiceAPI
@synthesize path;

static NSString* token;
static User* currentUser;

+ (NSString *) pathPostfix{
    return @".json";
}

+ (NSString*) authToken{
    { @synchronized(self) { return token; } }
}
+ (void) setAuthToken:(NSString*)val{
    { @synchronized(self) { token = val; } }
}

+ (User*) currentUser{
    { @synchronized(self) { return currentUser; } }
}
+ (void) setCurrentUser:(User *)val{
    { @synchronized(self) { currentUser = val; } }
}


- (id) initWithPath: (NSString *) aPath
     withSerializer: (Serializer *)aSerializer{
    self = [super init];
    
    if(self){
        self.path = aPath;
        self.serializer = aSerializer;
    }
    return self;
}

- (id) create:(id)entity{
    NSData* jsonData = [HttpQuery querySyncWithPath:[self.path stringByAppendingFormat:@"%@", [ServiceAPI pathPostfix]]
                      withMethod:@"POST"
                      withParams:[self.serializer toNSDictionary:entity]];
    return [self.serializer deserialize:jsonData];
    
}
- (void) remove:(int)key{
   [HttpQuery querySyncWithPath:[self.path stringByAppendingFormat:@"/%d%@", key, [ServiceAPI pathPostfix]]
                     withMethod:@"DELETE"
                       withParams:nil];
   
}
- (void) update:(id)obj{
    Entity *entity = (Entity *)obj;
    [HttpQuery querySyncWithPath:[self.path stringByAppendingFormat:@"/%d%@", entity.key, [ServiceAPI pathPostfix]]
                      withMethod:@"PUT"
                        withParams:[self.serializer toNSDictionary:entity]];
}

- (id) get:(int)key{
    NSData* jsonData = [HttpQuery querySyncWithPath:[self.path stringByAppendingFormat:@"/%d%@", key, [ServiceAPI pathPostfix]]
                                         withMethod:@"GET"
                                           withParams:nil];
    return [self.serializer deserialize:jsonData];
}

- (NSArray*) list{
    NSData* jsonData = [HttpQuery querySyncWithPath:[self.path stringByAppendingFormat:@"%@", [ServiceAPI pathPostfix]]
                                         withMethod:@"GET"
                                           withParams:nil];
    return [self.serializer deserializeArray:jsonData];
}


@end
