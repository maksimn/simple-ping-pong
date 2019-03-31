//
//  Ball.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 31/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface Ball : UIView

@property (nonatomic, assign) CGFloat positionX;
@property (nonatomic, assign) CGFloat positionY;
@property (nonatomic, assign) CGFloat velocityX;
@property (nonatomic, assign) CGFloat velocityY;
@property (nonatomic, assign) CGFloat radius;

- (instancetype)initWith:(CGFloat) x y:(CGFloat) y u:(CGFloat) u v:(CGFloat) v
                  color:(UIColor *) color radius:(CGFloat) radius;
- (void)move;

@end


NS_ASSUME_NONNULL_END

