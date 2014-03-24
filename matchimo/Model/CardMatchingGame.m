//
//  CardMatchingGame.m
//  matchimo
//
//  Created by 祁庆男 on 14-3-20.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards;//of Card

@end


@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self.cards = nil;
                break;
            }
            
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCHBONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index //primary logic here
{
    
    Card *card = [self cardAtIndex:index];//get the chosen card
    self.stats = [NSString stringWithFormat:@"翻牌花费1分"];
    if (!card.isMatched) {                //and the card is not matched
        
        if (card.isChosen) {
            self.stats = [NSString stringWithFormat:@""];//nor be chosen
            card.chosen = NO;
        } else {
            
            for (Card *otherCard in self.cards) { //find another card(first) which will be matched to the card
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];//match the two cards
                    if (matchScore) { //if the cards can be matched
                        self.stats = [NSString stringWithFormat:@"翻牌花费1分＋匹配成功奖励%i分!",matchScore * MATCHBONUS];
                        self.score += matchScore * MATCHBONUS; //get score a bonus
                        otherCard.matched = YES; //set the cards both are matched (disabled)
                        card.matched = YES;
                    } else { //if the cards cannot match then will reduce the score
                        self.stats = [NSString stringWithFormat:@"翻牌花费1分＋匹配失败惩罚%i分!",MISMATCH_PENALTY];
                        self.score -= MISMATCH_PENALTY; //punishment of mismatch
                        otherCard.chosen = NO; //first card will turn down and this new card will face up(later)
                    }
                    break; //? I think this code will not gonna be reached
                }
            }
            
            self.score -= COST_TO_CHOOSE;//whatever we chose will reduce 1 score
            card.Chosen = YES; //this card status will be chosen
        }
    }
    
}

@end
