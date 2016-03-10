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


@end