//
//  QuestionListViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Session;
@class QuestionList;
@interface QuestionListViewController : UITableViewController
{
    Session *currentSesseion;
    QuestionList *questionList;
}
@property (strong, nonatomic) Session *currentSesseion;
@property (nonatomic, strong) QuestionList *questionList;
@property (weak, nonatomic) IBOutlet UIButton *AddQuestionBtn;
@end
