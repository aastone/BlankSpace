//
//  BSJSONWrapper.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BSJSON)

- (id)bs_objectFromJSONString;

@end


@interface NSData (BSJSON)

- (id)bs_objectFromJSONData;

@end

@interface NSArray (BSJSON)

- (NSData *)bs_JSONData;

- (NSString *)bs_JSONString;

@end

@interface NSDictionary (BSJSON)

- (NSData *)bs_JSONData;

- (NSString *)bs_JSONString;

@end