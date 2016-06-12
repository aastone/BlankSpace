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
    
    void (^successBlock)(NSURLSessionTask *, id) = ^(NSURLSessionTask *manager, id JSON) {
        //TODO
        [self _parseResultWithDictionary:JSON manager:manager success:success failure:failure];
    };
    
    void (^failBlock)(NSURLSessionTask *, NSError *) = ^(NSURLSessionTask *manager, NSError *error) {
        //TODO
    };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    switch (method) {
        case GET:
        {
            [manager GET:path parameters:params progress:progressBlock success:successBlock failure:failBlock];
        }
            break;
        case POST:
        {
            [manager POST:path parameters:params progress:progressBlock success:successBlock failure:failBlock];
        }
            break;
        case PUT:
        {
            [manager PUT:path parameters:params success:successBlock failure:failBlock];
        }
            break;
        case DELETE:
        {
            [manager DELETE:path parameters:params success:successBlock failure:failBlock];
        }
            break;
        case PATCH:
        {
            [manager PATCH:path parameters:params success:successBlock failure:failBlock];
        }
            break;
        default:
            break;
    }
    
    return manager;
}

// 处理接口返回的信息 封装为BSAPIResult类
- (void)_parseResultWithDictionary:(NSDictionary *)dictionary
                           manager:(NSURLSessionTask *)manager
                           success:(BSHTTPSuccessBlock)success
                           failure:(BSHTTPFailureBlock)failure
{
    BSAPIResult *result = [[BSAPIResult alloc] initWithDictionary:dictionary];
    
    if (!result.error) {
        success(result);
        //TODO:输出返回信息
    }else {
        NSError *error = nil; //TODO
        failure(error);
        //TODO:输出错误信息
    }
}

- (void)responseInfoDescription:(NSURLSessionDataTask *)data
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)data.response;
    //TODO 差一个response string
    NSLog(@"%@", [NSString stringWithFormat:@" -----RequestURL-----:\n %@ %@,\n"
                  " -----RequestBody-----: \n%@, \n"
                  " -----RequestHeader-----: \n%@, \n"
                  " -----ResponseStatus-----: \n%@, \n"
                  " -----ResponseHeader-----: \n%@, \n",
                      data.currentRequest.URL, data.currentRequest.HTTPMethod,
                  [[NSString alloc] initWithData:[data.currentRequest HTTPBody] encoding:(NSUTF8StringEncoding)],
                  data.currentRequest.allHTTPHeaderFields,
                  @(response.statusCode),
                  response.allHeaderFields]);
}

static BSHTTPAPIManager *sharedInstance = nil;

+ (BSHTTPAPIManager *)manager
{
    NSAssert(sharedInstance, @"Initialize manager using configureWithBasePath:apiVersion before any usage");
    return sharedInstance;
}

+ (void)configureWithBasePath:(NSString *)basePath apiVersion:(NSString *)versionStr {
    sharedInstance = [[BSHTTPAPIManager alloc] initWithBaseURL:[NSURL URLWithString:basePath]];
    sharedInstance.apiVersion = versionStr;
}

@end
