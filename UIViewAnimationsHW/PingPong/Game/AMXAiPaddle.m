//
//  AMXAiPaddle.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXAiPaddle.h"
#import "AMXValues.h"

@implementation AMXAiPaddle

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y
{
    return self = [super initWith:x y:y];
}

- (void)move:(CGFloat) ballCenterX screenWidth:(CGFloat) screenWidth
{
    CGFloat paddleHalfWidth = CGRectGetWidth(self.frame) / 2;
    
    if (ballCenterX > self.center.x)
    {
        CGFloat nextX = self.center.x + self.velocity * dt;
        if (nextX + paddleHalfWidth < screenWidth)
        {
            self.center = CGPointMake(nextX, self.center.y);
        }
    }
    else
    {
        CGFloat nextX = self.center.x - self.velocity * dt;
        if (nextX - paddleHalfWidth > 0)
        {
            self.center = CGPointMake(nextX, self.center.y);
        }
    }
}
@end
