//
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSNumber (Util)
- (NSNumber *)numberValue;

- (NSDate *)dateFromSeconds;
- (NSDate *)dateFromMilliSeconds;
- (NSString *)rmbString;

+ (NSString *)priceStringWithFloat:(float)price;
- (NSString *)priceString;
@end