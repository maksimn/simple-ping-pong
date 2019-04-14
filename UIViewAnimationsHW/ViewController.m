//
//  ViewController.m
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 26/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//


#import "ViewController.h"
#import "PingPong/AMXGameTable.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AMXGameTable *gameTable = [[AMXGameTable alloc] initWithView:self.view];
    
    [gameTable start];
}

@end

