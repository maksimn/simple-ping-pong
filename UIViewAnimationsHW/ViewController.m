//
//  ViewController.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 26/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "ViewController.h"

const CGFloat ballDiameter = 50.f;
const CGFloat ballInitX = 100.f;
const CGFloat ballInitY = 120.f;
const CGFloat ballInitVelocityX = 0.1;
const CGFloat ballInitVelocityY = 0.17;
const double timeInterval = 0.0002;

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIView *ballView;

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@property (nonatomic, assign) CGFloat ballVelocityX;
@property (nonatomic, assign) CGFloat ballVelocityY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    self.ballVelocityX = ballInitVelocityX;
    self.ballVelocityY = ballInitVelocityY;
    
    self.ballView = [[UIView alloc] initWithFrame:CGRectMake(ballInitX, ballInitY, ballDiameter, ballDiameter)];
    self.ballView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:self.ballView];
    
    self.ballView.layer.masksToBounds = YES;
    self.ballView.layer.cornerRadius = self.ballView.frame.size.width / 2;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(performTimerAnimation) userInfo:nil repeats:YES];
}

- (void) performTimerAnimation
{
    CGFloat dt = 0.2;
    CGFloat nextX = self.ballView.center.x + self.ballVelocityX * dt;
    CGFloat nextY = self.ballView.center.y + self.ballVelocityY * dt;
    
    if (nextY + ballDiameter / 2 > self.screenHeight || nextY - ballDiameter / 2 < 0)
    {
        self.ballVelocityY = -self.ballVelocityY;
    }
    if (nextX + ballDiameter / 2 > self.screenWidth || nextX - ballDiameter / 2 < 0)
    {
        self.ballVelocityX = - self.ballVelocityX;
    }
    
    self.ballView.center = CGPointMake(nextX, nextY);
}


@end
