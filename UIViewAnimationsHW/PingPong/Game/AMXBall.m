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

- (instancetype)initWithPosition:(CGPoint) position velocity:(CGPoint) velocity color:(UIColor *) color
{
    self = [super initWithFrame:CGRectMake(position.x, position.y, 2 * ballRadius, 2 * ballRadius)];
    
    if (self)
    {
        self.velocity = velocity;
        self.backgroundColor = color;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = ballRadius;
    }
    
    return self;
}

- (void)move:(AMXPaddle *) gamerPaddle aiPaddle:(AMXPaddle *) aiPaddle
{
    if ([AMXCollisionsDetector doGamerPaddleAndBallHaveCollision:self gamerPaddle:gamerPaddle] ||
        [AMXCollisionsDetector doAiPaddleAndBallHaveCollision:self aiPaddle:aiPaddle])
    {
        self.velocity = CGPointMake(self.velocity.x, -self.velocity.y);
        return;
    }
    
    BOOL hasScoreToUpperGoal = [AMXCollisionsDetector detectScoreToUpperGoal:self];
    BOOL hasScoreToLowerGoal = [AMXCollisionsDetector detectScoreToLowerGoal:self];
    
    if (hasScoreToLowerGoal || hasScoreToUpperGoal)
    {
        self.onScoreCallback(hasScoreToUpperGoal);
        self.center = CGPointMake(ballInitX, ballInitY);
        self.velocity = CGPointMake(-self.velocity.x, -self.velocity.y);
        return;
    }
    if ([AMXCollisionsDetector doVerticalWallAndBallHaveCollision:self])
    {
        self.velocity = CGPointMake(-self.velocity.x, self.velocity.y);
        return;
    }
    
    self.center = CGPointMake(self.center.x + self.velocity.x * dt, self.center.y + self.velocity.y * dt);
}

@end

