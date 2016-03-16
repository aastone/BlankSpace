//
//  UIViewController+Helper.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//
#import <objc/runtime.h>
#import "UIViewController+Helper.h"
#import "UIImage+Utils.h"
#import "UIView+Helper.h"
//#import "UIView+LayoutMethods.h"
#import "UINavigationItem+Helper.h"

@interface UIViewController()
@property(nonatomic, strong) UIScrollView *respondingScrollView;
@end
@implementation UIViewController (Helper)

static char respondingScrollViewKey;

//static char overDismissBlockKey;

- (void)setRespondingScrollView:(UIScrollView *)respondingScrollView {
    objc_setAssociatedObject(self, &respondingScrollViewKey,
            respondingScrollView,
            OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollView *)respondingScrollView {
    return objc_getAssociatedObject(self, &respondingScrollViewKey);
}

//- (void)setOverlayDismissBlock:(OverlayDismissBlock)overlayDismissBlock {
//    objc_setAssociatedObject(self, &overDismissBlockKey,
//            overlayDismissBlock,
//            OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (OverlayDismissBlock)overlayDismissBlock {
//    return objc_getAssociatedObject(self, &overDismissBlockKey);
//}

- (void)presentViewControllerInNavigationController:(UIViewController *)viewController {
    [self presentViewControllerInNavigationController:viewController animated:YES completion:nil];
}

- (void)presentViewControllerInNavigationController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:nav animated:animated completion:completion];
}

- (void)pushViewControllerHidesBottomBar:(UIViewController *)viewController {
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (UIViewController *)mostParentViewController {
    UIViewController *vc = self;
    while (vc.parentViewController) {
        vc = vc.parentViewController;
    }
    return vc;
}

//- (void)presentViewControllerInOverlay:(UIViewController *)viewController {
//    UIView *view = viewController.view;
//  
////    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
//    UIViewController *topViewController = [self mostParentViewController];
//    UIView *topView = topViewController.view;
//    UIImageView *dimView = [[UIImageView alloc] initWithFrame:topView.bounds];
//    dimView.image = [UIImage backgroundGradientImageWithSize:topView.bounds.size];
//    dimView.userInteractionEnabled = YES;
//
//    [topViewController viewWillDisappear:YES];
//    [viewController viewWillAppear:YES];
//    [topView addSubview:dimView];
//    [dimView addSubview:view];
//    [topViewController addChildViewController:viewController];
//    [viewController didMoveToParentViewController:topViewController];
//    [viewController viewDidAppear:YES];
//    [topViewController viewDidDisappear:YES]; // 这个可以放到动画之后
//    
//    //TODO
//    view.center = CGPointMake(topView.width / 2, topView.height / 2);
//    
//    CGFloat y = view.center.y;
//
//    CABasicAnimation *fadeInAnimation = [CABasicAnimation animation];
//    fadeInAnimation.duration = 0.3;
//    fadeInAnimation.fromValue = @0.0F;
//    fadeInAnimation.toValue = @1.0F;
//    [dimView.layer addAnimation:fadeInAnimation forKey:@"opacity"];
//    
//    CAKeyframeAnimation *slideAnimation = [CAKeyframeAnimation animation];
//    slideAnimation.duration = 0.3;
//    slideAnimation.removedOnCompletion = NO;
//    slideAnimation.values = @[@([UIScreen mainScreen].bounds.size.height + y / 2), @(y)];
//    slideAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    [view.layer addAnimation:slideAnimation forKey:@"position.y"];
//    
//    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:viewController action:@selector(lg_overlayDimTapped:)];
//    dimView.userInteractionEnabled = YES;
//    [dimView addGestureRecognizer:recognizer];
//}

//- (void)lg_overlayDimTapped:(UITapGestureRecognizer *)g {
//    if (g.state == UIGestureRecognizerStateEnded) {
//        CGPoint point = [g locationOfTouch:0 inView:self.view];
//        if (![self.view pointInside:point withEvent:nil]) {
//            [self dismissFromOverlay];
//        }
//    }
//}
//- (void)dismissFromOverlay {
//    UIViewController *parent = self.parentViewController;
//    [parent viewWillAppear:YES];
//    [self viewWillDisappear:YES];
//    UIView *view = self.view;
//    [UIView animateWithDuration:0.2
//                          delay:0.0
//                        options:UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         //container
//                         view.superview.alpha = 0;
//                         view.y = [UIView appWindow].height;
//                     }
//                     completion:^(BOOL finished) {
//                         [view.superview removeFromSuperview];
//                         if (self.overlayDismissBlock) {
//                             self.overlayDismissBlock();
//                         }
//                         [self viewDidDisappear:YES];
//                         [self removeFromParentViewController];
//                         [parent viewDidAppear:YES];
//                     }];
//}

- (void)addRightCompletionDismissItem {
    self.navigationItem.rightBarButtonItem = [UINavigationItem itemWithTitle:@"完成" selector:@selector(wp_DismissViewController:) target:self];
}

- (void)wp_DismissViewController:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}



//- (void)wp_keyboardWillShow:(NSNotification *)note {
//    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    UIView *lastView = [self getLastView];
//    UIScrollView *scrollView = self.respondingScrollView;
//    if (lastView) {
//            scrollView.contentSize = CGSizeMake(scrollView.width, lastView.y + lastView.height + 20);
//    }
//    NSLog(@"keyboar responding scrollView  content size %@" ,NSStringFromCGSize(scrollView.contentSize));
//    UIEdgeInsets contentInset = scrollView.contentInset;
//    // 增加scroll inset 使其滚动  bottomInset + scrollView 离底部距离 = 键盘高度
//    CGRect scrollViewGlobalFrame = [scrollView convertRect:scrollView.bounds toView:nil];
//    CGFloat scrollBottomMargin = [UIView appWindow].height - (scrollViewGlobalFrame.size.height + scrollViewGlobalFrame.origin.y);
//    contentInset.bottom = keyboardFrame.size.height - scrollBottomMargin;
//    scrollView.contentInset = contentInset;
//
//    UIEdgeInsets scrollInset = scrollView.scrollIndicatorInsets;
//    scrollInset.bottom =  keyboardFrame.size.height;
//    scrollView.scrollIndicatorInsets = scrollInset;
//    //scroll to bottom
//    if (scrollView.contentSize.height > scrollView.frame.size.height - keyboardFrame.size.height) {
//        scrollView.contentOffset = CGPointMake(0, self.respondingScrollView.contentSize.height - scrollView.height + scrollView.contentInset.bottom);
//    }
//}


- (UIView *)getLastView {
    if ([self.respondingScrollView isKindOfClass:[UITableView class]]) {
        return nil;
    }
    UIView *lastView = self.respondingScrollView.subviews[self.respondingScrollView.subviews.count - 3];
    return lastView;
}
//- (void)wp_keyboardWillHide:(NSNotification *)note {
//    UIView *lastView = [self getLastView];
//    UIScrollView *scrollView = self.respondingScrollView;
//
//    if (lastView) {
//        scrollView.contentSize = CGSizeMake(scrollView.width, lastView.y + lastView.height + 20);
//    }
//    UIEdgeInsets contentInset = scrollView.contentInset;
//    contentInset.bottom = 0;
//    scrollView.contentInset = contentInset;
//
//    UIEdgeInsets scrollInset = scrollView.scrollIndicatorInsets;
//    scrollInset.bottom = 0;
//    scrollView.scrollIndicatorInsets = scrollInset;
//}

//- (void)setScrollViewNeedsRespondingToKeyboard:(UIScrollView *)scrollView {
//    if (scrollView != self.respondingScrollView) {
//        self.respondingScrollView = scrollView;
//        if (scrollView) {
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wp_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wp_keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wp_keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//        } else {
//            [[NSNotificationCenter defaultCenter] removeObserver:self];
//        }
//    }
//}

@end