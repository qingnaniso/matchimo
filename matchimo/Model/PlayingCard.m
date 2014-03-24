//
//  PlayingCard.m
//  matchimo
//
//  Created by 祁庆男 on 14-3-20.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;
- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [self.suit stringByAppendingString:(rankStrings[self.rank])];
}

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            
            if (otherCard.rank == self.rank) {
                score = 4;
            } else if ([otherCard.suit isEqualToString:self.suit]){
                score = 1;
            }
        }
       
    }
    
    return score;
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSArray *)validSuits
{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

+(NSUInteger)maxRank
{
    return [[PlayingCard rankStrings] count] - 1;

}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:(suit)]) {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?" ;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@end
