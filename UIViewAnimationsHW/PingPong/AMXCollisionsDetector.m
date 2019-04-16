//
//  AMXCollisionsDetector.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXCollisionsDetector.h"
#import "AMXValues.h"


@implementation AMXCollisionsDetector


+ (BOOL)doGamerPaddleAndBallHaveCollision:(AMXBall *)ball gamerPaddle:(AMXPaddle *) gamerPaddle
{
    CGFloat ballMaxY = CGRectGetMaxY(ball.frame);
    CGFloat ballNextMaxY = ballMaxY + ball.velocityY * dt;
    CGFloat paddleMinY = CGRectGetMinY(gamerPaddle.frame);
    
    return  (ball.velocityY > 0 && [self isBallXWithinPaddle:ball paddle:gamerPaddle] && ballMaxY <= paddleMinY &&
             ballNextMaxY >= paddleMinY) ? YES : NO;
}

+ (BOOL)doAiPaddleAndBallHaveCollision:(AMXBall *)ball aiPaddle:(AMXPaddle *) aiPaddle
{
    CGFloat ballMinY = CGRectGetMinY(ball.frame);
    CGFloat ballNextMinY = ballMinY + ball.velocityY * dt;
    CGFloat paddleMaxY = CGRectGetMaxY(aiPaddle.frame);
    
    return (ball.velocityY < 0 && [self isBallXWithinPaddle:ball paddle:aiPaddle] && ballMinY >= paddleMaxY &&
            ballNextMinY <= paddleMaxY) ? YES : NO;
}

+ (BOOL)doVerticalWallAndBallHaveCollision:(AMXBall *)ball
{
    CGFloat ballX = ball.center.x + ball.velocityX * dt;
    CGFloat ballRadius = ball.bounds.size.width / 2;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    return (ballX + ballRadius > screenWidth || ballX - ballRadius < 0) ? YES : NO;
}

+ (BOOL)doHorizontalWallAndBallHaveCollision:(AMXBall *)ball
{
    CGFloat ballY = ball.center.y + ball.velocityY * dt;
    CGFloat ballRadius = ball.bounds.size.width / 2;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    return ballY + ballRadius > screenHeight || ballY - ballRadius < 0 ? YES : NO;
}

+ (BOOL)isBallXWithinPaddle:(AMXBall *) ball paddle:(AMXPaddle *) paddle
{
    CGFloat ballCenterX = ball.center.x;
    CGFloat paddleMinX = CGRectGetMinX(paddle.frame);
    CGFloat paddleMaxX = CGRectGetMaxX(paddle.frame);
    CGFloat delta = 12;
    
    return ballCenterX + delta >= paddleMinX && ballCenterX - delta <= paddleMaxX ? YES : NO;
}

@end
