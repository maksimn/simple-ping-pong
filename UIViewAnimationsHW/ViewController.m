//
//  ViewController.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 26/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "ViewController.h"
#import "PingPong/Game/AMXGameTable.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// Создание "стола для игры в пинг-понг"
    AMXGameTable *gameTable = [[AMXGameTable alloc] initWithView:self.view];
    
    /// Запуск игры
    [gameTable start];
}

@end

