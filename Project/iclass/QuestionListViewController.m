//
//  QuestionListViewController.m
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//
#import "Question.h"
#import "QuestionList.h"
#import "QuestionListViewController.h"
#import "QuestionDetailsViewController.h"
#import "CreateQuestionViewController.h"
#import "Session.h"
@interface QuestionListViewController ()

@end

@implementation QuestionListViewController
@synthesize currentSesseion, questionList, AddQuestionBtn;

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
    
    if (currentSesseion == nil) {
        self.title = @"Favourite";
        if (questionList == nil) {
            questionList = [[QuestionList alloc] initInOfflineMode];
        }
        [questionList getExistingQuestionsFromFile];
    }
    else {
        self.title = @"Question";
        if (questionList == nil) {
            questionList = [[QuestionList alloc] init];
        }
        NSLog(@"session id = %d", [currentSesseion key]);
        [questionList getExistingQuestions:[currentSesseion key]];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) loadQuestionFromWebservice
{
    if (currentSesseion != nil) {
        
    }
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
    return [[questionList QuestionListData]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Question *qn = [questionList.QuestionListData objectAtIndex:indexPath.row];
    cell.textLabel.text = [qn title] ;
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",[formatter stringFromDate:[qn updatedAt]]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Voted(%d) %@",[qn voteCount], lastUpdated];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue
             .destinationViewController isKindOfClass:[QuestionDetailsViewController class]]) {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            QuestionDetailsViewController *detailController = segue.destinationViewController;
            detailController.currentSesseion = currentSesseion;
            detailController.currentQuestion = [questionList.QuestionListData objectAtIndex:indexPath.row];
            detailController.qsService = [questionList qsAudience];
        }
    }
    
    

        if ([segue
             .destinationViewController isKindOfClass:[CreateQuestionViewController class]]) {

            CreateQuestionViewController *createQuestionController = segue.destinationViewController;
            NSLog(@"session id in question list = %d", currentSesseion.key);
            createQuestionController.currentSession = currentSesseion;
            createQuestionController.qsService = [questionList qsAudience];
        }

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
}
- (void)viewDidAppear:(BOOL)animated
{
    //    [self retriveActiveSessions];
    if (currentSesseion == nil) {
        [questionList getExistingQuestionsFromFile];
    }
    else{
        [questionList getExistingQuestions:[currentSesseion key]];
    }
    
    [self.tableView reloadData];
}


@end
