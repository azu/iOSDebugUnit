//
//  Created by azu on 12/10/09.
//


#import <Foundation/Foundation.h>


@interface AZDebugUnit : NSObject

@property(nonatomic, strong) UIGestureRecognizer *invokeGestureRecognizer;

+ (AZDebugUnit *)sharedManager;

- (void)start;

- (void)setInvokeGestureRecognizer:(UIGestureRecognizer *)newGestureRecognizer;

@end