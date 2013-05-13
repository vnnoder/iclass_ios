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
@class SessionList;

@interface AudienceViewController : UITableViewController
{
    ClassDetailsViewController *classDetails;
    JoinClassViewController *joinClass;
    SessionService *ssAudience;
    SessionList *activeSessions;
}

@property (weak, nonatomic) IBOutlet UINavigationBar *AudienceNavBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *AddBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SignOut;

@property (nonatomic, strong) ClassDetailsViewController *classDetails;
@property (nonatomic, strong) JoinClassViewController *joinClass;

@property (nonatomic, strong) SessionService *ssAudience;
@property (nonatomic, strong) SessionList *activeSessions;

- (void) retriveActiveSessions;

@end
