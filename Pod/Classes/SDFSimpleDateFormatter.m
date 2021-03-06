//
//  SDFSimpleDateFormatter.m
//  SimpleDateFormatter
//
//  Created by Richard Stelling on 12/08/2015.
//
//

#import "SDFSimpleDateFormatter.h"

/*
 // Use something like this to laod a resource bundle
 
 NSString *bundlePath = [[NSBundle bundleForClass:someClassFromYourPod.class] pathForResource:@"MyProject" ofType:@"bundle"];
 NSBundle *projectBundle = [NSBundle bundleWithPath:bundlePath];

 */

#ifndef SDF_RELETIVE_DATE_TEMPLATE_STRINGS  
# define SDF_RELETIVE_DATE_TEMPLATE_STRINGS @"SDFReletiveDates"
#endif

#ifndef SDF_RELETIVE_DATE_TEMPLATE_STRINGS_BUNDLE
# define SDF_RELETIVE_DATE_TEMPLATE_STRINGS_BUNDLE [NSBundle bundleForClass:[self class]]
#endif

#define SDFReletiveDateString(str, value, epoc) \
    ({ \
        NSString *fmt = NSLocalizedStringFromTableInBundle(str, SDF_RELETIVE_DATE_TEMPLATE_STRINGS, SDF_RELETIVE_DATE_TEMPLATE_STRINGS_BUNDLE, @""); \
        [NSString stringWithFormat:fmt, value, epoc]; \
    })

typedef struct _SDFDateElements {
    unsigned int seconds; //index: 0
    unsigned int minuites;
    unsigned int hours;
    unsigned int days;
    unsigned int weeks;
    unsigned int months;
    unsigned int years; //index: 6
} SDFDateElements;

typedef struct _SDFDateObject {
    BOOL isFuture;
    SDFDateElements elements;
} SDFDateObject;

const NSTimeInterval SDFSecond      = 1.0;
const NSTimeInterval SDFMin         = SDFSecond * 60.0;
const NSTimeInterval SDFHour        = SDFMin * 60.0;
const NSTimeInterval SDFDay         = SDFHour * 24.0;
const NSTimeInterval SDFWeek        = SDFDay * 7.0;
const NSTimeInterval SDFMonth       = SDFWeek * 4.0;
const NSTimeInterval SDFYear        = SDFMonth * 12.0;

const NSTimeInterval SDFEpocs[] = { SDFSecond, SDFMin, SDFHour, SDFDay, SDFWeek, SDFMonth, SDFYear };

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

+ (void)getDateElementsFromDate:(NSDate *)date elements:(SDFDateElements *)dateElements
{
    NSTimeInterval timeInterval = date.timeIntervalSinceNow;
    NSTimeInterval normlisedInterval = roundf(timeInterval); //THIS CAUSES LOSS OF SECONDS IN LONG TIME SPANS
    
    NSTimeInterval remainder = fabs(normlisedInterval);
    
    // Short circut the method and return zeros in struct
    if(remainder == 0)
        return;
    
    int startingEpocIndex = 6; //(sizeof(SDFDateElements) / sizeof(unsigned int)); //zero based index
    
    //unsigned int *startingDateElement = &dateObject->elements.seconds;
    unsigned int *startingDateElement = &dateElements->seconds;
    
    for (; startingEpocIndex >= 0; startingEpocIndex--)
    {
        if(remainder >= SDFEpocs[startingEpocIndex])
        {
            startingDateElement += startingEpocIndex;
            break;
        }
    }
    
    int currentEpocIndex = startingEpocIndex;
    
    do
    {
        double epoc = SDFEpocs[currentEpocIndex];
        double value = (remainder / epoc);
        remainder = (NSTimeInterval)((unsigned int)remainder % (unsigned int)epoc);
        
        *startingDateElement = (unsigned int)(value);
        
        currentEpocIndex--;
        startingDateElement--;
        
    } while (remainder > 0);
    
    //NSLog(@"%p", dateObject);
}

#pragma mark - Public API

+ (NSString *)relativeStringFromDate:(NSDate *)date
{
    SDFDateElements dateElements = {0L};
    [self getDateElementsFromDate:date elements:&dateElements];
    
    //Strings
    NSString *template = @"Just now";
    NSString *epoc = nil;
    unsigned int value = -1;
    
    int startingEpocIndex = 0;
    NSArray *epocPluralKeys = @[ @"years", @"months", @"weeks", @"days", @"hours", @"minutes", @"seconds" ];
    NSArray *epocSingularKeys = @[ @"year", @"month", @"week", @"day", @"hour", @"minute", @"second" ];
    
    unsigned int *startingDateElement = &dateElements.years;
    
    for (; startingEpocIndex <= 6; startingEpocIndex++)
    {
        value = *startingDateElement;
        
        //Template
        if(startingEpocIndex == 6)
            template = @"<N> <EPOC> ago";
        else if(startingEpocIndex == 5)
            template = @"About <N> <EPOC> ago";
            
        // Epoc
        if(value > 1)
        {
            epoc = epocPluralKeys[startingEpocIndex];
            break;
        }
        else if (value > 0)
        {
            epoc = epocSingularKeys[startingEpocIndex];
            break;
        }
        else
        {
            startingDateElement--;
        }
    }
    
    //TODO: This is gross
    if(startingEpocIndex == 7)
        template = @"Just now";
    
//#ifdef DEBUG
//    
//    NSBundle *bundle = SDF_RELETIVE_DATE_TEMPLATE_STRINGS_BUNDLE?SDF_RELETIVE_DATE_TEMPLATE_STRINGS_BUNDLE:[NSBundle mainBundle];
//    
//    NSAssert([bundle pathForResource:SDF_RELETIVE_DATE_TEMPLATE_STRINGS ofType:@"strings"], @"Cannot load strings file");
//    
//    NSLog(@"%@", SDF_RELETIVE_DATE_TEMPLATE_STRINGS);
//    NSLog(@"%@", bundle);
//    
//#endif
    
    NSString *reletiveDate = SDFReletiveDateString(template, value, epoc);
    
    return reletiveDate;
}

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
