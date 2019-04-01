//
//  Ball.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 31/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXBall.h"


const CGFloat dt = 0.2;


@interface AMXBall ()

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@end


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
        self.screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    }
    
    return self;
}

- (void)move
{
    CGFloat nextX = self.center.x + self.velocityX * dt;
    CGFloat nextY = self.center.y + self.velocityY * dt;
    CGFloat ballRadius = self.bounds.size.width / 2;
    
    if (nextY + ballRadius > self.screenHeight || nextY - ballRadius < 0)
    {
        self.velocityY = -self.velocityY;
    }
    if (nextX + ballRadius > self.screenWidth || nextX - ballRadius < 0)
    {
        self.velocityX = - self.velocityX;
    }
    
    self.center = CGPointMake(nextX, nextY);
}

@end

