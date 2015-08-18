//
//  SDFSimpleDateFormatter.h
//  SimpleDateFormatter
//
//  Created by Richard Stelling on 12/08/2015.
//
//

#import <Foundation/Foundation.h>

#define SDFCompilerCachedResult __attribute__((pure))

NS_ASSUME_NONNULL_BEGIN

@interface SDFSimpleDateFormatter : NSObject

// NSDate to NSString formatting methods

/**
 Returns a string formatted with the medium style: Aug 12, 2015
 */
+ (NSString *)defaultFormattedStringFromDate:(NSDate *)date SDFCompilerCachedResult;

/**
 Returns a string formatted with the long style: August 12, 2015
 */
+ (NSString *)longFormattedStringFromDate:(NSDate *)date SDFCompilerCachedResult;

/**
 Returns a string formatted with the short style: 8/12/15 (MM/DD/YY)
 */
+ (NSString *)shortFormattedStringFromDate:(NSDate *)date SDFCompilerCachedResult;


// Experimental

+ (NSString *)defaultDateTimeStringFromDate:(NSDate *)date SDFCompilerCachedResult;

+ (NSString *)longDateTimeStringFromDate:(NSDate *)date SDFCompilerCachedResult;

+ (NSString *)shortDateTimeStringFromDate:(NSDate *)date SDFCompilerCachedResult;

//IDEA: API that that takes style and format?

// Reletive Dates
+ (NSString *)relativeStringFromDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END