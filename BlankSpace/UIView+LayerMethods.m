//
//  UIView+LayerMethods.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "UIView+LayerMethods.h"
#import "UIColor+Tools.h"

@implementation UIView (LayerMethods)

- (void)setShowLineBorder:(BOOL)show {
    if (show) {
        self.layer.borderColor = UIColorFromHex(0xe3e3e3).CGColor;
        self.layer.borderWidth = 0.5;
    }
}

- (void)setCorner:(NSInteger)width {
    self.layer.cornerRadius = width;
    self.layer.masksToBounds = YES;
}
@end
