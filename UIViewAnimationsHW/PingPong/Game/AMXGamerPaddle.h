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

@interface AMXGamerPaddle : AMXPaddle

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y;
- (void)touchesBegan:(UITouch *) touch gameTable:(UIView *) gameTable;
- (void)touchesMoved:(UITouch *) touch gameTable:(UIView *) gameTable screenWidth:(CGFloat) screenWidth;
- (void)touchesEnded;



@end

NS_ASSUME_NONNULL_END
