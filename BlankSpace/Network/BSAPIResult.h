//
//  BSAPIResult.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSAPIResult : NSObject

@property (nonatomic, readonly) NSInteger code;

@property (nonatomic, copy) NSString *error;
@property (nonatomic, copy) NSString *userError;

@property (nonatomic, copy) NSDictionary *allHeaderFields;

#pragma mark list related
@property(nonatomic, readonly) NSUInteger count;
@property(nonatomic, readonly) NSUInteger size;
@property(nonatomic, readonly) NSUInteger offset;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionary;
- (NSArray *)arrayOfModel:(Class)modelClass;
- (id)model:(Class)modelClass;
- (NSArray *)arrayOfModel:(Class)modelClass atKeyPath:(NSString *)keyPath;
- (id)model:(Class)modelClass atKeyPath:(NSString *)keyPath;

@end
