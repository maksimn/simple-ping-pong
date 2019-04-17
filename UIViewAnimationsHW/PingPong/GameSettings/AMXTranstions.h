//
//  AMXTranstions.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMXTranstions : NSObject

+ (CATransition *)createTransitionToShowSettings;
+ (CATransition *)createTransitionToHideSettings;


@end

NS_ASSUME_NONNULL_END
