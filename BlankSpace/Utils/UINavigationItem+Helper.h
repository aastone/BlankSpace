//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UINavigationItem (Helper)
+ (UIBarButtonItem *)getRightNavBarButtonItemWithSelector:(SEL)selector target:(id)target imageName:(NSString *)imageName;
+ (UIBarButtonItem *)backItemWithTarget:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title selector:(SEL)selector target:(id)target;
@end