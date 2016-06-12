//
//  UIView+Helper.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Helper)
@property(nonatomic, strong) id userData;
+ (UIView *)windowSubview;
+ (CGFloat)screenWidth;
+ (UIWindow *)appWindow;
@end
