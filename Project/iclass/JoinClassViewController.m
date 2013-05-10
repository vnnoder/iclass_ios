//
//  JoinClassViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "JoinClassViewController.h"
#import "SessionService.h"

@interface JoinClassViewController ()
@property (strong,nonatomic) UIPopoverController *parentPopoverController;
@end

@implementation JoinClassViewController

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


- (void) setSessionServiceAudience:(id)newSessionServiceAudience
{
    NSLog(@"setSessionServiceAudience ");

    if ( _sessionServiceAudience != newSessionServiceAudience)
    {
        _sessionServiceAudience = newSessionServiceAudience;
    }

    if(self.parentPopoverController != nil){
        [self.parentPopoverController dismissPopoverAnimated:YES];
    }
    
}

- (void) joinSession
{
    [self.sessionServiceAudience join:_ClassID.text];
}

- (IBAction)JoinInAction:(id)sender {
    NSLog(@"JoinInAction %@", _ClassID.text);
    
    if (_ClassID.text.length > 0 )
    {
        [self joinSession];
        [self.navigationController popViewControllerAnimated:YES];
    
    }
        
}



@end
