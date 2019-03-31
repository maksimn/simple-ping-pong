//
//  Ball.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 31/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "Ball.h"


@implementation Ball

- (instancetype)initWith:(CGFloat)x y:(CGFloat)y radius:(CGFloat)radius
{
    self = [super initWithFrame:CGRectMake(x, y, 2 * radius, 2 * radius)];
    
    return self;
}

@end

