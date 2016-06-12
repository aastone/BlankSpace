//
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+Extension.h"

@implementation UIButton (Extension)
- (void)addTargetIfNotExist:(id)target action:(SEL)action forControlEvents:(UIControlEvents)events{
//    [self removeTarget:target action:action forControlEvents:events];
    [self addTarget:target action:action forControlEvents:events];
}


+ (void)setSingleButtonSelected:(UIButton *)clickedButton withButtons:(NSArray *)buttons
{
    if (clickedButton.selected) {
        return;
    }
    for (id btn in buttons) {
        if ([btn isKindOfClass:[UIButton class]]) {
            UIButton *button = btn;
            button.selected = NO;
        }else {
            NSLog(@"Wrong type of buttons");
        }
    }
    
    clickedButton.selected = YES;
}

+ (void)setAllButtonSelectedOrUnselected:(UIButton *)clickedButton withButtons:(NSArray *)buttons
{
    for (id btn in buttons) {
        if ([btn isKindOfClass:[UIButton class]]) {
            UIButton *button = btn;
            button.selected = !clickedButton.isSelected;
        }else {
            NSLog(@"Wrong type of buttons");
        }
    }
    
    clickedButton.selected = !clickedButton.isSelected;
}

@end