//
//  AMXTranstions.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXTranstions.h"

@implementation AMXTranstions

+ (CATransition *)createTransitionToShowSettings
{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.2;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    return transition;
}

+ (CATransition *)createTransitionToHideSettings
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.6;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.subtype = kCATransitionFromLeft;
    transition.type = kCATransitionReveal;
    return transition;
}

@end
