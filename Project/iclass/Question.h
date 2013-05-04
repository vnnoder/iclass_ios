//
//  Question.h
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Session.h"
#import "Entity.h"

@interface Question : Entity

@property (strong) NSString *title;
@property (strong) NSString *detail;
@property (copy, nonatomic) User *owner;
@property (copy, nonatomic) Session *session;
@property (strong) NSDate *createdAt;
@property (strong) NSDate *updatedAt;
@property NSInteger voteCount;
@property BOOL voted;

-(NSComparisonResult) compareUpdateDate:(Question *) question;
-(NSComparisonResult) compareVoteCount:(Question *) question;
@end
