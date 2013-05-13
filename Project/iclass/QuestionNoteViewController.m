//
//  QuestionNoteViewController.m
//  iclass
//
//  Created by MagicStudio on 13-5-13.
//  Copyright (c) 2013年 Wiely Rabin. All rights reserved.
//

#import "QuestionNoteViewController.h"

@interface QuestionNoteViewController ()

@end

@implementation QuestionNoteViewController
@synthesize questionKey, noteText, SaveBtn, bExist, notes, path;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Dispose of any resources that can be recreated.
    
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *plistPath1 = [paths objectAtIndex:0];
     NSString *filename = [plistPath1 stringByAppendingPathComponent:@"QuestionNote.plist"];
     
    notes = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    if (notes != nil) {
        for(NSString *key in notes)
        {
            if (questionKey == [key intValue]) {
                bExist = TRUE;
                noteText.text = [notes objectForKey:key];
            }
        }
    }
    else
    {
        notes = [[NSMutableDictionary alloc]init];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (IBAction)SaveAction:(id)sender {

    [notes setObject:noteText.text forKey:[NSString stringWithFormat:@"%d", questionKey]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    NSString *filename = [plistPath1 stringByAppendingPathComponent:@"QuestionNote.plist"];
    
    //NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"QuestionNote" ofType:@"plist"];
    [notes writeToFile:filename atomically:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
