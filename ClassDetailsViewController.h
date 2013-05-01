//
//  ClassDetailsViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ClassID;
@property (weak, nonatomic) IBOutlet UITextView *ClassDescription;
@property (weak, nonatomic) IBOutlet UILabel *QuestionsLbl;
@property (weak, nonatomic) IBOutlet UILabel *SurveyLbl;

@end
