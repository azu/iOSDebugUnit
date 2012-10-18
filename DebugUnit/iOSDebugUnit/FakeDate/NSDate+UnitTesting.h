//
// Copyright 2012 azu MIT
//
#import <Foundation/Foundation.h>

@interface NSDate (AZFakeDate)

+ (void)resetSwizzleMethods;

+ (void)setFakeDate:(NSDate *)date;

@end
