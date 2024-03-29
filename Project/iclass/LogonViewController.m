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
#import "User.h"
#import "Util.h"

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
    self.passwordField.secureTextEntry = YES;    
}

- (void)viewDidAppear:(BOOL)animated{
    NSString *username =  [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString *password =  [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    if(username && password){
        self.usernameField.text = username;
        self.passwordField.text = password;
        
        if ( [self checkLogonInfo] ) {
            [self performSegueWithIdentifier:@"LogonSegue" sender:self];
        }
        else {
            [self performSegueWithIdentifier:@"OfflineSegue" sender:self];
        }
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
        {
            [Util nofifyError:@"Logon failed"];
            return false;
        }

        NSLog(@"%@", [[info user]fullName]);        
        return true;
    }
    else
    {
        [Util nofifyError:@"Please fill in the username and password"];
    }
    
    return false;
}

- (NSString *) generateRandomUser
{
    NSString *szBuff;
    int inLengthUserName = ( arc4random() % 10 ) + 5;
    int i, test;
    
    szBuff = @"AGU_";   //Auto Generate User
    
    for ( i = 0; i < inLengthUserName ; i++ ){
        test = ( arc4random() % 26 ) + 'a';
        szBuff = [szBuff stringByAppendingFormat:@"%c", test];
    }
    
    NSLog(@"dummy username: %@",szBuff);
    
    return szBuff;

}

- (Boolean) guestLogon
{
    User *newUser = [[User alloc] init]; 
    UserService *service = [[UserService alloc]init];
    
    newUser.loginId = [self generateRandomUser];
    newUser.fullName = newUser.email = newUser.password = newUser.loginId;
    
    if ([service create:(newUser)] == nil)
    {
        [Util nofifyError:@"Generate user failed"];
        return false;
    }

    
    LoginInfo *info = [service singInWithLoginId:newUser.loginId password:newUser.password];
    
    if ( [info user] == nil)
    {
        [Util nofifyError:@"Logon failed"];
        return false;
    }

    
    NSLog(@"Current User: %@ ", [[info user] fullName] );
    
    return true;
}

- (IBAction)FacebookSignIn:(id)sender {
    [Util nofifyError:@"Coming Soon"];
}

- (IBAction)Logon{
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
