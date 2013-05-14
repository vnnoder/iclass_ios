//
//  CreateClassViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "CreateClassViewController.h"
#import "SpeakerViewController.h"
#import "SessionService.h"
#import "Session.h"
#import "Util.h"

@interface CreateClassViewController ()
@property (strong,nonatomic) UIPopoverController *parentPopoverController;
@end

@implementation CreateClassViewController

SpeakerViewController *parent;
Session *newSpeakerSession;

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

- (void) setSessionRef:(Session *) newSession thecaller:(SpeakerViewController*) theSender
{
    NSLog(@"Create Session");
    
    if ( newSpeakerSession != newSession)
    {
        newSpeakerSession = newSession;
        parent = theSender;
    }
    
    if(self.parentPopoverController != nil)
    {
        [self.parentPopoverController dismissPopoverAnimated:YES];
    }
}

- (void) setSessionInfo
{   
    newSpeakerSession.title = self.ClassID.text;
    newSpeakerSession.description = self.ClassDesc.text;
    newSpeakerSession.location = self.ClassLocation.text;
}

- (Boolean) checkSession
{
    SessionService *ssSpeaker;
    
    ssSpeaker = [[SessionService alloc] init];
    if ( [ssSpeaker create:(newSpeakerSession)] == nil)
    {
        [Util nofifyError:@"Create class failed "];
        return FALSE;
    }

    
    return TRUE;
}

- (IBAction)CreateNewSession:(id)sender
{

    if ( (_ClassID.text.length > 0 ) && (_ClassDesc.text.length > 0) )
    {
        [self setSessionInfo];
        
        if ( [self checkSession] == TRUE)
        {
            [parent retriveActiveSessions];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        [Util nofifyError:@"Please fill in the class info "];
    }
} 

@end
