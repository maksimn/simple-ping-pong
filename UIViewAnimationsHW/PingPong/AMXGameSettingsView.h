//
//  AMXGameSettingsView.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMXGameSettingsView : UIView

- (instancetype)initWithView:(UIView *) view;

+ (CATransition *)createTransitionToShowSettings;

@end

NS_ASSUME_NONNULL_END
