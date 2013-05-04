//
//  QuestionList.m
//  iclass
//
//  Created by MagicStudio on 13-5-4.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import "QuestionList.h"
#import "Question.h"
@implementation QuestionList
@synthesize QuestionListData;

-(id) init {
    self = [super init];
    QuestionListData = [[NSMutableArray alloc] initWithObjects:@"Class ID 001",@"Class ID 002", nil];
    return self;
}

-(void)addQuestion:(Question *) question
{
    [QuestionListData addObject:question];
}
-(void)deleteQuestion:(Question *) question
{
    [QuestionListData removeObject:question];
}

-(void)sortByUpdateTime
{
    [QuestionListData sortUsingSelector:@selector(compareUpdateDate:)];
}
-(void)sortByVote
{
    [QuestionListData sortUsingSelector:@selector(compareVote:)];
}
@end
