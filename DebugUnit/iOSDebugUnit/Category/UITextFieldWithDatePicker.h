//
//  Created by azu on 12/05/22.
//


#import <Foundation/Foundation.h>

@protocol UITextFieldWithDatePickerProtocol;

@interface UITextFieldWithDatePicker : UITextField {
}

@property(nonatomic, retain) UIDatePicker *datePicker;

@property(nonatomic) NSInteger datePickerMode;

@property(nonatomic, weak) id <UITextFieldWithDatePickerProtocol> delegate;

- (void)updateText;


@end