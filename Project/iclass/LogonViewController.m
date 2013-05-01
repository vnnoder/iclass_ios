//
//  LogonViewController.m
//  iclass
//
//  Created by Wiely Rabin on 28/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "LogonViewController.h"
#import "SpeakerViewController.h"

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
    
    //_usernameField.text = @"abc";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Logon{
//    int a;
    NSLog(@"Logon IBAction");
/*
    a =2;
    if (a==1)
*/        [self performSegueWithIdentifier:@"LogonSegue" sender:self];
    
}

- (IBAction)SignUpAction:(id)sender {
    NSLog(@"SignUpAction");
    

}

- (IBAction)GuestAction:(id)sender {
    NSLog(@"GuestAction");
}

- (IBAction)SignInAction:(id)sender {
    NSLog(@"SignInAction");
}

- (IBAction)SignInWithFacebookAction:(id)sender {
    NSLog(@"SignInWithFacebookAction");
}



@end
