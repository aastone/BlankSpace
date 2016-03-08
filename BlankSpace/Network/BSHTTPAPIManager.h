//
//  BSHTTPAPIManager.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSInteger, BSHTTPMethod) {
    GET = 0,
    POST,
    PUT,
    DELETE,
    PATCH,
};

@class BSAPIResult;

typedef void (^BSHTTPSuccessBlock)(BSAPIResult *result);
typedef void (^BSHTTPFailureBlock)(NSError *error);
typedef void (^BSHTTPDownloadProgressBlock)(id);
#define BS_CALLBACK success:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure;

@interface BSHTTPAPIManager : AFHTTPSessionManager

@property (nonatomic) AFNetworkReachabilityStatus networkReachabilityStatus;
@property(nonatomic, copy) NSString *apiVersion;

+ (BSHTTPAPIManager *)manager;

/*
 @param basePath http://host:port do not add trailing slash
 @param versionStr will append to basePath like http://host:port/v1 , pass nil for no version prefix
 */
+ (void)configureWithBasePath:(NSString *)basePath apiVersion:(NSString *)versionStr;

/**
 *  封装的网络请求方法
 *
 *  @param path     URL地址
 *  @param method   HTTP请求方式
 *  @param params   参数
 *  @param progress BSHTTPDownloadProgressBlock
 *  @param success  BSHTTPSuccessBlock
 *  @param failure  BSHTTPFailureBlock
 *
 *  @return AFHTTPSessionManager
 */
- (AFHTTPSessionManager *)sendRequestWithPath:(NSString *)path
                                       method:(BSHTTPMethod)method
                                       params:(NSDictionary *)params
                                     progress:(BSHTTPDownloadProgressBlock)progress
                                      success:(BSHTTPSuccessBlock)success
                                      failure:(BSHTTPFailureBlock)failure;

@end
