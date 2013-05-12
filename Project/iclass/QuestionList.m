//
//  QuestionList.m
//  iclass
//
//  Created by MagicStudio on 13-5-4.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//
#import "User.h"
#import "QuestionList.h"
#import "Question.h"
#import "QuestionService.h"
@implementation QuestionList
@synthesize QuestionListData, qsAudience;

-(id) init {
    self = [super init];
    //QuestionListData = [[NSMutableArray alloc] initWithObjects:@"Class ID 001",@"Class ID 002", nil];
    return self;
}
/*
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
*/
-(void) getExistingQuestions:(int)sessionId{
    //TODO, this function should call webservice to get the current question lists
    /*
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    [formate setTimeZone:[NSTimeZone defaultTimeZone]];
    
    [formate setDateFormat:(@"yyyy-MM-dd HH:mm:ss")];
    /*-(id) initWithTitle:(NSString *)title andDetail:(NSString*)detail andOwener:(User*)owner andSession:(Session*)session andCreateData:(NSDate*)createDate andUpdateDate:(NSDate*)updateDate andVoteCount:(NSInteger)voteCount andIsVoted:(BOOL)voted;*/
    /*
    User *user = [[User alloc]init];
    Session *session = [[Session alloc]init];
    */
    QuestionList* questionList = [[QuestionList alloc] init];
    questionList.QuestionListData = [qsAudience listQuestionBySession:sessionId];
    /*
    [questionList addQuestion:[[Question alloc]initWithTitle:@"FuzzySystem" andDetail:@"How to build a fuzzy system" andOwener:user andSession:session andCreateData:[formate dateFromString:@"2013-05-10 16:30:22"] andUpdateDate:[formate dateFromString:@"2013-05-10 16:40:22"] andVoteCount:3 andIsVoted:TRUE]];
    
    [questionList addQuestion:[[Question alloc]initWithTitle:@"Neural Network" andDetail:@"How to build a NN system" andOwener:user andSession:session andCreateData:[formate dateFromString:@"2013-05-11 16:30:22"] andUpdateDate:[formate dateFromString:@"2013-05-11 16:40:22"] andVoteCount:100 andIsVoted:TRUE]];
    
    [questionList addQuestion:[[Question alloc]initWithTitle:@"WALD" andDetail:@"How to build a iphone" andOwener:user andSession:session andCreateData:[formate dateFromString:@"2013-05-12 16:30:22"] andUpdateDate:[formate dateFromString:@"2013-05-12 16:40:22"] andVoteCount:66 andIsVoted:TRUE]];
     */
}
@end
