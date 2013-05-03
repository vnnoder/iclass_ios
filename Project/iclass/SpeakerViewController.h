//
//  SpeakerViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class sessionListSample;
@interface SpeakerViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *SpeakerNavigationBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *AddBtn;
@property (nonatomic, strong) sessionListSample *sessionList;
@end
