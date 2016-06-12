//
//  BSModel.h
//  BlankSpace
//
//  Created by stone on 3/8/16.
//  Copyright © 2016 stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TypeCheckMacros.h"
#import "BSLib.h"

@interface BSModel : NSObject{
    NSString *_tablePrimaryKey;
    NSString *_modelPrimaryKey;
    NSString *_tableName;
}

@property(nonatomic, readonly) NSString *tableName;
@property(nonatomic, readonly) NSString *tablePrimaryKey; // 表主键名
@property(nonatomic, readonly) NSString *modelPrimaryKey; // 对象主键名

- (id)primaryKeyValue;

- (void)fillContentWithNewItem:(BSModel *)newItem;

// 使用objectMapping 初始化对象或者生成Dictionary。
// override可以手动生成对象。
+ (instancetype)modelFromDictionary:(NSDictionary *)dictionary;

// 根据ObjectMapping 生成Dictionary。
// override 可以手动生成dictionary
- (NSDictionary *)dataDictionary;

#pragma mark Convenience
- (NSString *)JSONString;
+ (instancetype)modelFromJSONString:(NSString *)str;

+ (NSArray *)modelListFromJSONString:(NSString *)str;
+ (NSString *)JSONStringFromModelList:(NSArray *)modelList;

+ (NSArray *)modelListWithDictionaryList:(NSArray *)dictList;
+ (NSArray *)dictionaryListWithModelList:(NSArray *)modelList;
@end

//子类实现这些函数便可用于数据库存储，JSON序列化
@interface BSModel(BSEntitySubclass)
+ (NSString *)tableName;
// 数据库的主键
+ (NSString *)tablePrimaryKey;
+ (NSString *)modelPrimaryKey;

// 形式1 basicField(NSNumber/NSString) => dicKey(NSNumber/NSString):
// 形式2 modelArrayField(NSArray<WPModel> => @[dicKey(NSArray<NSDictionary>) : WPModel.class ]]
// 形式3 modelField(WPModel) => @[dictKey(NSDictionary) : WPModel.class]
+ (NSDictionary *)objectMapping;

@end
