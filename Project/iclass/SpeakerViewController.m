//
//  SpeakerViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "SpeakerViewController.h"
#import "ClassDetailsViewController.h"
#import "CreateClassViewController.h"

#import "GlobalState.h"

#import "Session.h"
#import "SessionList.h"
#import "SessionService.h"

@interface SpeakerViewController ()

@end

@implementation SpeakerViewController

@synthesize classDetails,createClass,ssSpeaker,activeSessions;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Speaker";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    ssSpeaker = [[SessionService alloc] init];
    activeSessions = [[SessionList alloc] init];
    
    self.classDetails = (ClassDetailsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.createClass = (CreateClassViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    GUserGole = SPEAKER;
    
    [self retriveActiveSessions];
    
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self
                action:@selector(refreshView:)
      forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    return ssSpeaker.ActiveSessions.DataList.count;
    return activeSessions.DataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpeakerClassCell"];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SpeakerClassCell"];

    //NSLog(@"Speaker ~ load Title: %@ ", [[activeSessions.DataList objectAtIndex:indexPath.row] title]);
    cell.textLabel.text = [[activeSessions.DataList objectAtIndex:indexPath.row] title];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */

    //self.classDetails.classDetailItem = [ssSpeaker.ActiveSessions.DataList objectAtIndex:indexPath.row];
    self.classDetails.classDetailItem = [activeSessions.DataList objectAtIndex:indexPath.row];
    
}

- (void)viewDidAppear:(BOOL)animated
{
//    [self retriveActiveSessions];
    [self.tableView reloadData];
}

- (void) retriveActiveSessions
{
    activeSessions.DataList = (NSMutableArray *) [ssSpeaker getOwnedSession];
}

-(void)refreshView:(UIRefreshControl *)refresh
{
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    // custom refresh logic would be placed here...
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",[formatter stringFromDate:[NSDate date]]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    [self retriveActiveSessions];
    [self.tableView reloadData];
    
    [refresh endRefreshing];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        // learn 2 way to indetify segue 
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[ClassDetailsViewController class]]) {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            ClassDetailsViewController *detailController = segue.destinationViewController;
            [[segue destinationViewController] setSessionDetailType:1];
            //[detailController setClassDetailItem:[activeSessions.DataList objectAtIndex:indexPath.row]];
            [detailController setSessionRef:[activeSessions.DataList objectAtIndex:indexPath.row]];
            //[detailController setSessionRef:[activeSessions.DataList objectAtIndex:indexPath.row] thecaller:(self)];
            
        }
    }
    
    
    if ([[segue identifier] isEqualToString:@"createNewClass"]) {
        Session *aNewSession = [[Session alloc] init];
        //NSLog(@"prepareForSegue createNewClass");
        [[segue destinationViewController] setSessionRef:(aNewSession) thecaller:(self)];
    }
    
}


@end
