#ifndef H_TYPE_CHECK_MACROS
#define CONVERT_NULL(x) (x==[NSNull null]?nil:x)

#define SSTypeAssert(var, type) NSAssert([var isKindOfClass:[type class]], @"type Check error, expect %@, return is %@", [type class], [var class]);
#define SSOverrideAssert NSAssert(0, @"Subclass should override This!");

#define NullWrapper(x) x?x:[NSNull null]
#define StringWrapper(x) x?x:@""
#define NumberWrapper(x) x?x:@0
#define TypeCast(x, type) [x isKindOfClass:[type class]]?x:nil
#define DictCast(x) TypeCast(x, NSDictionary)
#define ArrayCast(x) TypeCast(x, NSArray)

#define H_TYPE_CHECK_MARCOS
#endif