//
//  Ball.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 31/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AMXPaddle.h"
#import "AMXGameScoreView.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Класс мяча для игры
 */
@interface AMXBall : UIView

@property (nonatomic, assign) CGPoint position; /**< координата мяча на экране */
@property (nonatomic, assign) CGPoint velocity; /**< скорость мяча */

@property (nonatomic, copy) void (^onScoreCallback)(BOOL scoreToUpperGoal); /**< коллбэк, вызываемый при забитии гола в те или иные ворота. Параметр - флаг, указывающий, что гол забит в верхние ворота если YES, в нижние - если NO. */


/**
 Инициализатор объекта мяча

 @param position - начальные координаты мяча
 @param velocity - начальная скорость мяча
 @param color - цвет мяча
 @return экземпляр мяча
 */
- (instancetype)initWithPosition:(CGPoint) position velocity:(CGPoint) velocity color:(UIColor *) color;

/**
 Метод, выполняющий перемещение мяча для следующего кадра игры на экране

 @param gamerPaddle - ракетка игрока, от положения которой зависит перемещение мяча (в случае столкновения между ними)
 @param aiPaddle - ракетка, управляемая компьютером, от положения которой также зависит перемещение мяча
 */
- (void)move:(AMXPaddle *) gamerPaddle aiPaddle:(AMXPaddle *) aiPaddle;

@end


NS_ASSUME_NONNULL_END

