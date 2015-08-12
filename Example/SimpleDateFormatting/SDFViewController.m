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
            NSString *str = [SDFSimpleDateFormatter defaultFormattedStringFromDate:[NSDate date]];
            NSLog(@"DEFAULT DATE #%da :: %@", i, str);
            str = nil;
            
            str = [SDFSimpleDateFormatter longFormattedStringFromDate:[NSDate date]];
            NSLog(@"LONG DATE    #%db :: %@", i, str);
            str = nil;
            
            str = [SDFSimpleDateFormatter shortFormattedStringFromDate:[NSDate date]];
            NSLog(@"SHORT DATE   #%dc :: %@", i, str);
            str = nil;
            
            str = [SDFSimpleDateFormatter defaultDateTimeStringFromDate:[NSDate date]];
            NSLog(@"DEFAULT DATE/TIME #%da :: %@", i, str);
            str = nil;
            
            str = [SDFSimpleDateFormatter longDateTimeStringFromDate:[NSDate date]];
            NSLog(@"LONG DATE/TIME    #%db :: %@", i, str);
            str = nil;
            
            str = [SDFSimpleDateFormatter shortDateTimeStringFromDate:[NSDate date]];
            NSLog(@"SHORT DATE/TIME   #%dc :: %@", i, str);
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