//
//  DetailViewController.h
//  iClass
//
//  Created by Ma Xiangmei on 27/4/13.
//  Copyright (c) 2013 Lewis He Zhihua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
