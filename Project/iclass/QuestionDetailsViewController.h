//
//  QuestionDetailsViewController.h
//  iclass
//
//  Created by Wiely Rabin on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Session;
@class Question;
@class QuestionService;
@interface QuestionDetailsViewController : UIViewController <UISearchDisplayDelegate>


@property (weak, nonatomic) IBOutlet UITextView *QuestionDescription;
@property (weak, nonatomic) IBOutlet UIButton *VoteBtn;
@property (strong,nonatomic)NSString *string;
@property (strong, nonatomic) Session *currentSesseion;
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) QuestionService *qsService;



@end
