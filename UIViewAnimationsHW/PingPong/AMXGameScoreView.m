//
//  AMXGameScoreView.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXGameScoreView.h"

@interface AMXGameScoreView ()

@property (nonatomic, assign) uint32_t gamerScore;
@property (nonatomic, assign) uint32_t aiScore;

@property (nonatomic, strong) UILabel *gamerScoreLabel;
@property (nonatomic, strong) UILabel *aiScoreLabel;

@end

@implementation AMXGameScoreView

- (instancetype)init
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    if (self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)])
    {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        self.opaque = NO;
        
        self.gamerScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.width / 2 - 10, 0.75 * size.height - 10, 25, 25)];
        self.gamerScoreLabel.text = @"0";
        self.gamerScoreLabel.font = [self.gamerScoreLabel.font fontWithSize:25];
        [self addSubview: self.gamerScoreLabel];
        
        self.aiScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.width / 2 - 10, 0.25 * size.height - 10, 25, 25)];
        self.aiScoreLabel.text = @"0";
        self.aiScoreLabel.font = [self.aiScoreLabel.font fontWithSize:25];
        [self addSubview: self.aiScoreLabel];
    }
    
    return self;
}

@end
