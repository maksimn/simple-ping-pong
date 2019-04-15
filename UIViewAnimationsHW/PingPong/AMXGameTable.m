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
#import "AMXValues.h"


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

- (void)start
{
    [self preparePaddles];
    [self prepareBall];
    [self startTimer];
}

- (void)nextGameFrame
{
    [self.aiPaddle move:self.ball.center.x dt:dt];
    [self.ball move:self.gamerPaddle aiPaddle:self.aiPaddle dt:dt];
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

- (void)preparePaddles
{
    CGFloat gamerPaddleInitX = self.screenWidth / 2 - 40.0;
    CGFloat gamerPaddleInitY = self.screenHeight - 30;
    
    self.gamerPaddle = [[AMXPaddle alloc] initWith:gamerPaddleInitX y:gamerPaddleInitY];
    [self addSubview:self.gamerPaddle];
    
    self.aiPaddle = [[AMXPaddle alloc] initWith:gamerPaddleInitX y:35];
    [self addSubview:self.aiPaddle];
}

- (void)prepareBall
{
    self.ball = [[AMXBall alloc] initWith:ballInitX y:ballInitY u:ballInitVelocityX v:ballInitVelocityY
                                    color:UIColor.blueColor radius:ballRadius];
    [self addSubview:self.ball];
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(nextGameFrame)
                                                userInfo:nil repeats:YES];
}

- (void)stopTimerAnimation
{
    [self.timer invalidate];
    self.timer = nil;
}

@end

