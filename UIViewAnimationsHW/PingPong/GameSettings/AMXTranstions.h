//
//  AMXTranstions.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


/**
 Класс для получения объектов CATranstions для игры.
 */
@interface AMXTranstions : NSObject

/**
 Получить объект, определяющий анимацию перехода от экрана с игрой на экран настроек.

 @return указатель на объект данного CATransition
 */
+ (CATransition *)createTransitionToShowSettings;

/**
 Получить объект, определяющий анимацию перехода от экрана настроек на экран игры.
 
 @return указатель на объект данного CATransition
 */
+ (CATransition *)createTransitionToHideSettings;


@end


NS_ASSUME_NONNULL_END

