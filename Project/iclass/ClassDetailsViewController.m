//
//  ClassDetailsViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "ClassDetailsViewController.h"
#import "GlobalState.h"

@interface ClassDetailsViewController ()
@property (strong,nonatomic) UIPopoverController *parentPopoverController;
- (void) configureView;
@end

@implementation ClassDetailsViewController
@synthesize OperationBtn;

- (void) setClassDetailItem:(id)newClassDetailItem
{
    NSLog(@"ClassDetails setClassDetailItem = %@ ", [newClassDetailItem description]);

    if(_classDetailItem != newClassDetailItem){
        _classDetailItem = newClassDetailItem;
        [self configureView];
    }
    
    if(self.parentPopoverController != nil){
        [self.parentPopoverController dismissPopoverAnimated:YES];
    }
}

- (void) configureView
{
    NSLog(@"ClassDetails configureView = %@ ", [self.classDetailItem description]);

    if (self.classDetailItem){
        self.ClassID.text = [self.classDetailItem description];
    }
    
    //if (OperationBtn) {
    
        if (GUserGole == AUDIENCE) {
            OperationBtn.titleLabel.text = @"Leave";
        } else {
            // TODO change button title according to class's status
            OperationBtn.titleLabel.text = @"Start";
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
    NSLog(@"ClassDetails viewDidLoad = %@ ", [self.classDetailItem description]);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    NSLog(@"ClassDetails splitViewController 1 = %@ ", [self.classDetailItem description]);
 
//    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
//    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.parentPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"ClassDetails splitViewController 2 = %@ ", [self.classDetailItem description]);

    // Called when the view is shown again in the split view, invalidating the button and popover controller.
//    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.parentPopoverController = nil;
}


@end
