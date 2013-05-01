//
//  JoinClassViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "JoinClassViewController.h"

@interface JoinClassViewController ()

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


- (IBAction)JoinInAction:(id)sender {
    NSLog(@"JoinInAction %@", _ClassID.text);
    
    if (_ClassID.text.length > 0 )
        [self performSegueWithIdentifier:@"JoinClassSegue" sender:self];
        
}



@end
