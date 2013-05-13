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
#import "Question.h"

@implementation QuestionService

- (id) init{
    return [super initWithPath:@"/questions" withSerializer:[[QuestionSerializer alloc]init]];
}


/*
 
 POST to http://ec2-122-248-192-192.ap-southeast-1.compute.amazonaws.com/api/talks/1/questions
 with the following params:
 {"question[title]" => "Could you explain more about Wimax?", "question[detail]" => "","auth_token" => "jp77xiw3DmvYX2v4iJeH"}
 */
- (id)create:(id)entity{
    Question *que = (Question *)entity;
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/questions", [que sessionId]]
                                         withMethod:@"POST"
                                         withParams:[self.serializer toNSDictionary:entity]];
    return [self.serializer deserialize:jsonData];
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
    NSData* jsonData = [HttpQuery querySyncWithPath:[NSString stringWithFormat:@"/api/talks/%i/questions/%i/vote",  sessionId, questionId]
                                         withMethod:@"POST"
                                         withParams:nil];
    
    return [self.serializer deserialize:jsonData];
}

@end
