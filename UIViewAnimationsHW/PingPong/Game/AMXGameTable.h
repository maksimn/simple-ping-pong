//
//  AMXGameTable.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 13/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/**
 Класс стола для игры в пинг-понг
 */
@interface AMXGameTable : UIView

/**
 Инициализатор объекта

 @param view - свойство view от базового ViewController
 @return экземпляр стола для игры
 */
- (instancetype)initWithView:(UIView *) view;

/**
 Метод запуска игры в пинг-понг
 */
- (void)start;

@end


NS_ASSUME_NONNULL_END

