//
//  BSModel.m
//  BlankSpace
//
//  Created by stone on 3/8/16.
//  Copyright © 2016 stone. All rights reserved.
//

#import "BSModel.h"
#import "RKPropertyInspector.h"

@implementation BSModel

+ (NSString *)tableName {
    SSOverrideAssert
    return nil;
}

- (NSString *)tableName {
    if (!_tableName) {
        _tableName = [[self class] tableName];
    }
    return _tableName;
}

+ (NSString *)tablePrimaryKey {
    SSOverrideAssert
    return nil;
}

+ (NSString *)modelPrimaryKey {
    SSOverrideAssert
    return nil;
}

- (NSString *)tablePrimaryKey {
    if (!_tablePrimaryKey) {
        _tablePrimaryKey = [[self class] tablePrimaryKey];
    }
    return _tablePrimaryKey;
}

- (NSString *)modelPrimaryKey {
    if (!_modelPrimaryKey) {
        _modelPrimaryKey = [[self class] modelPrimaryKey];
    }
    return _modelPrimaryKey;
}

+ (NSDictionary *)objectMapping {
    SSOverrideAssert
    return nil;
}

- (NSDictionary *)dataDictionary {
    NSDictionary *mapping = [self.class objectMapping];
    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionary];
    for (NSString *key in mapping) {
        id mapInfo = mapping[key];
        NSString *dictionaryKey;
        if ([mapInfo isKindOfClass:[NSString class]]) {
            dictionaryKey = mapInfo;
        } else {
            dictionaryKey = mapInfo[0];
        }
        id value = [self valueForKey:key];
        if (value == nil) {
            resultDictionary[dictionaryKey] = [NSNull null];
        } else if ([value isKindOfClass:[BSModel class]]){
            resultDictionary[dictionaryKey] = [value dataDictionary];
        } else if ([value isKindOfClass:[NSArray class]]) {
            Class modelClass = mapInfo[1];
            resultDictionary[dictionaryKey] = [modelClass dictionaryListWithModelList:value];
        } else {
            //TODO 类型检查
            resultDictionary[dictionaryKey] = value;
        }
    }
    return resultDictionary;
}

- (id)primaryKeyValue {
    return [self valueForKey:self.modelPrimaryKey];
}

+ (BSModel *)modelFromDictionary:(NSDictionary *)dictionary {
    BSModel *model = [self new];
    NSDictionary *mapping = [self objectMapping];
    for (NSString *key in mapping) {
        id mapInfo = mapping[key];
        NSString *dictionaryKey;
        if ([mapInfo isKindOfClass:[NSString class]]) {
            dictionaryKey = mapInfo;
        } else {
            dictionaryKey = mapInfo[0];
        }
        
        id value = dictionary[dictionaryKey];
        if (value == nil || value == [NSNull null] || ([value isKindOfClass:[NSArray class]] && [value count] == 0)) {
            continue;
        }
        Class propertyClass = RKPropertyInspectorGetClassForPropertyAtKeyPathOfObject(key, model);
        NSAssert(propertyClass != nil, @"Object Mapping error, property not exist");
        
        if ([propertyClass isSubclassOfClass:[NSString class]]) {
            value = [value stringValue];
        } else if ([propertyClass isSubclassOfClass:[NSNumber class]]) {
            value = [value numberValue];
        } else if ([propertyClass isSubclassOfClass:[NSArray class]]) {
            SSTypeAssert(value, NSArray);
            Class modelClass = mapInfo[1];
            value = [modelClass modelListWithDictionaryList:value];
        } else if ([propertyClass isSubclassOfClass:[BSModel class]]) {
            SSTypeAssert(value, NSDictionary);
            value = [propertyClass modelFromDictionary:value];
        } else if ([propertyClass isSubclassOfClass:[NSDictionary class]]){
            //  value is dictionary, do not need to hand
        }
        else {
            NSAssert(0, @"type for model not valid, it should be one of NSString/NSNumber/NSArray/NSDictionary, actual type is %@", propertyClass);
        }
        [model setValue:value forKey:key];
    }
    return model;
}
- (BOOL)isEqual:(BSModel *)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;
    return [self.primaryKeyValue isEqual:other.primaryKeyValue];
}

- (void)fillContentWithNewItem:(BSModel *)newItem {
    if (self == newItem) {
        return;
    }
    [self setValuesForKeysWithDictionary:newItem.dataDictionary];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendString:self.dataDictionary.description];
    [description appendString:@">"];
    return description;
}

- (NSUInteger)hash {
    return [[NSString stringWithFormat:@"%@", self.primaryKeyValue] hash];
}

- (NSString *)JSONString {
    return [[self dataDictionary] bs_JSONString];
}

+ (instancetype)modelFromJSONString:(NSString *)str {
    if (str.length == 0) {
        return nil;
    }
    
    NSDictionary *dict = [str bs_objectFromJSONString];
    if (!dict) {
        NSLog(@"Error %@ 无法解析JSON！:%@", self, str);
        return nil;
    }
    
    return [self modelFromDictionary:dict];
}

+ (NSArray *)modelListFromJSONString:(NSString *)str {
    if (str.length == 0) {
        return nil;
    }
    
    NSArray *array = [str bs_objectFromJSONString];
    if (!array) {
        NSLog(@"Error %@ 无法解析JSON！:%@", self, str);
        return nil;
    }
    return [self modelListWithDictionaryList:array];
}

+ (NSString *)JSONStringFromModelList:(NSArray *)modelList {
    return [self dictionaryListWithModelList:modelList].bs_JSONString;
}

+ (NSArray *)modelListWithDictionaryList:(NSArray *)dictList {
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:dictList.count];
    for (NSDictionary *dictionary in dictList) {
        BSModel *item = [self modelFromDictionary:dictionary];
        [list addObject:item];
    }
    return list;
}

+ (NSArray *)dictionaryListWithModelList:(NSArray *)modelList {
    NSMutableArray *dictArray = [NSMutableArray array];
    for (BSModel *model in modelList) {
        [dictArray addObject:model.dataDictionary];
    }
    return dictArray;
}

@end
