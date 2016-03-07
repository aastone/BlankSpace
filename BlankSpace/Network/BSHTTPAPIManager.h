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

- (AFHTTPSessionManager *)sendRequestWithPath:(NSString *)path
                                       method:(BSHTTPMethod)method
                                       params:(NSDictionary *)params
                                     progress:(BSHTTPDownloadProgressBlock)progress
                                      success:(BSHTTPSuccessBlock)success
                                      failure:(BSHTTPFailureBlock)failure;

@end
