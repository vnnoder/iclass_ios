//
//  LogonViewController.h
//  iclass
//
//  Created by Wiely Rabin on 28/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogonViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *SignInButton;
@property (weak, nonatomic) IBOutlet UIButton *SignInWithFacebookButton;
@property (weak, nonatomic) IBOutlet UIButton *SignUpButton;
@property (weak, nonatomic) IBOutlet UIButton *GuestButton;


- (IBAction)Logon;

@end
