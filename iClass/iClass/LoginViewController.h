//
//  LoginViewController.h
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginModel;
@interface LoginViewController : UIViewController

@property (strong,nonatomic) LoginModel *loginModel;
@property (strong,nonatomic) IBOutlet UITextField *userID;
@property (strong,nonatomic) IBOutlet UITextField *password;

-(IBAction) login:(id)sender;
-(IBAction) loginAsGuest:(id)sender;
-(IBAction) signUp:(id)sender;

@end
