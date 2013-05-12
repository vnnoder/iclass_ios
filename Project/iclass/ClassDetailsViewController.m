//
//  ClassDetailsViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "Session.h"
#import "ClassDetailsViewController.h"
#import "QuestionListViewController.h"
#import "GlobalState.h"
#import "SessionService.h"



@interface ClassDetailsViewController ()
@property (strong,nonatomic) UIPopoverController *parentPopoverController;
- (void) configureView;
@end

@implementation ClassDetailsViewController

@synthesize OperationBtn;

//UIViewController *parent;
Session *currentSession;

- (void) setSessionDetailType:(NSInteger)inSessionDetailType
{
    _sessionDetailType = inSessionDetailType;
}


- (void) setSessionRef:(Session *) aSession
{
    
    if ( currentSession != aSession)
    {
        currentSession = aSession;
        //parent = theSender;
        [self configureView];
    }
    
    if(self.parentPopoverController != nil)
    {
        [self.parentPopoverController dismissPopoverAnimated:YES];
    }
    
}


- (void) configureView
{
    if (currentSession){
        self.ClassID.text = currentSession.title;
        self.ClassDescription.text = currentSession.description;
        self.ClassPassCode.text = currentSession.passcode;
    }
    
    //if (OperationBtn) {
        //if (GUserGole == AUDIENCE) {
        if ( _sessionDetailType == AUDIENCEROLE)
        {
            [OperationBtn setTitle:@"Leave" forState:UIControlStateNormal];

        }
        else
        {
            
            // TODO change button title according to class's status
            [OperationBtn setTitle:@"Start" forState:UIControlStateNormal];

        }
    //}

}
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad
{
    NSLog(@"ClassDetails viewDidLoad = %@ ", [self.classDetailItem title]);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue
             .destinationViewController isKindOfClass:[QuestionListViewController class]]) {
            QuestionListViewController *detailController = segue.destinationViewController;
            
            // TODO should pass current session to question list view
            NSLog(@"session id is  = %d", currentSession.key);
            detailController.currentSesseion = currentSession;
        }
    //}
}


- (void) leaveClass
{
    SessionService *ssCurr;
    
    ssCurr = [[SessionService alloc] init];
    [ssCurr endSession:(currentSession.key)];
}


- (void) startClass
{
    SessionService *ssCurr;
    
    ssCurr = [[SessionService alloc] init];
    [ssCurr endSession:(currentSession.key)];

}

- (void) endClass
{
    SessionService *ssCurr;
    
    ssCurr = [[SessionService alloc] init];
    [ssCurr endSession:(currentSession.key)];
}

- (IBAction)ActionBtn:(id)sender
{
    NSLog(@"CS status %@",currentSession.status);
    if ( _sessionDetailType == AUDIENCEROLE)
    {
        // no service to leave the session right now
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
    
    
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    NSLog(@"ClassDetails splitViewController 1 = %@ ", [self.classDetailItem title]);
 
//    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
//    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.parentPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"ClassDetails splitViewController 2 = %@ ", [self.classDetailItem title]);

    // Called when the view is shown again in the split view, invalidating the button and popover controller.
//    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.parentPopoverController = nil;
}


@end
