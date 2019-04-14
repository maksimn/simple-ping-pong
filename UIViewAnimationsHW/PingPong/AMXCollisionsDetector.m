//
//  AMXCollisionsDetector.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXCollisionsDetector.h"


@implementation AMXCollisionsDetector


- (BOOL)doGamerPaddleAndBallHaveCollision:(AMXBall *)ball gamerPaddle:(AMXPaddle *) gamerPaddle dt:(CGFloat) dt
{
    CGFloat ballCenterX = ball.center.x;
    CGFloat paddleMinX = CGRectGetMinX(gamerPaddle.frame);
    CGFloat paddleMaxX = CGRectGetMaxX(gamerPaddle.frame);
    CGFloat ballMaxY = CGRectGetMaxY(ball.frame);
    CGFloat ballNextMaxY = ballMaxY + ball.velocityY * dt;
    CGFloat paddleMinY = CGRectGetMinY(gamerPaddle.frame);
    
    if (ball.velocityY > 0 && ballCenterX >= paddleMinX && ballCenterX <= paddleMaxX && ballMaxY <= paddleMinY && ballNextMaxY >= paddleMinY)
    {
        return YES;
    }
    
    return NO;
}

@end
