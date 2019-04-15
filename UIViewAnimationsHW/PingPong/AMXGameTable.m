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
#import "AMXCollisionsDetector.h"


const CGFloat dt = 0.2;
const CGFloat ballRadius = 25.f;
const CGFloat ballInitX = 175.f;
const CGFloat ballInitY = 250.f;
const CGFloat ballInitVelocityX = 0.1;
const CGFloat ballInitVelocityY = 0.17;
const double timeInterval = 0.0002;
const CGFloat aiPaddleSpeed = 0.03;


@interface AMXGameTable ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) AMXBall *ball;
@property (nonatomic, strong) AMXPaddle *gamerPaddle;
@property (nonatomic, strong) AMXPaddle *aiPaddle;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

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

- (void)stopTimerAnimation
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)start
{
    CGFloat gamerPaddleInitX = self.screenWidth / 2 - 40.0;
    CGFloat gamerPaddleInitY = self.screenHeight - 30;
    self.gamerPaddle = [[AMXPaddle alloc] initWith:gamerPaddleInitX y:gamerPaddleInitY];
    [self addSubview:self.gamerPaddle];
    
    self.aiPaddle = [[AMXPaddle alloc] initWith:gamerPaddleInitX y:30];
    [self addSubview:self.aiPaddle];
    
    self.ball = [[AMXBall alloc] initWith:ballInitX y:ballInitY u:ballInitVelocityX v:ballInitVelocityY
                                    color:UIColor.blueColor radius:ballRadius];
    
    [self addSubview:self.ball];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(nextGameFrame)
                                                userInfo:nil repeats:YES];
}

- (void)nextGameFrame
{
    CGFloat ballCenterX = self.ball.center.x;
    if (ballCenterX > self.aiPaddle.center.x)
    {
        self.aiPaddle.center = CGPointMake(self.aiPaddle.center.x + aiPaddleSpeed * dt, self.aiPaddle.center.y);
    }
    else
    {
        self.aiPaddle.center = CGPointMake(self.aiPaddle.center.x - aiPaddleSpeed * dt, self.aiPaddle.center.y);
    }
    
    if ([AMXCollisionsDetector doGamerPaddleAndBallHaveCollision:self.ball gamerPaddle:self.gamerPaddle dt:dt] ||
        [AMXCollisionsDetector doAiPaddleAndBallHaveCollision:self.ball aiPaddle:self.aiPaddle dt:dt])
    {
        self.ball.velocityY = -self.ball.velocityY;
        return;
    }
    if ([AMXCollisionsDetector doHorizontalWallAndBallHaveCollision:self.ball dt:dt])
    {
        self.ball.center = CGPointMake(ballInitX, ballInitY);
        self.ball.velocityX = -self.ball.velocityX;
        self.ball.velocityY = -self.ball.velocityY;
        return;
    }
    if ([AMXCollisionsDetector doVerticalWallAndBallHaveCollision:self.ball dt:dt])
    {
        self.ball.velocityX = -self.ball.velocityX;
        return;
    }
    
    CGFloat ballX = self.ball.center.x + self.ball.velocityX * dt;
    CGFloat ballY = self.ball.center.y + self.ball.velocityY * dt;
    self.ball.center = CGPointMake(ballX, ballY);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.gamerPaddle touchesBegan:touches.anyObject gameTable:self];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.gamerPaddle touchesMoved:touches.anyObject gameTable:self screenWidth:self.screenWidth];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.gamerPaddle touchesEnded];
}

@end

