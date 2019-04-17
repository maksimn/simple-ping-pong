//
//  AMXAiPaddle.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "AMXPaddle.h"


NS_ASSUME_NONNULL_BEGIN

/**
 Класс ракетки компьютера ("ИИ")
 */
@interface AMXAiPaddle : AMXPaddle

/**
 Инициализатор для ракетки компьютера
 
 @param x - координата левого края ракетки по оси Х
 @param y - координата верхнего края ракетки по оси У
 @return экземпляр ракетки
 */
- (instancetype)initWith:(CGFloat) x y:(CGFloat) y;

/**
 Метод перемещения ракетки по экрану для данного кадра игры на экране

 @param ballCenterX - Х-координата центра мяча на экране
 @param screenWidth - ширина поля для игры
 */
- (void)move:(CGFloat) ballCenterX screenWidth:(CGFloat) screenWidth;

@property (nonatomic, assign) CGFloat velocity; /**< скорость движения ракетки по оси Х */


@end


NS_ASSUME_NONNULL_END

