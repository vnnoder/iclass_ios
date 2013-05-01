//
//  AudienceViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassDetailsViewController;
@class sessionListSample;

@interface AudienceViewController : UITableViewController{
    NSString *classID;
    ClassDetailsViewController *classDetails;
    sessionListSample *sessionList;
}

@property (weak, nonatomic) IBOutlet UINavigationBar *AudienceNavBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *AddBtn;

@property (nonatomic, strong) NSString *classID;
@property (nonatomic, strong) ClassDetailsViewController *classDetails;
@property (nonatomic, strong) sessionListSample *sessionList;

@end
