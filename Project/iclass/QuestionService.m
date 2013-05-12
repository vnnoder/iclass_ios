//
//  QuestionService.m
//  iclass
//
//  Created by Ma Xiangmei on 12/5/13.
//  Copyright (c) 2013 Wiely Rabin. All rights reserved.
//

#import "QuestionService.h"

@implementation QuestionService

- (id) init{
    return [super initWithPath:@"/questions" withSerializer:[[Question alloc]init]];
}
@end
