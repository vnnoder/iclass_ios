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

@interface Question : Entity <NSCoding>

@property (retain) NSString *title;
@property (retain) NSString *detail;
@property NSInteger userId;
@property NSInteger sessionId;
@property (retain) NSDate *createdAt;
@property (retain) NSDate *updatedAt;
@property NSInteger voteCount;
@property BOOL voted;

-(id) initWithTitle:(NSString *)paratitle andDetail:(NSString*)paradetail andOwener:(NSInteger)paraowner andSession:(NSInteger)parasession andCreateData:(NSDate*)paracreateDate andUpdateDate:(NSDate*)paraupdateDate andVoteCount:(NSInteger)paravoteCount andIsVoted:(BOOL)paravoted;

-(NSComparisonResult) compareUpdateDate:(Question *) question;
-(NSComparisonResult) compareVoteCount:(Question *) question;
@end
