//
//  AMXGameSettingsView.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXGameSettingsView.h"

@implementation AMXGameSettingsView

- (instancetype)init
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)])
    {
        self.backgroundColor = UIColor.lightGrayColor;
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

@end
