//
//  NSDate+SimpleDateFormatter.h
//  SimpleDateFormatter
//
//  Created by Richard Stelling on 12/08/2015.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (SimpleDateFormatter)

- (NSString *)defaultFormattedString:(BOOL)withTime;

- (NSString *)longFormattedString:(BOOL)withTime;

- (NSString *)shortFormattedString:(BOOL)withTime;

@end
