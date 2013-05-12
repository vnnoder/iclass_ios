//
//  CreateQuestionViewController.h
//  iclass
//
//  Created by MagicStudio on 13-5-12.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateQuestionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *questionTitle;
@property (weak, nonatomic) IBOutlet UITextView *qustionDetail;
@property (weak, nonatomic) IBOutlet UIButton *AskBtn;
@property  int  sessionId;
@end
