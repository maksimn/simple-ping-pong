//
//  AMXGameTable.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 13/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXGameTable.h"
#import "AMXBall.h"


const CGFloat ballRadius = 25.f;
const CGFloat ballInitX = 100.f;
const CGFloat ballInitY = 120.f;
const CGFloat ballInitVelocityX = 0.1;
const CGFloat ballInitVelocityY = 0.17;
const double timeInterval = 0.0002;


@interface AMXGameTable ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) AMXBall *ball;
@property (nonatomic, strong) NSTimer *timer;

@end


@implementation AMXGameTable

- (instancetype)initWithView:(UIView *) view
{
    if (self = [super init])
    {
        self.view = view;
    }
    
    return self;
}

- (void)performTimerAnimation
{
    [self.ball move];
}

- (void)stopTimerAnimation
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)start
{
    self.ball = [[AMXBall alloc] initWith:ballInitX y:ballInitY u:ballInitVelocityX v:ballInitVelocityY color:UIColor.blueColor radius:ballRadius];
    
    [self.view addSubview:self.ball];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(performTimerAnimation) userInfo:nil repeats:YES];
}

@end

