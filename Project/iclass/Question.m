//
//  Question.m
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize title;
@synthesize detail;
@synthesize owner;
@synthesize session;
@synthesize createdAt;
@synthesize updatedAt;
@synthesize voteCount;
@synthesize voted;

-(id) initWithTitle:(NSString *)paratitle andDetail:(NSString*)paradetail andOwener:(User*)paraowner andSession:(Session*)parasession andCreateData:(NSDate*)paracreateDate andUpdateDate:(NSDate*)paraupdateDate andVoteCount:(NSInteger)paravoteCount andIsVoted:(BOOL)paravoted
{
    self = [super init];
    if (self) {
        self.title = paratitle;
        self.detail =paradetail;
        self.owner = paraowner;
        self.session = parasession;
        self.createdAt = paracreateDate;
        self.updatedAt = paraupdateDate;
        self.voteCount = paravoteCount;
        self.voted = paravoted;
        return self;
    }
    return self;
}

-(NSComparisonResult) compareUpdateDate:(Question *) question
{
    return [updatedAt compare:[question updatedAt]];
}

-(NSComparisonResult) compareVoteCount:(Question *) question
{
    
    return voteCount < [question voteCount];
}

@end
