//
//  QuestionList.h
//  iclass
//
//  Created by MagicStudio on 13-5-4.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;
@class QuestionService;
@interface QuestionList : NSObject
{
    QuestionService *qsAudience;
}
@property (strong, nonatomic) NSArray *QuestionListData;
@property (nonatomic, strong) QuestionService *qsAudience;
//-(void)addQuestion:(Question *) question;
//-(void)deleteQuestion:(Question *) question;
-(void)sortByUpdateTime;
-(void)sortByVote;
-(void) getExistingQuestions:(int)sessionId;

@end
