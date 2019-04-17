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
const float aiPaddleMaxVelocity = 8;

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
        self.ballVelocitySlider.value = [self ballVelocityToSliderValue];
        [self addSubview:self.ballVelocitySlider];
        
        UILabel *aiPaddleVelocityLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 140, 300, 30)];
        aiPaddleVelocityLabel.text = @"СКОРОСТЬ РАКЕТКИ ВРАГА:";
        [self addSubview: aiPaddleVelocityLabel];
        
        self.aiPaddleVelocitySlider = [[UISlider alloc] initWithFrame:CGRectMake(44, 180, 200, 30)];
        self.aiPaddleVelocitySlider.value = [self aiPaddleVelocityToSliderValue];
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
    float ballVelocitySliderValue = self.ballVelocitySlider.value;
    float aiPaddleVelocitySliderValue = self.aiPaddleVelocitySlider.value;
    CGPoint ballVelocity = [self ballVelocitySliderValueToBallVelocity:ballVelocitySliderValue];
    CGFloat aiPaddleVelocity = [self aiPaddleVelocitySliderValueToAiPaddleVelocity:aiPaddleVelocitySliderValue];
    [self removeFromSuperview];    
    self.backToGameCallback(ballVelocity, aiPaddleVelocity);
}

- (float)ballVelocityToSliderValue
{
    return (sqrt(self.ballVelocity.x * self.ballVelocity.x + self.ballVelocity.y * self.ballVelocity.y) - ballMinVelocity)/
            (ballMaxVelocity - ballMinVelocity);
}

- (float)aiPaddleVelocityToSliderValue
{
    return (self.aiPaddleVelocity - aiPaddleMinVelocity) / (aiPaddleMaxVelocity - aiPaddleMinVelocity);
}

- (CGPoint)ballVelocitySliderValueToBallVelocity:(float) value
{
    CGFloat ballVelocityModule = sqrt(self.ballVelocity.x * self.ballVelocity.x + self.ballVelocity.y * self.ballVelocity.y);
    CGFloat cosAlpha = self.ballVelocity.x / ballVelocityModule;
    CGFloat sinAlpha = self.ballVelocity.y / ballVelocityModule;
    CGFloat newBallVelocityModule = ballMinVelocity + value * (ballMaxVelocity - ballMinVelocity);
    return CGPointMake(newBallVelocityModule * cosAlpha, newBallVelocityModule * sinAlpha);
}

- (CGFloat)aiPaddleVelocitySliderValueToAiPaddleVelocity:(float) value
{
    return aiPaddleMinVelocity + value * (aiPaddleMaxVelocity - aiPaddleMinVelocity);
}

@end
