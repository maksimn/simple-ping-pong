//
//  AMXPaddle.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXPaddle.h"


static const CGFloat paddleHeight = 15;
static const CGFloat paddleWidth = 80;


@interface AMXPaddle ()

@property (nonatomic, assign) BOOL isTouchStartedInsidePaddleHorizontally;

@end


@implementation AMXPaddle

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y
{
    self = [super initWithFrame:CGRectMake(x, y, paddleWidth, paddleHeight)];
    
    if (self)
    {
        self.backgroundColor = UIColor.darkGrayColor;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 7;
    }
    
    return self;
}

- (void)touchesBegan:(UITouch *) touch gameTable:(UIView *) gameTable
{
    CGPoint point = [touch locationInView:gameTable];
    CGFloat touchX = point.x;
    
    if (touchX >= CGRectGetMinX(self.frame) && touchX <= CGRectGetMaxX(self.frame))
    {
        self.isTouchStartedInsidePaddleHorizontally = YES;
    }
}

- (void)touchesMoved:(UITouch *) touch gameTable:(UIView *) gameTable screenWidth:(CGFloat) screenWidth
{
    if (self.isTouchStartedInsidePaddleHorizontally)
    {
        CGPoint point = [touch locationInView:gameTable];
        
        point.x = point.x + gameTable.frame.origin.x;
        point.y = CGRectGetMidY(self.frame);
        
        CGFloat paddleHalfWidth = CGRectGetWidth(self.frame) / 2;
        
        
        if (point.x > paddleHalfWidth && point.x < screenWidth - paddleHalfWidth)
        {
            self.center = point;
        }
    }
}

- (void)touchesEnded
{
    self.isTouchStartedInsidePaddleHorizontally = NO;
}

- (void)move:(CGFloat) ballCenterX dt:(CGFloat) dt
{
    if (ballCenterX > self.center.x)
    {
        self.center = CGPointMake(self.center.x + self.velocity * dt, self.center.y);
    }
    else
    {
        self.center = CGPointMake(self.center.x - self.velocity * dt, self.center.y);
    }
}

@end

