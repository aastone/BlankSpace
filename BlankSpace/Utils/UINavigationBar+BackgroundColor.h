//
//  UINavigationBar+BackgroundColor.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (BackgroundColor)

- (void) action_setBackgroundColor:(UIColor *)backgroundColor;

- (void) action_setSystemBarBackgroundAlpha:(CGFloat)alpha;

- (void) action_reset;

@end
