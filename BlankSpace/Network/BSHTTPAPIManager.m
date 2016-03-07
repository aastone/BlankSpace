//
//  BSHTTPAPIManager.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "BSHTTPAPIManager.h"

@implementation BSHTTPAPIManager

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (AFHTTPSessionManager *)sendRequestWithPath:(NSString *)path method:(BSHTTPMethod)method params:(NSDictionary *)params progress:(BSHTTPDownloadProgressBlock)progress success:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure
{
    if (!params) {
        params = [NSDictionary dictionary];
    }
    
    
    
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

@end
