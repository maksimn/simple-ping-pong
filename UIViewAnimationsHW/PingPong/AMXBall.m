//
//  Ball.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 31/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXBall.h"


@implementation AMXBall

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y u:(CGFloat) u v:(CGFloat) v
                   color:(UIColor *) color radius:(CGFloat) radius
{
    self = [super initWithFrame:CGRectMake(x, y, 2 * radius, 2 * radius)];
    
    if (self)
    {
        self.velocityX = u;
        self.velocityY = v;
        self.backgroundColor = color;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = radius;
    }
    
    return self;
}

@end

