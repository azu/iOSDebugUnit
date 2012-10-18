#import <objc/runtime.h>

static NSDate *__fakeDate = nil;
static Method originalDate = nil;

@implementation NSDate (AZFakeDate)

+ (void)load {
    [super load];

    // date -> fakeDate
    originalDate = class_getClassMethod([NSDate class], @selector(date));
    Method mockDate = class_getClassMethod([self class], @selector(fakeDate));
    method_exchangeImplementations(originalDate, mockDate);
}

+ (void)resetSwizzleMethods {
    if (originalDate != nil){
        // fakeDate -> date
        Method mockDate = class_getClassMethod([self class], @selector(fakeDate));
        method_exchangeImplementations(mockDate, originalDate);
    }
}


+ (NSDate *)fakeDate {
    if (__fakeDate == nil){
        // This method is meant to be swizzled, so calling fakeDate will actually call the swizzlee.
        return [self fakeDate];
    } else {
        return __fakeDate;
    }
}

+ (void)setFakeDate:(NSDate *)date {
    __fakeDate = date;
}


@end
