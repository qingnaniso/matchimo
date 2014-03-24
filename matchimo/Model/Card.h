//
//  Card.h
//  matchimo
//
//  Created by 祁庆男 on 14-3-20.
//  Copyright (c) 2014年 qiqingnan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic,getter = isChosen) BOOL chosen;

@property (nonatomic,getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
