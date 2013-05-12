//
//  QuestionService.m
//  iclass
//
//  Created by Ma Xiangmei on 12/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QuestionService.h"
#import "QuestionSerializer.h"

@implementation QuestionService

- (id) init{
    return [super initWithPath:@"/questions" withSerializer:[[QuestionSerializer alloc]init]];
}
- listQuestionBySession: (int)sessionId{
    NSData* jsonData = [HttpQuery querySyncWithPath:[self.path stringByAppendingFormat:@"%@", [ServiceAPI pathPostfix]]
                                         withMethod:@"POST"
                                         withParams:[self.serializer toNSDictionary:entity]];
    return [self.serializer deserialize:jsonData];
}

@end
