//
//  NSDate+TimeUtil.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//
#import "NSDate+TimeUtil.h"
#import "NSDate+Escort.h"

@implementation NSDate (TimeUtil)
+ (NSString *)timeWithFormat:(NSString *)format timestamp:(NSNumber *)timestamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.unsignedLongLongValue/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSString *)timeWithFormat:(NSString *)format withUnixTimestamp:(NSNumber *)timestamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.unsignedLongLongValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}
- (NSString *)stringWithDateFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}
- (NSString *)dateString;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:self];
}
- (NSString *)dateTimeString;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:self];
}
- (NSString *)dateTimeStringWithoutSeconds
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [formatter stringFromDate:self];
}
- (NSString *)dateStringByFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

+ (NSDate *)dateFromDateString:(NSString *)dateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter dateFromString:dateStr];
}

+ (NSDate *)dateFromDatetimeString:(NSString *)datetimeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter dateFromString:datetimeStr];
}

+ (NSDate *)dateFromDatetimeStringWithoutSeconds:(NSString *)datetimeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [formatter dateFromString:datetimeStr];
}

-(NSString *)astroString
{
    //计算星座
    NSString *retStr=@"";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM"];
    int i_month=0;
    NSString *theMonth = [dateFormat stringFromDate:self];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        i_month = [[theMonth substringFromIndex:1] intValue];
    }else{
        i_month = [theMonth intValue];
    }
    
    [dateFormat setDateFormat:@"dd"];
    int i_day=0;
    NSString *theDay = [dateFormat stringFromDate:self];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        i_day = [[theDay substringFromIndex:1] intValue];
    }else{
        i_day = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    switch (i_month) {
        case 1:
            if(i_day>=20 && i_day<=31){
                retStr=@"水瓶座";
            }
            if(i_day>=1 && i_day<=19){
                retStr=@"摩羯座";
            }
            break;
        case 2:
            if(i_day>=1 && i_day<=18){
                retStr=@"水瓶座";
            }
            if(i_day>=19 && i_day<=31){
                retStr=@"双鱼座";
            }
            break;
        case 3:
            if(i_day>=1 && i_day<=20){
                retStr=@"双鱼座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"白羊座";
            }
            break;
        case 4:
            if(i_day>=1 && i_day<=19){
                retStr=@"白羊座";
            }
            if(i_day>=20 && i_day<=31){
                retStr=@"金牛座";
            }
            break;
        case 5:
            if(i_day>=1 && i_day<=20){
                retStr=@"金牛座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"双子座";
            }
            break;
        case 6:
            if(i_day>=1 && i_day<=21){
                retStr=@"双子座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"巨蟹座";
            }
            break;
        case 7:
            if(i_day>=1 && i_day<=22){
                retStr=@"巨蟹座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"狮子座";
            }
            break;
        case 8:
            if(i_day>=1 && i_day<=22){
                retStr=@"狮子座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"处女座";
            }
            break;
        case 9:
            if(i_day>=1 && i_day<=22){
                retStr=@"处女座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"天秤座";
            }
            break;
        case 10:
            if(i_day>=1 && i_day<=23){
                retStr=@"天秤座";
            }
            if(i_day>=24 && i_day<=31){
                retStr=@"天蝎座";
            }
            break;
        case 11:
            if(i_day>=1 && i_day<=21){
                retStr=@"天蝎座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"射手座";
            }
            break;
        case 12:
            if(i_day>=1 && i_day<=21){
                retStr=@"射手座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"摩羯座";
            }
            break;
    }
    return retStr;
}

- (NSString *)smartDescription
{
    //策略，昨天的显示昨天时间，今天的显示时间，其他时间显示年月日
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitHour fromDate:self];
    NSDateComponents *componentsNow = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitHour fromDate:[NSDate date]];
    
    NSTimeInterval passedTime = fabs([self timeIntervalSinceNow]);
    NSTimeInterval oneDayAgo = 3600*24;
    NSTimeInterval twoDaysAgo = 3600*24*2;

    if (passedTime > oneDayAgo && passedTime < twoDaysAgo) {
        return [NSString stringWithFormat:@"昨天%@", [self dateStringByFormat:@"HH:mm"]];
    } else if (passedTime < oneDayAgo){
        if (components.day!=componentsNow.day) {
            return [NSString stringWithFormat:@"昨天%@", [self dateStringByFormat:@"HH:mm"]];
        } else {
            return [self dateStringByFormat:@"HH:mm"];
        }
    } else {
        if ([self isThisYear]) {
            return [self dateStringByFormat:@"MM-dd"];
        } else {
            return [self dateStringByFormat:@"yy-MM-dd"];
        }
    }
}

- (NSNumber *)unixTimestampInMilliSeconds {
    return @((u_int64_t)([self timeIntervalSince1970]*1000));
}

- (NSNumber *)unixTimestampInSeconds {
    return @((u_int64_t)self.timeIntervalSince1970);
}

+ (NSDate *)dateFromHourMinute:(NSString *)hourMinute {
    NSDate *now = [NSDate date];
    NSString *dateString = [now dateString];
    NSString *dateTimeString = [NSString stringWithFormat:@"%@ %@:00", dateString, hourMinute];
    return [NSDate dateFromDatetimeString:dateTimeString];
}

+ (dispatch_source_t)countDownTimerForInterval:(NSUInteger)seconds repeatTimes:(NSUInteger)times action:(void (^)(NSUInteger))action competion:(void (^)(void))completion
{
    __block NSUInteger count = times;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    uint64_t nsec = (uint64_t)(seconds * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 0), nsec, 0);

    dispatch_source_set_event_handler(timer, ^(){
        if (count == 0) {
            //cancel timer
            completion();
            dispatch_source_cancel(timer);
        } else {
            if (action) {
                action(count);
            }
            count--;
        }
    });
    dispatch_resume(timer);
    return timer;
}

+ (void)cancelTimer:(dispatch_source_t)timer
{
    if (timer) {
        dispatch_source_cancel(timer);
#if !OS_OBJECT_USE_OBJC
        dispatch_release(timer);
#endif
    }
}

+ (dispatch_source_t)repeatTimerForInterval:(NSTimeInterval)seconds action:(void (^)(void))action startImmdiately:(BOOL)startImmediately {
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    uint64_t nsec = (uint64_t)(seconds * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 0), nsec, 0);

    dispatch_source_set_event_handler(timer, action);
    if (startImmediately) {
        dispatch_resume(timer);
    }
    return timer;
}

+ (dispatch_source_t)repeatTimerForInterval:(NSTimeInterval)seconds action:(void (^)(void))action
{
    return [self repeatTimerForInterval:seconds action:action startImmdiately:YES];
}

@end
