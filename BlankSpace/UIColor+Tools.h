//
//  UIColor+Tools.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// no alpha included
#define UIColorFromHex(x)                       [UIColor colorWithRed:((x>>16)&0xff)/255.0f green:((x>>8)&0xff)/255.0f blue:(x&0xff)/255.0f alpha:1]
#define UIColorFromHexWithAlpha(x, a)           [UIColor colorWithRed:((x>>16)&0xff)/255.0f green:((x>>8)&0xff)/255.0f blue:(x&0xff)/255.0f alpha:a]

@interface UIColor (Tools)

+ (UIColor *)colorWithRealRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (UIColor *)colorWithRealRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)randomColor;

+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
