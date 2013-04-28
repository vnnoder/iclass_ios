//
//  PopupMessageCreator.m
//  iClass
//
//  Created by MagicStudio on 13-4-28.
//  Copyright (c) 2013年 ISS. All rights reserved.
//

#import "PopupMessageCreator.h"

@implementation PopupMessageCreator
+(void) popupAlertMessageBox:(NSString*) msg
{
    UIAlertView *alertPopup = [[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertPopup show];
}
@end
