//
//  AudienceJoinSessionViewController.h
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AudienceJoinSessionModel;
@interface AudienceJoinSessionViewController : UIViewController

@property (strong,nonatomic) IBOutlet UITextField *sessionId;
@property (strong, nonatomic) AudienceJoinSessionModel *audienceJoinSessionModel;

-(IBAction) scan:(id)sender;
-(IBAction) joinIn:(id)sender;

@end
