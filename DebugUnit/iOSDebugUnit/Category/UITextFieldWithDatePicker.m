//
//  Created by azu on 12/05/22.
//


#import "UITextFieldWithDatePicker.h"
#import "UITextFieldWithDatePickerProtocol.h"


@implementation UITextFieldWithDatePicker {

@private
    UIDatePicker *_datePicker;
}

@synthesize datePicker = _datePicker;
@synthesize datePickerMode = _datePickerMode;


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self){
        return nil;
    }
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self.datePicker setTimeZone:[NSTimeZone systemTimeZone]];

    return self;
}

- (UIView *)inputView {
    if (self.datePickerMode == UIDatePickerModeDate){
        self.datePicker.datePickerMode = UIDatePickerModeDate;
    } else if (self.datePickerMode == UIDatePickerModeTime){
        self.datePicker.datePickerMode = UIDatePickerModeTime;
    } else if (self.datePickerMode == UIDatePickerModeDateAndTime){
        self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }

    return self.datePicker;
}

- (void)updateText {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [dateFormatter setCalendar:calendar];
    [dateFormatter setLocale:[NSLocale systemLocale]];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    if (self.datePickerMode == UIDatePickerModeDate){
        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    } else if (self.datePickerMode == UIDatePickerModeTime){
        [dateFormatter setDateFormat:@"HH:mm"];
    } else {
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    }
    self.text = [dateFormatter stringFromDate:self.datePicker.date];
}

- (void)doneDatePicker {
    if (self.datePicker.date != nil){
        if ([self.delegate respondsToSelector:@selector(saveDate:)]){
            [self.delegate saveDate:self];
        }
        [self updateText];
    }
    [self resignFirstResponder];
}

- (void)cancelDatePicker {
    [self resignFirstResponder];
}

- (UIView *)inputAccessoryView {
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    keyboardDoneButtonView.barStyle = UIBarStyleBlack;
    keyboardDoneButtonView.translucent = YES;
    keyboardDoneButtonView.tintColor = nil;
    [keyboardDoneButtonView sizeToFit];

    UIBarButtonItem *cancelButton;
    cancelButton = [[UIBarButtonItem alloc] init];
    cancelButton.style = UIBarButtonItemStyleBordered;
    cancelButton.title = @"キャンセル";
    cancelButton.target = self;
    cancelButton.action = @selector(cancelDatePicker);
    UIBarButtonItem *centerSpace = [[UIBarButtonItem alloc]
                                                     initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
        target:nil action:nil];
    UIBarButtonItem *doneButton;
    doneButton = [[UIBarButtonItem alloc] init];
    doneButton.style = UIBarButtonItemStyleDone;
    doneButton.title = @"保存";
    doneButton.target = self;
    doneButton.action = @selector(doneDatePicker);
    [keyboardDoneButtonView setItems:@[cancelButton, centerSpace, doneButton]];

    return keyboardDoneButtonView;
}

@end