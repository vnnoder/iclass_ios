//
//  QuestionService.h
//  iclass
//
//  Created by Ma Xiangmei on 12/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceAPI.h"
@interface QuestionService : ServiceAPI
- (NSArray *)listQuestionBySession: (int)sessionId;
- (id)updateVoteForQuestion:(int)questionId inSession: (int)sessionId;

@end
