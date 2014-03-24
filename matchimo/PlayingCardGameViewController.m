//
//  PlayingCardGameViewController.m
//  matchimo
//
//  Created by 祁庆男 on 14-3-22.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
