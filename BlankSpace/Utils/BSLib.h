//
//  BSLib.h
//  BlankSpace
//
//  Created by stone on 3/7/16.
//  Copyright © 2016 stone. All rights reserved.
//

#ifndef BSLib_h
#define BSLib_h

#import "NSString+Util.h"

#import "UIImage+Utils.h"
#import "UIColor+Tools.h"
#import "TypeCheckMacros.h"
#import "BSJSONWrapper.h"
//#import "UIView+LayoutMethods.h"

#define WeakSelf __weak typeof(self)
#define WeakfySelf WeakSelf wself = self;
#define StrongfySelf typeof(self) sself = wself;

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#endif /* BSLib_h */
