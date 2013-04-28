//
//  AudienceJoinSessionViewController.m
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import "AudienceJoinSessionViewController.h"
#include "AudienceJoinSessionModel.h"
#include "PopupMessageCreator.h"
@interface AudienceJoinSessionViewController ()

@end

@implementation AudienceJoinSessionViewController
@synthesize audienceJoinSessionModel;

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
    audienceJoinSessionModel = [[AudienceJoinSessionModel alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction) scan:(id)sender
{
    [PopupMessageCreator popupAlertMessageBox:@"Scan function is not available!"];
}
-(IBAction) joinIn:(id)sender
{
    NSString *tmpSessionID = self.sessionId.text;
    BOOL result = [audienceJoinSessionModel verifySession:tmpSessionID];
    if (!result) {
        [PopupMessageCreator popupAlertMessageBox:@"Session is wrong"];
    } else {
        [self performSegueWithIdentifier:@"JoinSessionReturn" sender:tmpSessionID];
    }
}
@end
