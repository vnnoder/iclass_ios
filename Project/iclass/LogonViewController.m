//
//  LogonViewController.m
//  iclass
//
//  Created by Wiely Rabin on 28/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "LogonViewController.h"
#import "UserService.h"
#import "LoginInfo.h"


@interface LogonViewController ()

@end

@implementation LogonViewController

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

- (void)viewDidAppear:(BOOL)animated{
    NSString *username =  [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString *password =  [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    if(username && password){
        self.usernameField.text = username;
        self.passwordField.text = password;
        
        if ( [self checkLogonInfo] )
            [self performSegueWithIdentifier:@"LogonSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Boolean) checkLogonInfo
{
    UserService *service = [[UserService alloc]init];
    if ( (self.usernameField.text.length > 0) && (self.passwordField.text.length >0) )
    {
        LoginInfo *info = [service singInWithLoginId:self.usernameField.text password:self.passwordField.text];
        
        if ( [info user] == nil)
            return false;
        
        NSLog(@"%@", [[info user]fullName]);        
 
        return true;
    }
    
    return false;
}


- (Boolean) guestLogon
{
    UserService *service = [[UserService alloc]init];
    LoginInfo *info = [service singInWithLoginId:@"michael" password:@"michael"];
        
    if ( [info user] == nil)
        return false;
    
    return true;
}


- (IBAction)Logon
{
    NSLog(@"Logon IBAction");
    
    if ( [self checkLogonInfo] )
        [self performSegueWithIdentifier:@"LogonSegue" sender:self];
    
}

- (IBAction)SignUpAction:(id)sender {
    NSLog(@"SignUpAction");
}

- (IBAction)GuestAction:(id)sender {
    if ( [self guestLogon] == true)
        [self performSegueWithIdentifier:@"LogonSegue" sender:self];
}

- (IBAction)SignInAction:(id)sender {
    NSLog(@"SignInAction");
}

- (IBAction)SignInWithFacebookAction:(id)sender {
    NSLog(@"SignInWithFacebookAction");
}



@end
