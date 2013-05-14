//
//  SignUpViewController.m
//  iclass
//
//  Created by Wiely Rabin on 9/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "SignUpViewController.h"
#import "UserService.h"
#import "LoginInfo.h"
#import "User.h"
#import "Util.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController


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
	// Do any additional setup after loading the view.
    self.userRetypePasswordTextField.secureTextEntry = YES;
    self.userPasswordTextField.secureTextEntry = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)CancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (Boolean) createUser
{
    if (self.userNameTextField.text.length > 0
        && self.fullNameTextField.text.length > 0
        && self.userEmailTextField.text.length > 0
        && self.userPasswordTextField.text.length > 0
        && self.userRetypePasswordTextField.text.length > 0
        )
    {
        if ( [self.userPasswordTextField.text isEqualToString:(self.userRetypePasswordTextField.text)] == true)
        {
            UserService *service = [[UserService alloc]init];
            User *newUser = [[User alloc] init];
            
            //LoginInfo *info = [service singInWithLoginId:@"michael" password:@"michael"];
            newUser.loginId = self.userNameTextField.text;
            newUser.fullName = self.fullNameTextField.text;
            newUser.email = self.userEmailTextField.text;
            newUser.password = self.userPasswordTextField.text;

            if ([service create:(newUser)] == nil)
            {
                [Util nofifyError:@"Logon failed"];
                return false;
            }

            
            LoginInfo *info = [service singInWithLoginId:newUser.loginId password:newUser.password];
            
            if ( [info user] == nil)
            {
                [Util nofifyError:@"Logon failed"];
                return false;
            }
            
            return true;
        }
    }
    else
    {
        [Util nofifyError:@"Please fill in all fields"];
    }

    return false;
}

- (IBAction)SignUpAction:(id)sender
{
    if ([self createUser] == true)
    {
        //auto signin
        //[self.navigationController popViewControllerAnimated:YES];
        [self performSegueWithIdentifier:@"autoLogonAfterSignUp" sender:self];
    }
}

- (IBAction)cancelAction:(id)sender {
    [self performSegueWithIdentifier:@"backToLogon" sender:self];
}

@end
