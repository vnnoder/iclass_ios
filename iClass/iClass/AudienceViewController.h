//
//  AudienceViewController.h
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AudienceSessionModel;
@class AudienceJoinSessionViewController;
@interface AudienceViewController : UITableViewController

@property (strong, nonatomic) AudienceJoinSessionViewController *joinSessionViewController;
@property AudienceSessionModel *audienceSessionModel;
@end
