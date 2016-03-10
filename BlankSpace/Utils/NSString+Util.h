//
//  NSString+Util.h
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonCrypto.h>

#define VALID_TEXT(str) StringWrapper(str.wpTrim)
@interface NSString (Util)
+ (NSString *)randomStringWithLength:(int)len;

- (NSString *)md5;
-(BOOL)isNotEmpty;

- (NSString *)replaceNewLine; //return a string "\n" replaced by empty

- (BOOL)isEmail;
- (BOOL)isValidPhone;
+ (BOOL)isNilOrEmpty:(NSString*)str;

- (NSString *)toBase64String;

- (NSString *)base64StringToOriginString;

// If the string only contains white space or \r\\n, this function returns nil \n
// else it returns a string trimed. \n
// if the string is nil, call this function will also get nil, which is desirable \n
// Use this method to determine if a string is empty is totally OK.
- (NSString *)wpTrim;
- (NSString *)cutStringWithLength:(NSInteger)length;
- (NSString *)firstLetter;
- (NSNumber *)numberValue;
- (NSString *)stringByCapitalizeFirstLetter;
- (NSString *)imgUrlByAppendingSmallSuffix;
- (NSString *)imgUrlByAppendingMediumSuffix;


- (NSString *)imgUrlByAppendingSuffixLimitHeight:(NSInteger)height;

- (NSString *)imgUrlByAppendingSuffixLimitWidth:(NSInteger)width;

+ (NSString *)uuid;

- (CGSize)lg_sizeWithFont:(UIFont *)font;
- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (NSString *)urlDecode;

- (NSString *)urlEncode;
- (NSURL *)urlValue;
- (NSURLRequest *)urlRequest;

- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (void)lg_drawInRect:(CGRect)rect withFont:(UIFont *)font;
- (void)lg_drawAtPoint:(CGPoint)point withFont:(UIFont *)font;

- (NSString *)stringValue;

- (NSComparisonResult)contactCompare:(NSString *)anotherString;

- (NSAttributedString *)rmbAttributedStringWithSmallFontSize:(CGFloat)smallFontSize bigFontSize:(CGFloat)bigFontSize;

/**
 *  查找字符串中的数字（可以自定义一个set集合），自定义它们的颜色和字体
 *
 *  @param numberColor 当值为nil时，取默认的color
 *  @param numberFont  当值为0时，取默认的font
 *  @param textColor   当值为nil时，取默认的color
 *  @param textFont    当值为0时，取默认的font
 *
 *  @return 返回一个 NSAttributedString
 */
- (NSAttributedString *)numberAttributedStringWithNumberColor:(UIColor *)numberColor numberFont:(CGFloat)numberFont textColor:(UIColor *)textColor textFont:(CGFloat)textFont;

- (NSAttributedString *)numberAttributedStringWithNumberColor:(UIColor *)numberColor numberFont:(CGFloat)numberFont;

@end