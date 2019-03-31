//
//  ViewController.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 26/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "ViewController.h"
#import "PingPong/Ball.h"

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
const CGFloat dt = 0.2;

@interface ViewController ()

@property (nonatomic, strong) Ball *ball;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    Ball *ball = [[Ball alloc] initWith:ballInitX y:ballInitY radius:ballRadius];
    
    ball.backgroundColor = UIColor.blueColor;
    ball.velocityX = ballInitVelocityX;
    ball.velocityY = ballInitVelocityY;
    
    [self.view addSubview:ball];
    
    ball.layer.masksToBounds = YES;
    ball.layer.cornerRadius = ball.frame.size.width / 2;
    
    self.ball = ball;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(performTimerAnimation) userInfo:nil repeats:YES];
}

- (void)performTimerAnimation
{
    CGFloat nextX = self.ball.center.x + self.ball.velocityX * dt;
    CGFloat nextY = self.ball.center.y + self.ball.velocityY * dt;
    
    if (nextY + ballRadius > self.screenHeight || nextY - ballRadius < 0)
    {
        self.ball.velocityY = -self.ball.velocityY;
    }
    if (nextX + ballRadius > self.screenWidth || nextX - ballRadius < 0)
    {
        self.ball.velocityX = - self.ball.velocityX;
    }
    
    self.ball.center = CGPointMake(nextX, nextY);
}

- (void)stopTimerAnimation
{
    [self.timer invalidate];
    self.timer = nil;
}


@end
