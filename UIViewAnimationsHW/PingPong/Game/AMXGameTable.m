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
#import "AMXAiPaddle.h"
#import "AMXGamerPaddle.h"
#import "AMXValues.h"
#import "AMXGameSettingsView.h"
#import "AMXTranstions.h"
#import "AMXGameScoreView.h"


@interface AMXGameTable ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) AMXBall *ball;
@property (nonatomic, strong) AMXGamerPaddle *gamerPaddle;
@property (nonatomic, strong) AMXAiPaddle *aiPaddle;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *settingsButton;
@property (nonatomic, strong) AMXGameSettingsView *gameSettingsView;
@property (nonatomic, strong) AMXGameScoreView *gameScoreView;

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
    [self prepareSettingsButton];
    [self preparePaddles];
    [self prepareBall];
    [self prepareGameScoreView];
    [self startTimer];
}

- (void)nextGameFrame
{
    [self.ball move:self.gamerPaddle aiPaddle:self.aiPaddle];
    [self.aiPaddle move:self.ball.center.x screenWidth:self.screenWidth];
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
    
    self.gamerPaddle = [[AMXGamerPaddle alloc] initWith:gamerPaddleInitX y:gamerPaddleInitY];
    [self addSubview:self.gamerPaddle];
    
    self.aiPaddle = [[AMXAiPaddle alloc] initWith:gamerPaddleInitX y:35];
    self.aiPaddle.velocity = aiPaddleDefaultVelocity;
    [self addSubview:self.aiPaddle];
}

- (void)prepareBall
{
    self.ball = [[AMXBall alloc] initWithPosition:CGPointMake(ballInitX, ballInitY) velocity:CGPointMake(ballInitVelocityX, ballInitVelocityY) color:UIColor.blueColor];
    __weak typeof(self) weakSelf = self;
    self.ball.onScoreCallback = ^(BOOL scoreToUpperGoal) {
        if (scoreToUpperGoal)
        {
            [weakSelf.gameScoreView incrementGamerScore];
        }
        else
        {
            [weakSelf.gameScoreView incrementAiScore];
        }
    };
    [self addSubview:self.ball];
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(nextGameFrame)
                                                userInfo:nil repeats:YES];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)prepareSettingsButton
{
    self.settingsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.settingsButton.frame = CGRectMake(40.0, CGRectGetMidY(self.view.frame) - 15.0, 40.0, 30.0);
    self.settingsButton.backgroundColor = [UIColor cyanColor];
    [self.settingsButton setTitle:@"||" forState:UIControlStateNormal];
    [self.settingsButton addTarget:self action:@selector(showSettings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.settingsButton];
}

- (void)prepareGameScoreView
{
    self.gameScoreView = [[AMXGameScoreView alloc] init];
    [self addSubview:self.gameScoreView];
}

- (void)showSettings
{
    [self stopTimer];
    self.gameSettingsView = [[AMXGameSettingsView alloc] initWithBallVelocity:CGPointMake(self.ball.velocity.x, self.ball.velocity.y) aiPaddleVelocity:self.aiPaddle.velocity];
    __weak typeof(self) weakSelf = self;
    self.gameSettingsView.backToGameCallback = ^(CGPoint ballVelocity, CGFloat aiPaddleVelocity) {
        weakSelf.ball.velocity = ballVelocity;
        weakSelf.aiPaddle.velocity = aiPaddleVelocity;
        [weakSelf.view.layer addAnimation:[AMXTranstions createTransitionToHideSettings] forKey:kCATransition];
        [weakSelf startTimer];
    };
    [self.view addSubview:self.gameSettingsView];
    [self.view.layer addAnimation:[AMXTranstions createTransitionToShowSettings] forKey:kCATransition];
}

@end

