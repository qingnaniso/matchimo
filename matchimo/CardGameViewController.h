//
//  CardGameViewController.h
//  matchimo
//
//  Created by 祁庆男 on 14-3-19.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCard.h"
#import "Deck.h"

@interface CardGameViewController : UIViewController


//protected
- (Deck *)createDeck;//abstract



@end
