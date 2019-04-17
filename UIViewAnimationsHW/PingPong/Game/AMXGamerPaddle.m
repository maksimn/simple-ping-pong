//
//  AMXGamerPaddle.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXGamerPaddle.h"

@interface AMXGamerPaddle ()

@property (nonatomic, assign) BOOL isTouchStartedInsidePaddleHorizontally;

@end

@implementation AMXGamerPaddle

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y
{
    return self = [super initWith:x y:y];
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

@end
