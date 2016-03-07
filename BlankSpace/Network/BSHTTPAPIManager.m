//
//  BSHTTPAPIManager.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "BSHTTPAPIManager.h"
#import "BSLib.h"
#import "BSAPIResult.h"

@implementation BSHTTPAPIManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            if (status == AFNetworkReachabilityStatusNotReachable) {
                [[[AFHTTPSessionManager manager] operationQueue] cancelAllOperations];
            }
        }];
    }
    return self;
}

- (AFHTTPSessionManager *)sendRequestWithPath:(NSString *)path method:(BSHTTPMethod)method params:(NSDictionary *)params progress:(BSHTTPDownloadProgressBlock)progress success:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure
{
    if (!params) {
        params = [NSDictionary dictionary];
    }
    
    //TODO 对path进行处理
    
    void (^progressBlock)(NSProgress *) = ^(NSProgress *downloadProgress) {
        //TODO
    };
    
    void (^successBlock)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *manager, id JSON) {
        //TODO
    };
    
    void (^failBlock)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *manager, NSError *error) {
        //TODO
    };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    switch (method) {
        case GET:
        {
            [manager GET:path parameters:params progress:progressBlock success:successBlock failure:failBlock];
        }
            break;
            
        default:
            break;
    }
    
    return manager;
}

- (void)_parseResultWithDictionary:(NSDictionary *)dictionary
                           manager:(NSURLSessionDataTask *)manager
                           success:(BSHTTPSuccessBlock)success
                           failure:(BSHTTPFailureBlock)failure
{
    BSAPIResult *result = [[BSAPIResult alloc] initWithDictionary:dictionary];
    
}

@end
