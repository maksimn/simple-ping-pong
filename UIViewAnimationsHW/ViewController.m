//
//  ViewController.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 26/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIView *someView;

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@property (nonatomic, assign) CGFloat v;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    self.v = 1.f;
    
    self.someView = [[UIView alloc] initWithFrame:CGRectMake(100.f, 120.f, 100.f, 100.f)];
    self.someView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:self.someView];
    
    self.someView.layer.masksToBounds = YES;
    self.someView.layer.cornerRadius = self.someView.frame.size.width / 2;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(performTimerAnimation) userInfo:nil repeats:YES];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void) performTimerAnimation
{
    CGFloat dt = 2.f;
    CGFloat nextX = self.someView.center.x;
    CGFloat nextY = self.someView.center.y + self.v * dt;
    
    if (nextY > self.screenHeight)
    {
        self.v = -self.v;
    }
    else if (nextY < 0)
    {
        self.v = -self.v;
    }
    
    self.someView.center = CGPointMake(nextX, nextY);
}


@end
