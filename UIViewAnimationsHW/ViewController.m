//
//  ViewController.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 26/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "ViewController.h"
#import "PingPong/AMXBall.h"

/**
 Дз пока скидываю сюда: CoreAnimations, задачи:
 1) Создать игру пинг-понг, с возможностью приостановить/возобновить игру,
 вывести очки и AI.
 2) Реализовать пример CATransition
 */

const CGFloat ballRadius = 25.f;
const CGFloat ballInitX = 100.f;
const CGFloat ballInitY = 120.f;
const CGFloat ballInitVelocityX = 0.1;
const CGFloat ballInitVelocityY = 0.17;
const double timeInterval = 0.0002;

@interface ViewController ()

@property (nonatomic, strong) AMXBall *ball;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ball = [[AMXBall alloc] initWith:ballInitX y:ballInitY u:ballInitVelocityX v:ballInitVelocityY color:UIColor.blueColor radius:ballRadius];
    
    [self.view addSubview:self.ball];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(performTimerAnimation) userInfo:nil repeats:YES];
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


@end
