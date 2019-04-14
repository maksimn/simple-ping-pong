//
//  AMXCollisionsDetector.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXCollisionsDetector.h"


@implementation AMXCollisionsDetector


+ (BOOL)doGamerPaddleAndBallHaveCollision:(AMXBall *)ball gamerPaddle:(AMXPaddle *) gamerPaddle dt:(CGFloat) dt
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

+ (BOOL)doAiPaddleAndBallHaveCollision:(AMXBall *)ball aiPaddle:(AMXPaddle *) aiPaddle dt:(CGFloat) dt
{
    CGFloat ballCenterX = ball.center.x;
    CGFloat paddleMinX = CGRectGetMinX(aiPaddle.frame);
    CGFloat paddleMaxX = CGRectGetMaxX(aiPaddle.frame);
    CGFloat ballMinY = CGRectGetMinY(ball.frame);
    CGFloat ballNextMinY = ballMinY + ball.velocityY * dt;
    CGFloat paddleMaxY = CGRectGetMaxY(aiPaddle.frame);
    
    if (ball.velocityY < 0 && ballCenterX >= paddleMinX && ballCenterX <= paddleMaxX && ballMinY >= paddleMaxY && ballNextMinY <= paddleMaxY)
    {
        return YES;
    }
    
    return NO;
}

+ (BOOL)doVerticalWallAndBallHaveCollision:(AMXBall *)ball dt:(CGFloat) dt
{
    CGFloat ballX = ball.center.x + ball.velocityX * dt;
    CGFloat ballRadius = ball.bounds.size.width / 2;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    if (ballX + ballRadius > screenWidth || ballX - ballRadius < 0)
    {
        return YES;
    }
    
    return NO;
}

+ (BOOL)doHorizontalWallAndBallHaveCollision:(AMXBall *)ball dt:(CGFloat) dt
{
    CGFloat ballY = ball.center.y + ball.velocityY * dt;
    CGFloat ballRadius = ball.bounds.size.width / 2;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    if (ballY + ballRadius > screenHeight || ballY - ballRadius < 0)
    {
        return YES;
    }
    
    return NO;
}

@end
