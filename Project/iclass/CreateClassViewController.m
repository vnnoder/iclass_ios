//
//  CreateClassViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "CreateClassViewController.h"
#import "SessionService.h"

@interface CreateClassViewController ()
@property (strong,nonatomic) UIPopoverController *parentPopoverController;
@end

@implementation CreateClassViewController

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

- (void) setSessionServiceSpeaker:(id)newSessionServiceSpeaker
{
    NSLog(@"setSessionServiceSpeaker ");
    
    if ( _sessionServiceSpeaker != newSessionServiceSpeaker)
    {
        _sessionServiceSpeaker = newSessionServiceSpeaker;
    }
    
    if(self.parentPopoverController != nil){
        [self.parentPopoverController dismissPopoverAnimated:YES];
    }
    
}

- (void) createSession
{
    [self.sessionServiceSpeaker join:_ClassID.text];
}

- (IBAction)CreateNewSession:(id)sender
{
    NSLog(@"CreateNewSession %@", _ClassID.text);
    if (_ClassID.text.length > 0 )
    {
        [self createSession];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
