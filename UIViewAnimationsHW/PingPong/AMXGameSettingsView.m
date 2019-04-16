//
//  AMXGameSettingsView.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXGameSettingsView.h"


@interface AMXGameSettingsView ()

@property (nonatomic, strong) UISlider *ballVelocitySlider;
@property (nonatomic, strong) UISlider *aiPaddleVelocitySlider;
@property (nonatomic, strong) UIButton *backButton;

@end


@implementation AMXGameSettingsView

- (instancetype)init
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)])
    {
        CGFloat colorValue = 0.8;
        self.backgroundColor = [[UIColor alloc] initWithRed:colorValue green:colorValue blue:colorValue alpha:1.0];
        
        UILabel *ballVelocityLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 50, 200, 30)];
        ballVelocityLabel.text = @"СКОРОСТЬ ШАРИКА:";
        [self addSubview: ballVelocityLabel];
        
        self.ballVelocitySlider = [[UISlider alloc] initWithFrame:CGRectMake(44, 80, 200, 30)];
        [self addSubview:self.ballVelocitySlider];
        
        UILabel *aiPaddleVelocityLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 140, 300, 30)];
        aiPaddleVelocityLabel.text = @"СКОРОСТЬ РАКЕТКИ ВРАГА:";
        [self addSubview: aiPaddleVelocityLabel];
        
        self.aiPaddleVelocitySlider = [[UISlider alloc] initWithFrame:CGRectMake(44, 180, 200, 30)];
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

+ (CATransition *)createTransitionToShowSettings
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    return transition;
}

- (void)backToGame
{
    
}

@end
