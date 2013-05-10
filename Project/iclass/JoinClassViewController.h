//
//  JoinClassViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinClassViewController : UIViewController

@property (strong, nonatomic) id sessionServiceAudience;

@property (weak, nonatomic) IBOutlet UITextField *ClassID;
@property (weak, nonatomic) IBOutlet UIButton *ScanBtn;
@property (weak, nonatomic) IBOutlet UIButton *JoinBtn;

@end
