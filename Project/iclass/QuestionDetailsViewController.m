//
//  QuestionDetailsViewController.m
//  iclass
//
//  Created by Wiely Rabin on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QuestionDetailsViewController.h"
#import "Question.h"
#import "QuestionService.h"
@interface QuestionDetailsViewController ()

@end

@implementation QuestionDetailsViewController
@synthesize string, QuestionDescription,currentSesseion,currentQuestion, VoteBtn, qsService;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    /*
    if (currentQuestion.voted) {
        VoteBtn.titleLabel.text = @"Unvote";
    }
    else{
        VoteBtn.titleLabel.text = @"Vote";
    }
     */
    QuestionDescription.text = currentQuestion.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)VoteAction:(id)sender {
    NSLog(@"qk = %d, sessi=%d", [currentQuestion key], [currentSesseion key]);
    [qsService updateVoteForQuestion:[currentQuestion key] inSession:[currentSesseion key]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
