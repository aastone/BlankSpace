//
//  UIViewController+Helper.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//typedef void (^OverlayDismissBlock)(void);
@interface UIViewController (Helper)
//@property(nonatomic, copy) OverlayDismissBlock overlayDismissBlock;

- (void)presentViewControllerInNavigationController:(UIViewController *)viewController;
- (void)presentViewControllerInNavigationController:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^)(void))completion;
- (void)pushViewControllerHidesBottomBar:(UIViewController *)viewController;

- (void)presentViewControllerInOverlay:(UIViewController *)viewController;
- (void)dismissFromOverlay;

- (void)addRightCompletionDismissItem;
- (void)setScrollViewNeedsRespondingToKeyboard:(UIScrollView *)scrollView;

@end