//
//  JoinClassViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "JoinClassViewController.h"
#import "AudienceViewController.h"
#import "SessionService.h"
#import "session.h"


@interface JoinClassViewController ()
@property (strong,nonatomic) UIPopoverController *parentPopoverController;
@end


@implementation JoinClassViewController

AudienceViewController *parent;
Session *newAudiSession;

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

- (void) setSessionRef:(Session *) newSession thecaller:(AudienceViewController*) theSender
{
    NSLog(@"Join Session");
    
    if ( newAudiSession != newSession)
    {
        newAudiSession = newSession;
        parent = theSender;
    }

    if(self.parentPopoverController != nil)
    {
        [self.parentPopoverController dismissPopoverAnimated:YES];
    }

}

- (void) setSessionInfo
{
    NSLog(@"JoinInAction %@", self.ClassID.text);
    
    newAudiSession.title = self.ClassID.text;
}

- (Boolean) checkSession
{
    // call service to check the existence of the session
    // call serive to join session
    
    return TRUE;
}

- (IBAction)JoinInAction:(id)sender {
    
    if (self.ClassID.text.length > 0)
    {
        [self setSessionInfo];
        

        if ( [self checkSession] == TRUE)
        {
            [parent retriveActiveSessions];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
        
}



@end
