//
//  AMXCollisionsDetector.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMXBall.h"
#import "AMXPaddle.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Класс, определяющий происшествие столкновений мяча с различными объектами игры.
 */
@interface AMXCollisionsDetector : NSObject

/**
 Метод, определяющий, произошло ли столкновение между мячом и ракеткой игрока

 @param ball - мяч
 @param gamerPaddle - ракетка игрока
 @return YES - в случае столкновения, NO - нет столкновения.
 */
+ (BOOL)doGamerPaddleAndBallHaveCollision:(AMXBall *)ball gamerPaddle:(AMXPaddle *) gamerPaddle;

/**
 Метод, определяющий, произошло ли столкновение между мячом и ракеткой компьютера
 
 @param ball - мяч
 @param aiPaddle - ракетка компьютера
 @return YES - в случае столкновения, NO - нет столкновения.
 */
+ (BOOL)doAiPaddleAndBallHaveCollision:(AMXBall *)ball aiPaddle:(AMXPaddle *) aiPaddle;

/**
 Метод, определяющий, забито ли очко в верхние ворота

 @param ball - мяч
 @return YES - если очко забито, NO - нет очка.
 */
+ (BOOL)detectScoreToUpperGoal:(AMXBall *)ball;

/**
 Метод, определяющий, забито ли очко в нижние ворота
 
 @param ball - мяч
 @return YES - если очко забито, NO - нет очка.
 */
+ (BOOL)detectScoreToLowerGoal:(AMXBall *)ball;

/**
 Метод для определения, произошло ли столкновение мяча с боковыми стенками поля для игры

 @param ball - мяч
 @return YES - в случае столкновения, NO - нет столкновения
 */
+ (BOOL)doVerticalWallAndBallHaveCollision:(AMXBall *)ball;

@end


NS_ASSUME_NONNULL_END

