//
//  QuestionListViewController.h
//  iclass
//
//  Created by Wiely Rabin on 30/4/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Session;
@interface QuestionListViewController : UITableViewController
{
    Session *currentSesseion;
}
@property (strong, nonatomic) Session *currentSesseion;
@end
