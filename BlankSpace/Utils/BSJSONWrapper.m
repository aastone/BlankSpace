//
//  BSJSONWrapper.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "BSJSONWrapper.h"

@implementation NSString (BSJSON)

- (id)bs_objectFromJSONString
{
    return [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
}

@end

@implementation NSData (BSJSON)

- (id)bs_objectFromJSONData
{
    return [NSJSONSerialization JSONObjectWithData:self options:0 error:nil];
}

@end

@implementation NSArray (BSJSON)

- (NSData *)bs_JSONData
{
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

- (NSString *)bs_JSONString
{
    NSData *data = [self bs_JSONData];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end

@implementation NSDictionary (BSJSON)

- (NSData *)bs_JSONData
{
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

- (NSString *)bs_JSONString
{
    NSData *data = [self bs_JSONData];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end





