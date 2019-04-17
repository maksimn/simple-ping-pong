//
//  AMXGamerPaddle.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AMXPaddle.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Класс ракетки игрока (пользователя)
 */
@interface AMXGamerPaddle : AMXPaddle

/**
 Инициализатор для ракетки игрока

 @param x - координата левого края ракетки по оси Х
 @param y - координата верхнего края ракетки по оси У
 @return экземпляр ракетки
 */
- (instancetype)initWith:(CGFloat) x y:(CGFloat) y;

/**
 Метод, вызываемый в начале касания пальцем игрока экрана устройства

 @param touch - объект UITouch, описывающий касание
 @param gameTable - объект стола для игры
 */
- (void)touchesBegan:(UITouch *) touch gameTable:(UIView *) gameTable;

/**
 Метод, вызываемый при перемещении пальца игрока по экрану устройства
 
 @param touch - объект UITouch, описывающий касание
 @param gameTable - объект стола для игры
 @param screenWidth - ширина экрана устройства
 */
- (void)touchesMoved:(UITouch *) touch gameTable:(UIView *) gameTable screenWidth:(CGFloat) screenWidth;

/**
 Метод, вызываемый при завершении касания пальцем игрока экрана устройства
 */
- (void)touchesEnded;


@end


NS_ASSUME_NONNULL_END

