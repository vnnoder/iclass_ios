//
//  CreateClassViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateClassViewController : UIViewController

@property (strong, nonatomic) id sessionServiceSpeaker;

@property (weak, nonatomic) IBOutlet UITextField *ClassID;
@property (weak, nonatomic) IBOutlet UITextField *ClassDesc;
@property (weak, nonatomic) IBOutlet UIButton *ConfirmBtn;

@end
