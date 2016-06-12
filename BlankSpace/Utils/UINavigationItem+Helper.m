////
////  BlankSpace
////
////  Created by stone on 16/3/7.
////  Copyright © 2016年 stone. All rights reserved.
////
//
//#import "UINavigationItem+Helper.h"
//#import "WPTouchFadeButton.h"
//
//@implementation UINavigationItem (Helper)
//+ (UIBarButtonItem*)getRightNavBarButtonItemWithSelector:(SEL)selector target:(id)target imageName:(NSString *)imageName
//{
//    UIButton *finishButton = [[WPTouchFadeButton alloc] initWithFrame:CGRectZero];
//    UIImage *image = [UIImage imageNamed:imageName];
//    finishButton.frame = CGRectMake(0, 0, [self getButtonWidthWithImageWidth:image.size.width], 30);
//    [finishButton setImage:image forState:UIControlStateNormal];
//    [finishButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    finishButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -8);
//    UIBarButtonItem *tempRightButton = [[UIBarButtonItem alloc] initWithCustomView:finishButton];
//    tempRightButton.style = UIBarButtonItemStylePlain;
//    return tempRightButton;
//}
//+ (CGFloat)getButtonWidthWithImageWidth:(CGFloat)width {
////    CGFloat padding = 7;//14 - 5;
////    return padding * 2 + width;
//    return width;
//}
//+ (UIBarButtonItem *)backItemWithTarget:(id)target selector:(SEL)selector {
//    //做到和系统的返回一样
//    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    titleButton.frame = CGRectMake(0, 0, 30, 30);
//    [titleButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    [titleButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
//    [titleButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    [titleButton setImage:[UIImage imageNamed:@"btnNavigationBarBackArrow"] forState:UIControlStateNormal];
//    titleButton.contentEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:titleButton];
//    return item;
//}
//
//+ (UIBarButtonItem *)itemWithTitle:(NSString *)title selector:(SEL)selector target:(id)target
//{
//    UIBarButtonItem *systemItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:selector];
//    NSShadow *shadow = [NSShadow new];
//    shadow.shadowOffset = CGSizeMake(0, 0);
//    shadow.shadowColor = [UIColor clearColor];
//    [systemItem setTitleTextAttributes:@{ NSShadowAttributeName : shadow } forState:UIControlStateNormal];
//    return systemItem;
//}
//
//+ (UIBarButtonItem *)spaceOfWidth:(CGFloat)width {
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    item.width = width;
//    return item;
//}
//
//@end