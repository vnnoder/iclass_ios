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

-(id) initInOfflineMode
{
    self = [super init];
    return self;
}

-(id) init {
    self = [super init];
    qsAudience = [[QuestionService alloc]init];
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

-(void) getExistingQuestionsFromFile
{
    NSLog(@"Offline mode");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    NSString *filename = [plistPath1 stringByAppendingPathComponent:@"Question"];
    
    NSMutableArray *ud = [NSKeyedUnarchiver unarchiveObjectWithFile: filename];
    self.QuestionListData = [NSArray  arrayWithArray:ud];
    for (Question *q in self.QuestionListData) {
        NSLog(@"title is:%@ ",[q title]);
    }
}

-(void) getExistingQuestions:(int)sessionId{

    
    self.QuestionListData = [qsAudience listQuestionBySession:sessionId];
    if (self.QuestionListData == nil) {
        NSLog(@"Offline mode");
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *plistPath1 = [paths objectAtIndex:0];
        NSString *filename = [plistPath1 stringByAppendingPathComponent:@"Question"];
        
        NSMutableArray *ud = [NSKeyedUnarchiver unarchiveObjectWithFile: filename];
        self.QuestionListData = [NSArray  arrayWithArray:ud];
        for (Question *q in self.QuestionListData) {
            NSLog(@"title is:%@ ",[q title]);
        }
    }
    NSLog(@"sessid = %d, question count =%d", sessionId, [self.QuestionListData count]);

}
@end
