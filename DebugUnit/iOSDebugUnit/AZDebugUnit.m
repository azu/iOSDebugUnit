//
//  Created by azu on 12/10/09.
//


#import "AZDebugUnit.h"
#import "AZDebugMenuViewController.h"
#import "CBIntrospect.h"


@implementation AZDebugUnit {

@private
    UIGestureRecognizer *_invokeGestureRecognizer;
}

@synthesize invokeGestureRecognizer = _invokeGestureRecognizer;

static dispatch_once_t introspectOnce;

#pragma mark - Singleton methods

static AZDebugUnit *sharedManager_ = nil;

+ (AZDebugUnit *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager_ = [[self alloc] init];
    });
    return sharedManager_;
}


- (UIWindow *)mainWindow {
    NSArray *windows = [[UIApplication sharedApplication] windows];
    if (windows.count == 0){
        return nil;
    }
    return [windows objectAtIndex:0];
}

- (void)start {
    dispatch_once(&introspectOnce, ^{
        [[CBIntrospect sharedIntrospector] start];
    });

    UIWindow *mainWindow = [self mainWindow];
    AZDebugMenuViewController *debugMenuViewController = [[AZDebugMenuViewController alloc] init];
    [mainWindow.rootViewController presentViewController:debugMenuViewController animated:YES completion:nil];
}

- (void)setInvokeGestureRecognizer:(UIGestureRecognizer *)newGestureRecognizer {

    dispatch_once(&introspectOnce, ^{
        [[CBIntrospect sharedIntrospector] start];
    });

    UIWindow *mainWindow = [self mainWindow];
    if (self.invokeGestureRecognizer != nil){
        [mainWindow removeGestureRecognizer:self.invokeGestureRecognizer];
    }
    _invokeGestureRecognizer = newGestureRecognizer;
    [_invokeGestureRecognizer addTarget:self action:@selector(start)];
    [mainWindow addGestureRecognizer:_invokeGestureRecognizer];
}

@end