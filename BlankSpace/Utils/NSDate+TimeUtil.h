//
//  NSDate+TimeUtil.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TimeUtil)
+ (NSString *)timeWithFormat:(NSString *)format timestamp:(NSNumber *)timestamp;
+ (NSString *)timeWithFormat:(NSString *)format withUnixTimestamp:(NSNumber *)timestamp;
- (NSString *)dateString;
- (NSString *)dateTimeString;
- (NSString *)dateTimeStringWithoutSeconds;
- (NSString *)stringWithDateFormat:(NSString *)format;
+ (NSDate *)dateFromDateString:(NSString *)dateString;
+ (NSDate *)dateFromDatetimeString:(NSString *)dateString;
+ (NSDate *)dateFromDatetimeStringWithoutSeconds:(NSString *)dateString;
+ (NSDate *)dateFromHourMinute:(NSString *)hourMinute;

+ (dispatch_source_t)countDownTimerForInterval:(NSUInteger)seconds repeatTimes:(NSUInteger)times action:(void (^)(NSUInteger))action competion:(void (^)(void))completion;
+ (void)cancelTimer:(dispatch_source_t)timer;
+ (dispatch_source_t)repeatTimerForInterval:(NSTimeInterval)seconds action:(void (^)(void))action startImmdiately:(BOOL)startImmediately;
+ (dispatch_source_t)repeatTimerForInterval:(NSTimeInterval)seconds action:(void (^)(void))action;
- (NSString *)astroString;
- (NSString *)smartDescription;
- (NSNumber *)unixTimestampInMilliSeconds;
- (NSNumber *)unixTimestampInSeconds;

@end
