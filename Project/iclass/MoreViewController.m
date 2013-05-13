//
//  MoreViewController.m
//  iclass
//
//  Created by Wiely Rabin on 13/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

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

- (IBAction)callSupportAction:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:65162001"]];
}

- (void)mailComposeController: ( MFMailComposeViewController*) controller
          didFinishWithResult: ( MFMailComposeResult)result
                        error: ( NSError*) error {
    [controller dismissViewControllerAnimated:YES completion:nil] ;
}


- (IBAction)emailSupport:(id)sender {
    MFMailComposeViewController *emailViewController =
	[[MFMailComposeViewController alloc] init] ;
    emailViewController. mailComposeDelegate = self;
    
    [emailViewController setSubject: @"This application is awesome ! "] ;
    [emailViewController setMessageBody: @"This application is really awesome !!! !" isHTML: NO] ;
    [self presentViewController:emailViewController animated:YES completion:nil] ;
}

@end
