//
//  AudienceViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassDetailsViewController;
@class JoinClassViewController;
@class SessionService;

@interface AudienceViewController : UITableViewController
{
    ClassDetailsViewController *classDetails;
    JoinClassViewController *joinClass;
    SessionService *ssAudience;
}

@property (weak, nonatomic) IBOutlet UINavigationBar *AudienceNavBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *AddBtn;

@property (nonatomic, strong) ClassDetailsViewController *classDetails;
@property (nonatomic, strong) JoinClassViewController *joinClass;

@property (nonatomic, strong) SessionService *ssAudience;

@end
