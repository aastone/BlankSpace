//
//  UIApplication+Extra.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extra)
- (NSString *)appVersion;
- (NSString *)buildVersion;

- (NSString *)deviceModel;

+ (void)callPhone:(NSString *)phone;

- (NSString *)deviceIdentifier;
@end
