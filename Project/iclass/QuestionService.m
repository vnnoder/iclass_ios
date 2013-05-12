//
//  QuestionService.m
//  iclass
//
//  Created by Ma Xiangmei on 12/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QuestionService.h"
#import "QuestionSerializer.h"
#import "HttpQuery.h"

@implementation QuestionService

- (id) init{
    return [super initWithPath:@"/questions" withSerializer:[[QuestionSerializer alloc]init]];
}

///api/talks/1/questions
- (NSArray*) listQuestionBySession: (int)sessionId{
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/questions", sessionId]
                                                                    withMethod:@"GET"
                                                                    withParams:nil];
    
    return [self.serializer deserializeArray:jsonData];
}

///api/talks/1/questions/5/vote
- (id)updateVoteForQuestion:(int)questionId inSession: (int)sessionId{
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/questions/%i/vote", questionId, sessionId]
                                         withMethod:@"POST"
                                         withParams:nil];
    
    return [self.serializer deserializeArray:jsonData];
}

@end
