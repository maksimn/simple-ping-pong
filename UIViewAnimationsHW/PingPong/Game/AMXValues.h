//
//  AMXValues.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 15/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


#ifndef AMXValues_h
#define AMXValues_h


extern const CGFloat dt; /**< условная величина временного шага игры */
extern const CGFloat ballRadius; /**< радиус мяча для игры */
extern const CGFloat ballInitX; /**< начальная координата Х мяча */
extern const CGFloat ballInitY; /**< начальная координата Y мячв */
extern const CGFloat ballInitVelocityX; /**< начальная скорость мяча по оси Х */
extern const CGFloat ballInitVelocityY; /**< начальная скорость мяча по оси Y */
extern const double timeInterval; /**< интервал времени для таймера, обеспечивающего показ кадров игры */
extern const CGFloat aiPaddleDefaultVelocity; /**< значение по умолчанию скорости ракетки компьютера */


#endif /* AMXValues_h */
