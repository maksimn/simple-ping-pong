//
//  AMXGameSettingsView.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#include "math.h"
#import "AMXGameSettingsView.h"
#import "AMXTranstions.h"


const float aiPaddleMinVelocity = 1;
const float aiPaddleMaxVelocity = 4;

const float ballMinVelocity = 5;
const float ballMaxVelocity = 20;


@interface AMXGameSettingsView ()

@property (nonatomic, strong) UISlider *ballVelocitySlider;
@property (nonatomic, strong) UISlider *aiPaddleVelocitySlider;
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, assign) CGPoint ballVelocity;
@property (nonatomic, assign) CGFloat aiPaddleVelocity;

@end


@implementation AMXGameSettingsView

- (instancetype)initWithBallVelocity:(CGPoint) ballVelocity aiPaddleVelocity:(CGFloat) aiPaddleVelocity
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)])
    {
        self.ballVelocity = ballVelocity;
        self.aiPaddleVelocity = aiPaddleVelocity;
        
        CGFloat colorValue = 0.8;
        self.backgroundColor = [[UIColor alloc] initWithRed:colorValue green:colorValue blue:colorValue alpha:1.0];
        
        UILabel *ballVelocityLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 50, 200, 30)];
        ballVelocityLabel.text = @"СКОРОСТЬ ШАРИКА:";
        [self addSubview: ballVelocityLabel];
        
        self.ballVelocitySlider = [[UISlider alloc] initWithFrame:CGRectMake(44, 80, 200, 30)];
        self.ballVelocitySlider.value = sqrt(ballVelocity.x * ballVelocity.x + ballVelocity.y + ballVelocity.y) /
                                        (ballMaxVelocity - ballMinVelocity);
        [self addSubview:self.ballVelocitySlider];
        
        UILabel *aiPaddleVelocityLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 140, 300, 30)];
        aiPaddleVelocityLabel.text = @"СКОРОСТЬ РАКЕТКИ ВРАГА:";
        [self addSubview: aiPaddleVelocityLabel];
        
        self.aiPaddleVelocitySlider = [[UISlider alloc] initWithFrame:CGRectMake(44, 180, 200, 30)];
        self.aiPaddleVelocitySlider.value = (self.aiPaddleVelocity - aiPaddleMinVelocity) /
                                            (aiPaddleMaxVelocity - aiPaddleMinVelocity);
        [self addSubview:self.aiPaddleVelocitySlider];
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.backButton.frame = CGRectMake(50, 240, 140.0, 30.0);
        self.backButton.backgroundColor = [UIColor cyanColor];
        [self.backButton setTitle:@"Назад к игре" forState:UIControlStateNormal];
        [self.backButton addTarget:self action:@selector(backToGame) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: self.backButton];
    }
    
    return self;
}

- (void)backToGame
{
    [self removeFromSuperview];    
    self.backToGameCallback();
}


@end
