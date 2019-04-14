//
//  AMXGameTable.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 13/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXGameTable.h"
#import "AMXBall.h"

const CGFloat dt = 0.2;
const CGFloat ballRadius = 25.f;
const CGFloat ballInitX = 100.f;
const CGFloat ballInitY = 120.f;
const CGFloat ballInitVelocityX = 0.1;
const CGFloat ballInitVelocityY = 0.17;
const double timeInterval = 0.0002;


@interface AMXGameTable ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) AMXBall *ball;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@end


@implementation AMXGameTable

- (instancetype)initWithView:(UIView *) view
{
    if (self = [super init])
    {
        self.view = view;
        self.screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    }
    
    return self;
}

- (void)performTimerAnimation
{
    [self nextGameFrame];
}

- (void)stopTimerAnimation
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)start
{
    self.ball = [[AMXBall alloc] initWith:ballInitX y:ballInitY u:ballInitVelocityX v:ballInitVelocityY color:UIColor.blueColor radius:ballRadius];
    
    [self.view addSubview:self.ball];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(performTimerAnimation) userInfo:nil repeats:YES];
}

- (void)nextGameFrame
{
    CGFloat ballX = self.ball.center.x + self.ball.velocityX * dt;
    CGFloat ballY = self.ball.center.y + self.ball.velocityY * dt;
    CGFloat ballRadius = self.ball.bounds.size.width / 2;
    
    if (ballY + ballRadius > self.screenHeight || ballY - ballRadius < 0)
    {
        self.ball.velocityY = -self.ball.velocityY;
    }
    if (ballX + ballRadius > self.screenWidth || ballX - ballRadius < 0)
    {
        self.ball.velocityX = - self.ball.velocityX;
    }
    
    self.ball.center = CGPointMake(ballX, ballY);
}


@end

