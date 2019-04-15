//
//  AMXPaddle.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 14/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface AMXPaddle : UIView

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y;

- (void)touchesBegan:(UITouch *) touch gameTable:(UIView *) gameTable;
- (void)touchesMoved:(UITouch *) touch gameTable:(UIView *) gameTable screenWidth:(CGFloat) screenWidth;
- (void)touchesEnded;

- (void)move:(CGFloat) ballCenterX dt:(CGFloat) dt;

@end


NS_ASSUME_NONNULL_END

