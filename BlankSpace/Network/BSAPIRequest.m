//
//  BSAPIRequest.m
//  BlankSpace
//
//  Created by stone on 16/3/8.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "BSAPIRequest.h"

@interface BSAPIRequest ()

@property(nonatomic, assign) AFHTTPSessionManager *manager;
@property(nonatomic, copy) NSString *path;
@property(nonatomic, assign) BSHTTPMethod method;
@property(nonatomic, strong) NSMutableDictionary *params;

@end

@implementation BSAPIRequest

- (instancetype)initWithParams:(NSDictionary *)params path:(NSString *)path method:(BSHTTPMethod)method
{
    self = [super init];
    self.path = path;
    self.method = method;
    
    self.params = [NSMutableDictionary dictionary];
    if (params) {
        [self.params addEntriesFromDictionary:params];
    }
    return self;
}

- (instancetype)init {
    NSAssert(0, @"Do not -init directly, unless subclass override this");
    return nil;
}

- (void)sendRequestSuccess:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure
{
    //设置 Host
    [[BSHTTPAPIManager manager].requestSerializer setValue:@"" forHTTPHeaderField:@"HOST"];
    [self sendRequestWithManager:[BSHTTPAPIManager manager] success:success failure:failure];
}

- (void)sendRequestWithManager:(BSHTTPAPIManager *)manager success:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure
{
    self.manager = [manager sendRequestWithPath:self.path method:self.method params:self.params progress:nil success:^(BSAPIResult *result) {
//        <#code#>
    } failure:^(NSError *error) {
//        <#code#>
    }];
}



















@end
