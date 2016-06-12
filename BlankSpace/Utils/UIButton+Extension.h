//
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton (Extension)
- (void)addTargetIfNotExist:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events;

/**
 *  多个按钮中实现单选功能
 *
 *  @param clickedButton 选中的单个button
 *  @param buttons       有关联的全部button数组
 */
+ (void)setSingleButtonSelected:(UIButton *)clickedButton withButtons:(NSArray *)buttons;

/**
 *  点击单个按钮实现全选\反选功能
 *
 *  @param clickedButton 全选按钮
 *  @param buttons       所有需要被选中的button数组
 */
+ (void)setAllButtonSelectedOrUnselected:(UIButton *)clickedButton withButtons:(NSArray *)buttons;

@end