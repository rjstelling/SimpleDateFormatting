//
//  NSDate+SimpleDateFormatter.m
//  SimpleDateFormatter
//
//  Created by Richard Stelling on 12/08/2015.
//
//

#import "NSDate+SimpleDateFormatter.h"
#import "SDFSimpleDateFormatter.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSDate (SimpleDateFormatter)

- (NSString *)defaultFormattedString:(BOOL)withTime
{
    return withTime ?
        [SDFSimpleDateFormatter defaultDateTimeStringFromDate:self] :
        [SDFSimpleDateFormatter defaultFormattedStringFromDate:self];
}

- (NSString *)longFormattedString:(BOOL)withTime
{
    return withTime ?
        [SDFSimpleDateFormatter longDateTimeStringFromDate:self] :
        [SDFSimpleDateFormatter longFormattedStringFromDate:self];
}

- (NSString *)shortFormattedString:(BOOL)withTime
{
    return withTime ?
        [SDFSimpleDateFormatter shortDateTimeStringFromDate:self] :
        [SDFSimpleDateFormatter shortFormattedStringFromDate:self];
}

- (NSString *)reletiveString
{
    return [SDFSimpleDateFormatter relativeStringFromDate:self];
}

@end

NS_ASSUME_NONNULL_END