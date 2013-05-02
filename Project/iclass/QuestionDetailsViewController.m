//
//  QuestionDetailsViewController.m
//  iclass
//
//  Created by Wiely Rabin on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QuestionDetailsViewController.h"

@interface QuestionDetailsViewController ()

@end

@implementation QuestionDetailsViewController
@synthesize string, QuestionDescription;
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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    QuestionDescription.text = self.string;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
