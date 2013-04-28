//
//  LoginViewController.m
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginModel.h"
#import "PopupMessageCreator.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginModel, userID, password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    loginModel = [[LoginModel alloc]init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) login:(id)sender
{
    NSString *name = userID.text;
    NSString *pass = password.text;
    NSLog(@"username = %@ and password = %@", name, pass);
    BOOL result = [loginModel verifyUser:name andPassword:pass];
    if (!result) {
        [PopupMessageCreator popupAlertMessageBox:@"Incorrect userId or password"];
    } else {
        NSLog(@"Log in successfully");
    }
}
-(IBAction) signUp:(id)sender
{
    [PopupMessageCreator popupAlertMessageBox:@"Sign up is not available"];
}

-(IBAction) loginAsGuest:(id)sender
{
    [PopupMessageCreator popupAlertMessageBox:@"Login with guest is not available"];
}
@end
