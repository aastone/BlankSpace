//
//  BSLoadStatusView.h
//  BlankSpace
//
//  Created by stone on 16/4/6.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , WPLoadStatus) {
    WPLoadStatusLoading,
    WPLoadStatusFail,
    WPLoadStatusSuccess,
    WPLoadStatusEmpty,
};

@interface BSLoadStatusView : UIView

@property (nonatomic, copy) dispatch_block_t loadHandler; //注意不要造成任何循环引用
@property (nonatomic) WPLoadStatus status;

- (void)setEmptyText:(NSString *)emptyText;
- (void)setEmptyImage:(UIImage *)emptyImage;
- (void)setFailText:(NSString *)failText;
- (void)setFailImage:(UIImage *)failImage;

@end

@interface UIView (WPLoadStatus)

@property (nonatomic, strong, readonly) BSLoadStatusView *loadStatusView;
//convenience method of |status| setter
- (void)triggerLoading;
- (void)setStatusEmpty;
- (void)setStatusFail;
- (void)setStatusSuccess;


- (void)addLoadStatusViewWithLoadHandler:(dispatch_block_t)loadHandler;
@end