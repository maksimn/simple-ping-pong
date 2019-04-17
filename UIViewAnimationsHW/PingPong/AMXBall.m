//
//  Ball.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 31/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXBall.h"
#import "AMXPaddle.h"
#import "AMXCollisionsDetector.h"
#import "AMXValues.h"


@implementation AMXBall

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y u:(CGFloat) u v:(CGFloat) v
                   color:(UIColor *) color radius:(CGFloat) radius
{
    self = [super initWithFrame:CGRectMake(x, y, 2 * radius, 2 * radius)];
    
    if (self)
    {
        self.velocityX = u;
        self.velocityY = v;
        self.backgroundColor = color;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = radius;
    }
    
    return self;
}

- (void)move:(AMXPaddle *) gamerPaddle aiPaddle:(AMXPaddle *) aiPaddle gameScoreView:(AMXGameScoreView *) gameScoreView
{
    if ([AMXCollisionsDetector doGamerPaddleAndBallHaveCollision:self gamerPaddle:gamerPaddle] ||
        [AMXCollisionsDetector doAiPaddleAndBallHaveCollision:self aiPaddle:aiPaddle])
    {
        self.velocityY = -self.velocityY;
        return;
    }
    
    BOOL hasScoreToUpperGoal = [AMXCollisionsDetector detectScoreToUpperGoal:self];
    BOOL hasScoreToLowerGoal = [AMXCollisionsDetector detectScoreToLowerGoal:self];
    
    if (hasScoreToLowerGoal || hasScoreToUpperGoal)
    {
        if (hasScoreToUpperGoal)
        {
            [gameScoreView incrementGamerScore];
        }
        else
        {
            [gameScoreView incrementAiScore];
        }
        self.center = CGPointMake(ballInitX, ballInitY);
        self.velocityX = -self.velocityX;
        self.velocityY = -self.velocityY;
        return;
    }
    if ([AMXCollisionsDetector doVerticalWallAndBallHaveCollision:self])
    {
        self.velocityX = -self.velocityX;
        return;
    }
    
    CGFloat ballX = self.center.x + self.velocityX * dt;
    CGFloat ballY = self.center.y + self.velocityY * dt;
    self.center = CGPointMake(ballX, ballY);
}

@end

