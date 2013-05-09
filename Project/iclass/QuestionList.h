//
//  QuestionList.h
//  iclass
//
//  Created by MagicStudio on 13-5-4.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;
@interface QuestionList : NSObject

@property (strong, nonatomic) NSMutableArray *QuestionListData;
-(void)addQuestion:(Question *) question;
-(void)deleteQuestion:(Question *) question;
-(void)sortByUpdateTime;
-(void)sortByVote;
+(QuestionList *) getExistingQuestions;
@end
