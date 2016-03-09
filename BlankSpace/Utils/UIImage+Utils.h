//
//  UIImage+Utils.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)
+ (UIImage *)backgroundGradientImageWithSize:(CGSize)size;
/**
* targetSize 以像素为单位，
* return 返回的image scale为1
*/
- (UIImage *)scaleToSize:(CGSize)targetSize;
/**
targetSize 单位为Pixel
*/
- (UIImage *)imageByScalingAndCroppingForPixelSize:(CGSize)targetSize;
- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize opaque:(BOOL)opaque;

+ (NSArray *)imagesByGifData:(NSData *)gifData;

//根据颜色生成图片
+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size;

@end
