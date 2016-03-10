//
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "NSArray+Util.h"

@implementation NSArray (Util)
- (NSArray *)arrayByReplaceObjectAtIndex:(NSInteger)index withObject:(id)object {
    NSMutableArray *mArray = self.mutableCopy;
    mArray[index] = object;
    return mArray;
}

@end