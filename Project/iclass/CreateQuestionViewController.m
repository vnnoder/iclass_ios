//
//  CreateQuestionViewController.m
//  iclass
//
//  Created by MagicStudio on 13-5-12.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import "CreateQuestionViewController.h"
#import "QuestionListViewController.h"
#import "QuestionService.h"
#import "QuestionList.h"
#import "Question.h"
@interface CreateQuestionViewController ()

@end

@implementation CreateQuestionViewController
@synthesize questionTitle,qustionDetail, AskBtn,currentSession,qsService;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

        if ([segue
             .destinationViewController isKindOfClass:[QuestionListViewController class]]) {
            QuestionListViewController *questionListViewController = segue.destinationViewController;
            Question *newQustion = [[Question alloc]init];
            NSLog(@"create question fo session id is  = %d", currentSession.key);
            newQustion.sessionId = currentSession.key;
            newQustion.title = questionTitle.text;
            newQustion.detail = qustionDetail.text;
            [[[questionListViewController questionList]qsAudience] create:newQustion];
            questionListViewController.currentSesseion = currentSession;
        }

}
@end
