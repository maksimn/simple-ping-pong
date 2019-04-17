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


@interface AMXBall : UIView

@property (nonatomic, assign) CGFloat positionX;
@property (nonatomic, assign) CGFloat positionY;
@property (nonatomic, assign) CGFloat velocityX;
@property (nonatomic, assign) CGFloat velocityY;
@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, copy) void (^onScoreCallback)(BOOL scoreToUpperGoal);


/**
 Метод создания объекта шарика для игры
 
 @param x начальная координата по оси Х
 @param y начальная координата по оси Y
 @param u начальная скорость по оси Х
 @param v начальная скорость по оси Y
 @param color цвет шарика
 @param radius радиус шарика
 @return объект шарика для игры
 */
- (instancetype)initWith:(CGFloat) x y:(CGFloat) y u:(CGFloat) u v:(CGFloat) v
                  color:(UIColor *) color radius:(CGFloat) radius;

- (void)move:(AMXPaddle *) gamerPaddle aiPaddle:(AMXPaddle *) aiPaddle;

@end


NS_ASSUME_NONNULL_END

