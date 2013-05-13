//
//  ClassDetailsViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Session;

@interface ClassDetailsViewController : UIViewController 

@property (nonatomic) NSInteger sessionDetailType;
@property (strong, nonatomic) id classDetailItem;


@property (weak, nonatomic) IBOutlet UITextField *ClassID;
@property (weak, nonatomic) IBOutlet UITextView *ClassDescription;
@property (weak, nonatomic) IBOutlet UITextField *ClassPassCode;
@property (weak, nonatomic) IBOutlet UIButton *SurveryBtn;

@property (weak, nonatomic) IBOutlet UIButton *QuestionsBtn;
@property (weak, nonatomic) IBOutlet UIButton *OperationBtn;


- (void) setSessionRef:(Session *) aSession;

@end
