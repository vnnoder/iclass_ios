//
//  Question.m
//  iclass
//
//  Created by michael on 1/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize key;
@synthesize title;
@synthesize detail;
@synthesize owner;
@synthesize session;
@synthesize createdAt;
@synthesize updatedAt;
@synthesize vote;

-(NSComparisonResult) compareUpdateDate:(Question *) question
{
    return [updatedAt compare:[question updatedAt]];
}

-(NSComparisonResult) compareVote:(Question *) question
{
    return vote < [question vote];
}

@end
