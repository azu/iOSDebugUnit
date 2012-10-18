//
//  AZDebugMenuViewController.h
//  DebugUnit
//
//  Created by azu on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "UITextFieldWithDatePickerProtocol.h"

@class UITextFieldWithDatePicker;

@interface AZDebugMenuViewController : UIViewController <UITextFieldWithDatePickerProtocol>

@property(weak, nonatomic) IBOutlet UITextFieldWithDatePicker *fakeDateTextField;

- (IBAction)runIntrospector:(id)sender;

- (IBAction)resetFakeDate:(id)sender;

- (IBAction)closeSelf:(id)sender;

@end
