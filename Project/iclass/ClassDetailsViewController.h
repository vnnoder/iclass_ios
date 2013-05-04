//
//  ClassDetailsViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassDetailsViewController : UIViewController <UISearchDisplayDelegate>

@property (strong, nonatomic) id classDetailItem;

@property (weak, nonatomic) IBOutlet UITextField *ClassID;
@property (weak, nonatomic) IBOutlet UITextView *ClassDescription;
@property (weak, nonatomic) IBOutlet UIButton *SurveryBtn;

@property (weak, nonatomic) IBOutlet UIButton *QuestionsBtn;
@property (weak, nonatomic) IBOutlet UIButton *OperationBtn;
@end
