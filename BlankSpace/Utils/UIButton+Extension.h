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
@end