//
//  PlayingCard.h
//  matchimo
//
//  Created by 祁庆男 on 14-3-20.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
