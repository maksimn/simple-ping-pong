//
//  ViewController.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 26/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "ViewController.h"
#import "PingPong/AMXGameTable.h"


/**
 Дз пока скидываю сюда: CoreAnimations, задачи:
 1) Создать игру пинг-понг, с возможностью приостановить/возобновить игру,
 вывести очки и AI.
 2) Реализовать пример CATransition
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMXGameTable *gameTable = [[AMXGameTable alloc] initWithView:self.view];
    
    [gameTable start];
}

@end

