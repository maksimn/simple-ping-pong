//
//  AMXGameScoreView.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/**
 Элемент для представления счёта игры на экране
 */
@interface AMXGameScoreView : UIView

- (instancetype)init;

/**
 Увеличить счёт игрока на единицу
 */
- (void)incrementGamerScore;

/**
 Увеличить счёт компьютера на единицу
 */
- (void)incrementAiScore;

@end


NS_ASSUME_NONNULL_END

