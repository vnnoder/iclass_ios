//
//  SpeakerViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassDetailsViewController;
@class CreateClassViewController;
@class SessionService;


@interface SpeakerViewController : UITableViewController
{
    ClassDetailsViewController *classDetails;
    CreateClassViewController *createClass;
    SessionService *ssSpeaker;    
}

@property (weak, nonatomic) IBOutlet UINavigationBar *SpeakerNavigationBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *AddBtn;

@property (nonatomic, strong) ClassDetailsViewController *classDetails;
@property (nonatomic, strong) CreateClassViewController *createClass;

@property (nonatomic, strong) SessionService *ssSpeaker;



@end
