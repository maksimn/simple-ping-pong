//
//  AMXGameScoreView.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMXGameScoreView : UIView

- (instancetype)init;

- (void)incrementGamerScore;

- (void)incrementAiScore;

@end

NS_ASSUME_NONNULL_END
