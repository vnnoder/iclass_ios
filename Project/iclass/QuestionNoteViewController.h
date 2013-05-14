//
//  QuestionNoteViewController.h
//  iclass
//
//  Created by MagicStudio on 13-5-13.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;
@interface QuestionNoteViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *noteText;
@property (weak, nonatomic) IBOutlet UIButton *SaveBtn;
@property (strong, nonatomic) Question *currentQuestion;
@property int questionKey;
@property BOOL bExist;
@property (strong, nonatomic) NSMutableDictionary *notes;
@property (strong  , nonatomic) NSString *path;
@property (strong, nonatomic) NSMutableArray *favQuestionlist;
- (IBAction)SaveAction:(id)sender;
@end
