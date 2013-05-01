//
//  AudienceViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "AudienceViewController.h"
#import "ClassDetailsViewController.h"
#import "sessionListSample.h"

@interface AudienceViewController ()

@end

@implementation AudienceViewController

@synthesize classDetails,classID,sessionList;



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
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    
    self.title = @"Audience Class";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    classID = @"TEST DATA";
    sessionList = [[sessionListSample alloc] init];
    
    self.classDetails = (ClassDetailsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    NSLog(@"viewDidLoad ~ End");
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
    //return 0;
    return sessionList.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView cellForRowAtIndexPath");
//    static NSString *CellIdentifier = @"Cell";
//   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];// forIndexPath:indexPath];

    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
/*
    // Configure the cell...
    NSUInteger row = indexPath.row;
*/
    NSLog(@"tableView cell.text %@ ", [sessionList.arrayData objectAtIndex:indexPath.row]);

    
    cell.textLabel.text = [sessionList.arrayData objectAtIndex:indexPath.row];
    
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
/*
    if (self.classDetails == nil){
       // self.classDetails = [[ClassDetailsViewController alloc] init];  //
        self.classDetails = [[ClassDetailsViewController alloc] initWithNibName:nil bundle:nil];
        
        
//                             initWithNibName:@"Class Details" bundle:nil]; //[NSBundle mainBundle]];
    }
    
    [self.navigationController pushViewController:self.classDetails animated:YES];
*/
    NSLog(@"tableView didSelectRowAtIndexPath text = %@ ", [sessionList.arrayData objectAtIndex:indexPath.row]);

    self.classDetails.classDetailItem = [sessionList.arrayData objectAtIndex:indexPath.row];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue ");
    
    if ([[segue identifier] isEqualToString:@"showClassDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setClassDetailItem:[sessionList.arrayData objectAtIndex:indexPath.row]];
    }
}



@end
