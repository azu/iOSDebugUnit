//
//  AZDebugMenuViewController.m
//  DebugUnit
//
//  Created by azu on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AZDebugMenuViewController.h"
#import "CBIntrospect.h"
#import "NSDate+UnitTesting.h"
#import "UITextFieldWithDatePicker.h"

@interface AZDebugMenuViewController ()

@end

@implementation AZDebugMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fakeDateTextField.datePickerMode = UIDatePickerModeDateAndTime;
    self.fakeDateTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateView];
}

- (void)updateView {
    [self.fakeDateTextField updateText];
}
#pragma mark - Action

- (IBAction)runIntrospector:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [[CBIntrospect sharedIntrospector] invokeIntrospector];
    }];
}

- (IBAction)resetFakeDate:(id)sender {
    [NSDate resetSwizzleMethods];
    [self updateView];
}

- (IBAction)closeSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveDate:(UITextFieldWithDatePicker *)sender {
    // NSate#dateの入れ替え
    NSDate *date = sender.datePicker.date;
    [NSDate setFakeDate:date];

    [self updateView];
}

@end
