//
//  JoinClassViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Session;
@class AudienceViewController;

@interface JoinClassViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *ClassID;
@property (weak, nonatomic) IBOutlet UIButton *ScanBtn;
@property (weak, nonatomic) IBOutlet UIButton *JoinBtn;

- (void) setSessionRef:(Session *) newSession thecaller:(AudienceViewController*) theSender;

@end
