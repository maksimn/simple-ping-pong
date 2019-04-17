//
//  AMXGameSettingsView.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/**
 Представление для работы с настройками игры
 */
@interface AMXGameSettingsView : UIView

/**
 Инициализатор представления для работы с настройками игры

 @param ballVelocity - модуль скорости мяча для игры
 @param aiPaddleVelocity - скорость ракетки компьютера
 @return объект представления
 */
- (instancetype)initWithBallVelocity:(CGPoint) ballVelocity aiPaddleVelocity:(CGFloat) aiPaddleVelocity;

@property (nonatomic, copy) void (^backToGameCallback)(CGPoint ballVelocity, CGFloat aiPaddleVelocity); /**< коллбэк, вызываемый при нажатии кнопки "Назад к игре" */


@end


NS_ASSUME_NONNULL_END

