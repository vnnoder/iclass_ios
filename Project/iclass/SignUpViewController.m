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
    NSLog(@"step 0");
    if (self.userNameTextField.text.length > 0
        && self.fullNameTextField.text.length > 0
        && self.userEmailTextField.text.length > 0
        && self.userPasswordTextField.text.length > 0
        && self.userRetypePasswordTextField.text.length > 0
        )
    {
        NSLog(@"step 1");
   
        if ( [self.userPasswordTextField.text isEqualToString:(self.userRetypePasswordTextField.text)] == true)
        {
            NSLog(@"step 2");
            UserService *service = [[UserService alloc]init];
            User *newUser = [[User alloc] init];
            
            //LoginInfo *info = [service singInWithLoginId:@"michael" password:@"michael"];
            newUser.loginId = self.userNameTextField.text;
            newUser.fullName = self.fullNameTextField.text;
            newUser.email = self.userEmailTextField.text;
            newUser.password = self.userPasswordTextField.text;
            
            NSLog(@"step 3");

            if ([service create:(newUser)] == nil)
                return false;
            
            NSLog(@"step 4");
            
            return true;
        }
    }
    

    return false;
}

- (IBAction)SignUpAction:(id)sender
{
    NSLog(@"step A");
    if ([self createUser] == true)
    {
        //auto signin
        [self.navigationController popViewControllerAnimated:YES];
    }

}

@end
