//
//  MoreViewController.h
//  iclass
//
//  Created by Wiely Rabin on 13/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MoreViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UIButton *callSupport;
@property (weak, nonatomic) IBOutlet UIButton *emailSupport;
@property (weak, nonatomic) IBOutlet UIButton *yourLocation;

@end
