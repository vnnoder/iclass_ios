//
//  CreateClassViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "CreateClassViewController.h"

@interface CreateClassViewController ()

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

- (IBAction)ConfirmNewClass:(id)sender {
    NSLog(@"ConfirmNewClassAction");

    
    if ((_ClassID.text.length > 0 ) && (_ClassDesc.text.length > 0))
        [self performSegueWithIdentifier:@"CreateNewClassSegue" sender:self];

    
}

@end
