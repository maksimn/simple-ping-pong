//
//  AMXPaddle.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/**
 Базовый класс ракетки для игры в пинг-понг. Определяет внешний вид и положение ракетки на экране.
 */
@interface AMXPaddle : UIView

/**
 Инициализатор объекта ракетки

 @param x - начальная координата левого края ракетки
 @param y - координата верхнего края ракетки на экране
 @return экземпляр базовой ракетки
 */
- (instancetype)initWith:(CGFloat) x y:(CGFloat) y;

@end


NS_ASSUME_NONNULL_END

