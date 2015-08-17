//
//  SDFSimpleDateFormatter.m
//  SimpleDateFormatter
//
//  Created by Richard Stelling on 12/08/2015.
//
//

#import "SDFSimpleDateFormatter.h"

@interface SDFSimpleDateFormatter ()

+ (nonnull NSDateFormatter *)defaultDateFormatter SDFCompilerCachedResult;
+ (nonnull NSDateFormatter *)longDateFormatter SDFCompilerCachedResult;
+ (nonnull NSDateFormatter *)shortDateFormatter SDFCompilerCachedResult;

@end

@implementation SDFSimpleDateFormatter

#pragma mark - Private API

//TODO: Change to copyDefaultDateFormatter?
+ (NSDateFormatter *)defaultDateFormatter
{
    static NSDateFormatter *defaultDateFormatter_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultDateFormatter_ = [[NSDateFormatter alloc] init];
        [defaultDateFormatter_ setLocale:[NSLocale currentLocale]];
        [defaultDateFormatter_ setDateStyle:NSDateFormatterMediumStyle];
        [defaultDateFormatter_ setTimeStyle:NSDateFormatterNoStyle];
    });
    
    //return [defaultDateFormatter_ copy];
    return defaultDateFormatter_;
}

+ (nonnull NSDateFormatter *)longDateFormatter
{
    static NSDateFormatter *longDateFormatter_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        longDateFormatter_ = [[self defaultDateFormatter] copy];
        [longDateFormatter_ setDateStyle:NSDateFormatterLongStyle];
    });
    
    return longDateFormatter_;
}

+ (nonnull NSDateFormatter *)shortDateFormatter
{
    static NSDateFormatter *shortDateFormatter_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shortDateFormatter_ = [[self defaultDateFormatter] copy];
        [shortDateFormatter_ setDateStyle:NSDateFormatterShortStyle];
    });
    
    return shortDateFormatter_;
}

+ (NSDateFormatter *)defaultDateTimeFormatter
{
    static NSDateFormatter *defaultDateFormatter_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultDateFormatter_ = [[self defaultDateFormatter] copy];
        [defaultDateFormatter_ setTimeStyle:NSDateFormatterMediumStyle];
    });
    
    //return [defaultDateFormatter_ copy];
    return defaultDateFormatter_;
}

+ (nonnull NSDateFormatter *)longDateTimeFormatter
{
    static NSDateFormatter *longDateFormatter_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        longDateFormatter_ = [[self defaultDateFormatter] copy];
        [longDateFormatter_ setTimeStyle:NSDateFormatterLongStyle];
    });
    
    return longDateFormatter_;
}

+ (nonnull NSDateFormatter *)shortDateTimeFormatter
{
    static NSDateFormatter *shortDateFormatter_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shortDateFormatter_ = [[self defaultDateFormatter] copy];
        [shortDateFormatter_ setTimeStyle:NSDateFormatterShortStyle];
    });
    
    return shortDateFormatter_;
}

#pragma mark - Public API

+ (NSString *)defaultFormattedStringFromDate:(NSDate *)date
{
    NSParameterAssert(date);
    
    NSDateFormatter *formatter = [self defaultDateFormatter];
    
    NSAssert(formatter, @"Formatter failed to be created.");
    
    return [formatter stringFromDate:date];
}

+ (NSString *)longFormattedStringFromDate:(NSDate *)date
{
    NSParameterAssert(date);
    
    NSDateFormatter *formatter = [self longDateFormatter];
    
    NSAssert(formatter, @"Formatter failed to be created.");
    
    return [formatter stringFromDate:date];
}

+ (NSString *)shortFormattedStringFromDate:(NSDate *)date
{
    NSParameterAssert(date);
    
    NSDateFormatter *formatter = [self shortDateFormatter];
    
    NSAssert(formatter, @"Formatter failed to be created.");
    
    return [formatter stringFromDate:date];
}

+ (NSString *)defaultDateTimeStringFromDate:(NSDate *)date
{
    NSParameterAssert(date);
    
    NSDateFormatter *formatter = [self defaultDateTimeFormatter];
    
    NSAssert(formatter, @"Formatter failed to be created.");
    
    return [formatter stringFromDate:date];
}

+ (NSString *)longDateTimeStringFromDate:(NSDate *)date
{
    NSParameterAssert(date);
    
    NSDateFormatter *formatter = [self longDateTimeFormatter];
    
    NSAssert(formatter, @"Formatter failed to be created.");
    
    return [formatter stringFromDate:date];
}

+ (NSString *)shortDateTimeStringFromDate:(NSDate *)date
{
    NSParameterAssert(date);
    
    NSDateFormatter *formatter = [self shortDateTimeFormatter];
    
    NSAssert(formatter, @"Formatter failed to be created.");
    
    return [formatter stringFromDate:date];
}

/*
 
 TESTS - TO BE REMOVED 
 
 */

+ (void)test1
{
    /*
    __unused id test = [SDFSimpleDateFormatter defaultDateFormatter];
    __unused __weak id weakTest = test;
    __unused __strong id strongTest = test;
    
    NSAssert(test, @"Retain count invailed");
    NSAssert(weakTest, @"Retain count invailed");
    NSAssert(strongTest, @"Retain count invailed");
    
   //NSLog(@"%@", [test description]);
    
    test = nil;
    NSAssert(!test, @"Retain count invailed");
    NSAssert(weakTest, @"Retain count invailed");
    NSAssert(strongTest, @"Retain count invailed");
    
    //NSLog(@"%@", [weakTest description]);
    
    strongTest = nil;
    NSAssert(!strongTest, @"Retain count invailed");
    NSAssert(!weakTest, @"Retain count invailed");
    
    //NSLog(@"%@", [weakTest description]);
     */
}

/*
 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
 [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
 [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
 
 NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:162000];
 
 NSString *formattedDateString = [dateFormatter stringFromDate:date];
 NSLog(@"formattedDateString: %@", formattedDateString);
 // Output for locale en_US: "formattedDateString: Jan 2, 2001".

 */

@end
