//
//  UIApplication+Extra.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "UIApplication+Extra.h"
#import <sys/utsname.h>
#import "UICKeyChainStore.h"

@implementation UIApplication (Extra)
- (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)buildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

- (NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

+ (void)callPhone:(NSString *)phone {
    NSMutableString * str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@", phone];
    //            NSLog(@"str======%@",str);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

static NSString *deviceId = nil;
+ (void)load {
    deviceId = [UICKeyChainStore stringForKey:@"deviceId"];
    if (!deviceId) {
        deviceId = [[NSProcessInfo processInfo] globallyUniqueString];
        [UICKeyChainStore setString:deviceId forKey:@"deviceId"];
    }
}
- (NSString *)deviceIdentifier {
    return deviceId;
}
@end
