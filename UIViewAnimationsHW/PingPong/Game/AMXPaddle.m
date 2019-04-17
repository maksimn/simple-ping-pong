//
//  AMXPaddle.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXPaddle.h"
#import "AMXValues.h"


static const CGFloat paddleHeight = 15;
static const CGFloat paddleWidth = 80;


@implementation AMXPaddle

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y
{
    self = [super initWithFrame:CGRectMake(x, y, paddleWidth, paddleHeight)];
    
    if (self)
    {
        self.backgroundColor = UIColor.darkGrayColor;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 7;
    }
    
    return self;
}

@end

