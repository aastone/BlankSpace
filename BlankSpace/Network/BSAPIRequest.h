//
//  BSAPIRequest.h
//  BlankSpace
//
//  Created by stone on 16/3/8.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "BSHTTPAPIManager.h"

@class BSAPIResult;

@interface BSAPIRequest : NSObject

- (instancetype)initWithParams:(NSDictionary *)params path:(NSString *)path method:(BSHTTPMethod)method;
- (void)sendRequestSuccess:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure;
- (void)sendRequestWithManager:(BSHTTPAPIManager *)manager success:(BSHTTPSuccessBlock)success failure:(BSHTTPFailureBlock)failure;

@end
