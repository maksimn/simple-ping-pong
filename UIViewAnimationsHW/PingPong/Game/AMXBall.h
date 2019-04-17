//
//  Ball.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 31/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AMXPaddle.h"
#import "AMXGameScoreView.h"


NS_ASSUME_NONNULL_BEGIN


@interface AMXBall : UIView

@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, copy) void (^onScoreCallback)(BOOL scoreToUpperGoal);


/**
 <#Description#>

 @param position <#position description#>
 @param velocity <#velocity description#>
 @param color <#color description#>
 @return <#return value description#>
 */
- (instancetype)initWithPosition:(CGPoint) position velocity:(CGPoint) velocity color:(UIColor *) color;

- (void)move:(AMXPaddle *) gamerPaddle aiPaddle:(AMXPaddle *) aiPaddle;

@end


NS_ASSUME_NONNULL_END

