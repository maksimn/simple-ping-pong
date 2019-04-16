//
//  AMXGameSettingsView.h
//  UIViewAnimationsHW
//
//  Created by Maksim Ivanov on 16/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMXGameSettingsView : UIView

- (instancetype)init;

@property (nonatomic, copy) void (^backToGameCallback)(void);

@end

NS_ASSUME_NONNULL_END
