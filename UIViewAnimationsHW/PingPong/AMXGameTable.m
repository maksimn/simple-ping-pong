//
//  AMXGameTable.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 13/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXGameTable.h"
#import "AMXBall.h"
#import "AMXPaddle.h"


const CGFloat dt = 0.2;
const CGFloat ballRadius = 25.f;
const CGFloat ballInitX = 100.f;
const CGFloat ballInitY = 120.f;
const CGFloat ballInitVelocityX = 0.1;
const CGFloat ballInitVelocityY = 0.17;
const double timeInterval = 0.0002;

const CGFloat gamerPaddleOffsetY = 30;


@interface AMXGameTable ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) AMXBall *ball;
@property (nonatomic, strong) AMXPaddle *gamerPaddle;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;
@property (nonatomic, assign) BOOL isTouchStartedInsidePaddleHorizontally;

@end


@implementation AMXGameTable

- (instancetype)initWithView:(UIView *) view
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    if (self = [super initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)])
    {
        self.view = view;
        self.screenWidth = screenWidth;
        self.screenHeight = screenHeight;
        [self.view addSubview:self];
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
    CGFloat gamerPaddleInitX = self.screenWidth / 2 - 40.0;
    CGFloat gamerPaddleInitY = self.screenHeight - gamerPaddleOffsetY;
    self.gamerPaddle = [[AMXPaddle alloc] initWith:gamerPaddleInitX y:gamerPaddleInitY];
    [self addSubview:self.gamerPaddle];
    
    self.ball = [[AMXBall alloc] initWith:ballInitX y:ballInitY u:ballInitVelocityX v:ballInitVelocityY color:UIColor.blueColor radius:ballRadius];
    
    [self addSubview:self.ball];
    
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    
    CGFloat touchX = point.x;
    
    CGFloat paddleStartX = CGRectGetMinX(self.gamerPaddle.frame);
    CGFloat paddleEndX = CGRectGetMaxX(self.gamerPaddle.frame);
    
    if (touchX >= paddleStartX && touchX <= paddleEndX)
    {
        self.isTouchStartedInsidePaddleHorizontally = YES;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.isTouchStartedInsidePaddleHorizontally)
    {
        UITouch *touch = touches.anyObject;
        CGPoint point = [touch locationInView:self];
        
        point.x = point.x + self.frame.origin.x;
        point.y = CGRectGetMidY(self.gamerPaddle.frame);
        
        CGFloat paddleHalfWidth = CGRectGetWidth(self.gamerPaddle.frame) / 2;
        
        if (point.x > paddleHalfWidth && point.x < self.screenWidth - paddleHalfWidth)
        {
            self.gamerPaddle.center = point;
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isTouchStartedInsidePaddleHorizontally = NO;
}

@end

