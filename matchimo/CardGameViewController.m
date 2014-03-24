//
//  CardGameViewController.m
//  matchimo
//
//  Created by 祁庆男 on 14-3-19.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()


@property (nonatomic) int filpCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameStats;

@end




@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.CardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}



- (Deck *)createDeck
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSLog(@"一共多少张牌%zi",self.CardButtons.count);
    NSUInteger cardIndex = [self.CardButtons indexOfObject:sender]; //every sender actually is one CardButtons object.
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}
- (void)updateUI
{
    for (UIButton *cardButton in self.CardButtons) {
        NSUInteger cardButtonIndex = [self.CardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageFordCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"分数：%zi",self.game.score];
        self.gameStats.text = [self.game stats];
    }
}
- (IBAction)redeal {// 重新开始的button

    [self createDeck]; //新初始化一组牌
    self.game = nil;//游戏清零
    for (int i = 0; i < self.CardButtons.count; i++) {
        Card *card = [self.game cardAtIndex:i];
        card.chosen = NO;
        card.matched = NO;
    }
    [self updateUI];
    
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageFordCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
- (IBAction)segmentChange:(UISegmentedControl *)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            
            break;
        case 1:
            
            break;
            
        default:
            break;
    }
}

@end
