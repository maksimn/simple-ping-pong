//
//  AMXAiPaddle.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 17/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AMXPaddle.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMXAiPaddle : AMXPaddle

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y;
- (void)move:(CGFloat) ballCenterX screenWidth:(CGFloat) screenWidth;

@property (nonatomic, assign) CGFloat velocity;
@end

NS_ASSUME_NONNULL_END
