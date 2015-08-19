//
//  SDFViewController.m
//  SimpleDateFormatting
//
//  Created by Richard Stelling on 08/12/2015.
//  Copyright (c) 2015 Richard Stelling. All rights reserved.
//

#import "SDFViewController.h"

@import SimpleDateFormatting;

@interface SDFViewController ()

@end

@interface SDFViewController (Tests)

- (void)runTests;

@end

@implementation SDFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //[self runTests];
    
    NSTimeInterval kSecond      = 1.0;
    NSTimeInterval kMin         = kSecond * 60;
    NSTimeInterval kHour        = kMin * 60;
    NSTimeInterval kDay         = kHour * 24;
    NSTimeInterval kWeek        = kDay * 7;
    NSTimeInterval kMonth       = kWeek * 4;
    NSTimeInterval kYear        = kMonth * 12;

//    NSTimeInterval epocs[] = {  kSecond,
//                                kMin,
//                                kHour,
//                                kDay,
//                                kWeek,
//                                kMonth,
//                                kYear,   };
    
    NSDate *threeYearskSixMonthsAgo = [NSDate dateWithTimeIntervalSinceNow:-((kYear * 3) + (kMonth * 6) + (kWeek * 2) + (kDay * 3) + (kHour * 5) + (kMin * 36) + (kSecond * 2))];
    NSDate *threeYearskAgo = [NSDate dateWithTimeIntervalSinceNow:-kYear * 3];
    NSDate *oneYearkAgo = [NSDate dateWithTimeIntervalSinceNow:-kYear];
    NSDate *sixMonthsAgo = [NSDate dateWithTimeIntervalSinceNow:-kMonth * 6];
    NSDate *oneMonthAgo = [NSDate dateWithTimeIntervalSinceNow:-kMonth];
    NSDate *twoWeeksAgo = [NSDate dateWithTimeIntervalSinceNow:-kWeek * 2];
    NSDate *oneWeekAgo = [NSDate dateWithTimeIntervalSinceNow:-kWeek];
    NSDate *fiveDaysAgo = [NSDate dateWithTimeIntervalSinceNow:-kDay * 5];
    NSDate *oneDayAgo = [NSDate dateWithTimeIntervalSinceNow:-kDay];
    NSDate *twelveHoursAgo = [NSDate dateWithTimeIntervalSinceNow:-kHour * 12];
    NSDate *oneHourAgo = [NSDate dateWithTimeIntervalSinceNow:-kHour];
    NSDate *thirtyMinsAgo = [NSDate dateWithTimeIntervalSinceNow:-kMin * 30];
    NSDate *oneMinkAgo = [NSDate dateWithTimeIntervalSinceNow:-kMin];
    NSDate *fortyfiveSecondsAgo = [NSDate dateWithTimeIntervalSinceNow:-kSecond * 45];
    NSDate *oneSecondAgo = [NSDate dateWithTimeIntervalSinceNow:-kSecond];
    
    //NSString *dateStr = [SDFSimpleDateFormatter relativeStringFromDate:fortyfiveSecondsAgo];
    
    NSLog(@"Start...");
    for (NSDate *date in     @[     [NSDate dateWithTimeIntervalSinceNow:-321020102.00], //
                                    [NSDate dateWithTimeIntervalSinceNow:-321020100.00],
                                    threeYearskSixMonthsAgo,
                                   threeYearskAgo,
                                   oneYearkAgo,
                                   sixMonthsAgo,
                                   oneMonthAgo,
                                   twoWeeksAgo,
                                   oneWeekAgo,
                                   fiveDaysAgo,
                                   oneDayAgo,
                                   twelveHoursAgo,
                                   oneHourAgo,
                                   thirtyMinsAgo,
                                   oneMinkAgo,
                                   fortyfiveSecondsAgo,
                                   oneSecondAgo ]) {
        NSString *dateStr = [SDFSimpleDateFormatter relativeStringFromDate:date];
    }
    

    
    //////////
//    NSDate *testDate = threeYearskSixMonthsAgo;
//    NSTimeInterval timeInterval = testDate.timeIntervalSinceNow;
//    //NSTimeInterval timeInterval = [nowDate timeIntervalSinceDate:oneDayAgo];
//    //NSTimeInterval timeInterval = [nowDate timeIntervalSinceDate:[NSDate distantFuture]];
//    //NSTimeInterval timeInterval = [nowDate timeIntervalSinceDate:[NSDate distantPast]];
//    NSTimeInterval normlisedInterval = roundf(timeInterval);
//    
//    NSLog(@"%@ %f", testDate, normlisedInterval);
//    
//    NSTimeInterval remainder = fabs(normlisedInterval);
//    
//    int startingEpoc = 6;
//
//    typedef struct _dateElements {
//        int seconds;
//        int minuites;
//        int hours;
//        int days;
//        int weeks;
//        int months;
//        int years; //index 6
//    } dateElements;
//    
//    dateElements de = {0, 0, 0, 0, 0, 0, 0};
//    int *start = &de.seconds;
//    
//    for (; startingEpoc >= 0; startingEpoc--)
//    {
//        if(remainder > epocs[startingEpoc])
//        {
////            size_t sz = sizeof(de.seconds);
////            size_t charbit = CHAR_BIT;
////            start = &de.seconds;
////            size_t toAdd = (sz * startingEpoc);
////            start += toAdd;
//            
//            start += startingEpoc;
//            
//            break;
//        }
//        
////        size_t sz = sizeof(int) / 4 ;
////        start -= sz;
//    }
//    
//    int currentEpoc = startingEpoc;
//    
//    do {
//        
//        double epoc = epocs[currentEpoc];
//        double value = (remainder / epoc);
//        remainder = ((int)remainder % (int)epoc);
//        
//        NSLog(@"%d %d -> (%f)", currentEpoc, (int)value, remainder);
//        
//        *start = (int)value;
//        
//        currentEpoc--;
//        start--;
//        
//    } while (remainder > 0);
//    
//    //timeIntervalSinceNow
    
    return;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)onTestNumber1:(id)sender
{
    for(int i = 0; i < 2000; i++)
    {
        @autoreleasepool
        {
//            NSString *str = [SDFSimpleDateFormatter defaultFormattedStringFromDate:[NSDate date]];
//            NSLog(@"DEFAULT DATE #%da :: %@", i, str);
//            str = nil;
//            
//            str = [SDFSimpleDateFormatter longFormattedStringFromDate:[NSDate date]];
//            NSLog(@"LONG DATE    #%db :: %@", i, str);
//            str = nil;
//            
//            str = [SDFSimpleDateFormatter shortFormattedStringFromDate:[NSDate date]];
//            NSLog(@"SHORT DATE   #%dc :: %@", i, str);
//            str = nil;
//            
//            str = [SDFSimpleDateFormatter defaultDateTimeStringFromDate:[NSDate date]];
//            NSLog(@"DEFAULT DATE/TIME #%da :: %@", i, str);
//            str = nil;
//            
//            str = [SDFSimpleDateFormatter longDateTimeStringFromDate:[NSDate date]];
//            NSLog(@"LONG DATE/TIME    #%db :: %@", i, str);
//            str = nil;
//            
//            str = [SDFSimpleDateFormatter shortDateTimeStringFromDate:[NSDate date]];
//            NSLog(@"SHORT DATE/TIME   #%dc :: %@", i, str);
//            str = nil;
            
            NSString *str = nil;
            
            NSDate *date = [NSDate date];
            str = [date defaultFormattedString:NO];
            NSLog(@"DEFAULT DATE #%da :: %@", i, str);
            str = nil;
            
            str = [date longFormattedString:NO];
            NSLog(@"SHORT DATE #%da :: %@", i, str);
            str = nil;

            str = [date shortFormattedString:NO];
            NSLog(@"SHORT DATE #%da :: %@", i, str);
            str = nil;
            
            str = [date defaultFormattedString:YES];
            NSLog(@"DEFAULT DATE #%db :: %@", i, str);
            str = nil;
            
            str = [date longFormattedString:YES];
            NSLog(@"SHORT DATE #%db :: %@", i, str);
            str = nil;
            
            str = [date shortFormattedString:YES];
            NSLog(@"SHORT DATE #%db :: %@", i, str);
            str = nil;
        }
    }
}

@end

#pragma mark - Tests

@interface SDFSimpleDateFormatter ()

+ (void)test1;

@end

@implementation SDFViewController (Tests)

- (void)runTests
{
    //test 1
    [SDFSimpleDateFormatter test1];
}

@end