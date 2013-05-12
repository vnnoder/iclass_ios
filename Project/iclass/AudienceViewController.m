//
//  AudienceViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "AudienceViewController.h"
#import "ClassDetailsViewController.h"
#import "JoinClassViewController.h"

#import "GlobalState.h"
#import "Session.h"
#import "SessionList.h"
#import "SessionService.h"

@interface AudienceViewController ()

@end

@implementation AudienceViewController

@synthesize classDetails,joinClass,ssAudience,activeSessions;


- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"initWithStyle");
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Audience";
    
    ssAudience = [[SessionService alloc] init];
    activeSessions = [[SessionList alloc] init];
    
    self.classDetails = (ClassDetailsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.joinClass = (JoinClassViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    GUserGole = AUDIENCE;
    
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return ssAudience.ActiveSessions.DataList.count;
    
    return activeSessions.DataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    //NSLog(@"Audi ~ load Title: %@ ", [[activeSessions.DataList objectAtIndex:indexPath.row] title]);
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
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"Nib name" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
        
    self.classDetails.classDetailItem = [activeSessions.DataList objectAtIndex:indexPath.row];

}

- (void)viewDidAppear:(BOOL)animated
{
//    [self retriveActiveSessions];
    [self.tableView reloadData];
}


- (void) retriveActiveSessions
{
    activeSessions.DataList = (NSMutableArray *) [ssAudience getJoinedSession];
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue ");
    
    if ([[segue identifier] isEqualToString:@"showClassDetail"]) {
        NSLog(@"prepareForSegue showClassDetail");
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setSessionDetailType:0];
        //[[segue destinationViewController] setClassDetailItem:[activeSessions.DataList objectAtIndex:indexPath.row]];
        [[segue destinationViewController] setSessionRef:[activeSessions.DataList objectAtIndex:indexPath.row]];
    }

    
    if ([[segue identifier] isEqualToString:@"joinNewClass"]) {
        Session *aNewSession = [[Session alloc] init];
        NSLog(@"prepareForSegue joinNewClass");
        [[segue destinationViewController] setSessionRef:(aNewSession) thecaller:(self)];
    }

}

@end
