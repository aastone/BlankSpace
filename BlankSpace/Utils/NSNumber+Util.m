//
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//
#import "NSNumber+Util.h"


@implementation NSNumber (Util)
- (NSNumber *)numberValue {
    return self;
}
- (NSDate *)dateFromSeconds {
    return [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
}

- (NSDate *)dateFromMilliSeconds {
    return [NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000];
}

- (NSString *)rmbString {
    return [NSString stringWithFormat:@"￥%@", [self priceString]];
}

+ (NSString *)priceStringWithFloat:(float)price {
    return [NSString stringWithFormat:@"%.2f", price];
}

- (NSString *)priceString {
    NSString *result = [NSString stringWithFormat:@"%.2f", self.floatValue];
    
    //如果没有小数 不显示.00
    if ([result hasSuffix:@".00"]) {
        result = [result stringByReplacingOccurrencesOfString:@".00" withString:@""];
    } else if ([result hasSuffix:@"0"]) {
        result = [result stringByReplacingCharactersInRange:NSMakeRange(result.length - 1, 1) withString:@""];
    }
    
    return result;
}


@end