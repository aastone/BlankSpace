//
//  BSAPIRequest.h
//  BlankSpace
//
//  Created by stone on 16/3/8.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "BSHTTPAPIManager.h"

@class BSAPIResult;

@interface BSAPIRequest : NSObject

- (instancetype)initWithParams:(NSDictionary *)params path:(NSString *)path method:(BSHTTPMethod)method;
- (void)sendRequestSuccess:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure;
- (void)sendRequestWithManager:(BSHTTPAPIManager *)manager success:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure;

/*
 *  发生错误/成功时的回调，默认直接调用failureBlock/successBlock
 *  做一些统一的的处理
 */
- (void)handleErrorWithError:(NSError *)error failureBlock:(BSHTTPFailureBlock)failureBlock;

- (void)handleSuccessWithResult:(BSAPIResult *)result successBlock:(BSHTTPSuccessBlock)successBlock;

/**
 *  发送请求前的回调，默认什么都没有。
 *  用来一些特定的请求做一些事情，比如添加Header
 *  子类继承时应该调用父类方法
 */
- (void)willSendRequestWithAPIManager:(BSHTTPAPIManager *)manager;

@end

@interface BSAPIRequest(Subclass)

@end


