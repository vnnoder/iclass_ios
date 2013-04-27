//
//  MasterViewController.h
//  iClass
//
//  Created by Ma Xiangmei on 27/4/13.
//  Copyright (c) 2013 Lewis He Zhihua. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
