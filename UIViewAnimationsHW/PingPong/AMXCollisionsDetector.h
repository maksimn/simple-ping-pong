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

@interface AMXCollisionsDetector : NSObject

+ (BOOL)doGamerPaddleAndBallHaveCollision:(AMXBall *)ball gamerPaddle:(AMXPaddle *) gamerPaddle;
+ (BOOL)doAiPaddleAndBallHaveCollision:(AMXBall *)ball aiPaddle:(AMXPaddle *) aiPaddle;
+ (BOOL)detectScoreToUpperGoal:(AMXBall *)ball;
+ (BOOL)detectScoreToLowerGoal:(AMXBall *)ball;
+ (BOOL)doVerticalWallAndBallHaveCollision:(AMXBall *)ball;

@end

NS_ASSUME_NONNULL_END
