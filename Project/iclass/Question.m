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
@synthesize userId;
@synthesize sessionId;
@synthesize createdAt;
@synthesize updatedAt;
@synthesize voteCount;
@synthesize voted;

-(id) initWithTitle:(NSString *)paratitle andDetail:(NSString*)paradetail andOwener:(NSInteger)paraowner andSession:(NSInteger)parasession andCreateData:(NSDate*)paracreateDate andUpdateDate:(NSDate*)paraupdateDate andVoteCount:(NSInteger)paravoteCount andIsVoted:(BOOL)paravoted;
{
    self = [super init];
    if (self) {
        self.title = paratitle;
        self.detail =paradetail;
        self.userId = paraowner;
        self.sessionId = parasession;
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

#pragma mark
#define keyId @"questionKey"
#define keyTitle       @"Title"
#define keyDetail     @"Detail"
#define keyUserId   @"UserId"
#define keySessionId   @"SessionId"
#define keyCreateAt @"CreateDate"
#define keyUpdateAt   @"UpdateDate"
#define keyVoteCount   @"VoteCount"
#define keyVoted   @"Voted"

/*
@property (retain) NSString *title;
@property (retain) NSString *detail;
@property NSInteger userId;
@property NSInteger sessionId;
@property (retain) NSDate *createdAt;
@property (retain) NSDate *updatedAt;
@property NSInteger voteCount;
@property BOOL voted;
*/
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.key forKey:keyId];
    [aCoder encodeObject:title forKey:keyTitle];
    [aCoder encodeObject:detail forKey:keyDetail];
    [aCoder encodeInteger:userId forKey:keyUserId];
    [aCoder encodeInteger:sessionId forKey:keySessionId];
    [aCoder encodeObject:createdAt forKey:keyUpdateAt];
    [aCoder encodeObject:updatedAt forKey:keyUpdateAt];
    [aCoder encodeInteger:voteCount forKey:keyVoteCount];
    [aCoder encodeBool:voted forKey:keyVoted];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    int qId = [aDecoder decodeIntForKey:keyId];
    NSString *ptitle = [aDecoder decodeObjectForKey:keyTitle];
    NSString *pdetail = [aDecoder decodeObjectForKey:keyDetail];
    NSInteger uid = [aDecoder decodeIntegerForKey:keyUserId];
    NSInteger sid = [aDecoder decodeIntegerForKey:keySessionId];
    NSDate *createDate = [aDecoder decodeObjectForKey:keyCreateAt];
    NSDate *updateDate = [aDecoder decodeObjectForKey:keyUpdateAt];
    NSInteger vcounter = [aDecoder decodeIntegerForKey:keyVoteCount];
    BOOL bVote = [aDecoder decodeBoolForKey:keyVoted];
    if (self) {
        self.key = qId;
        self.title = ptitle;
        self.detail =pdetail;
        self.userId = uid;
        self.sessionId = sid;
        self.createdAt = createDate;
        self.updatedAt = updateDate;
        self.voteCount = vcounter;
        self.voted = bVote;
        return self;
    }
    return self;
}
@end
