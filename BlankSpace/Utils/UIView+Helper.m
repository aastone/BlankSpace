//
//  UIView+Helper.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+Helper.h"

static void *userDataKey;
@implementation UIView(Helper)

#pragma mark Window & Screen

+ (UIView *)windowSubview {
    return [[[[[UIApplication sharedApplication] delegate] window] subviews] firstObject];
}

+ (CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (UIWindow *)appWindow {
    return [[UIApplication sharedApplication].delegate window];
}

#pragma mark user data

- (id)userData {
    id result = objc_getAssociatedObject(self, &userDataKey);
    return result;
}

- (void)setUserData:(id)userData {
    objc_setAssociatedObject(self, &userDataKey, userData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

