//
//  QuestionNoteViewController.h
//  iclass
//
//  Created by MagicStudio on 13-5-13.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionNoteViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *noteText;
@property (weak, nonatomic) IBOutlet UIButton *SaveBtn;
@property int questionKey;
@property BOOL bExist;
@property (strong, nonatomic) NSMutableDictionary *notes;
@property (strong  , nonatomic) NSString *path;
- (IBAction)SaveAction:(id)sender;
@end
