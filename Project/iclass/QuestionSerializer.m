//
//  QuestionSerializer.m
//  iclass
//
//  Created by Ma Xiangmei on 12/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QuestionSerializer.h"
#import "Question.h"
#import "JSON.h"

@implementation QuestionSerializer

/**
 authenticity_token:4zNYp67l0iTkfdASvR2NcZCzYanF0YPGD21pguhSOFQ=
 question[title]:testQA
 question[detail]:somethig to add
 */
- (NSDictionary *) toNSDictionary:(id)entity{
    Question *quest = (Question*)entity;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:[quest title] forKey:@"question[title]"];
    [dict setValue:[quest detail] forKey:@"question[detail]"];
    [dict setValue:[NSString stringWithFormat:@"%d",[quest sessionId]]  forKey:@"question[talk_id]"];
    [dict setValue:[NSString stringWithFormat:@"%d",[quest key]] forKey:@"question[id]"];
    return dict;
}

/**
 {
 "created_at": "2013-05-12T02:34:59Z",
 "detail": "somethig to add",
 "id": 3,
 "talk_id": null,
 "title": "testQA",
 "updated_at": "2013-05-12T02:34:59Z",
 "user_id": null
 }
 */

- (id) fromNSDictionary:(NSDictionary *) map{
    Question *entity = [[Question alloc]init];
    entity.title = [map objectForKey:@"title"];
    entity.detail= [map objectForKey:@"detail"];
    entity.key = [[map objectForKey: @"id"]intValue];
    entity.sessionId = [[map objectForKey:@"talk_id"]integerValue];
    
    return entity;
}

@end
