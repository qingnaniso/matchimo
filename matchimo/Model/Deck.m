//
//  Deck.m
//  matchimo
//
//  Created by 祁庆男 on 14-3-20.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (strong,nonatomic) NSMutableArray *cards;

@end


@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
    
    
}
-(void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}
-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    if ([self.cards count]) {// there why add this if?
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index]; //if self.cards == 0 then here whill cause array out of bound !
        [self.cards removeObject:randomCard];
        NSLog(@"%zd", [self.cards count]);
    }
    
    return randomCard;
}
@end
