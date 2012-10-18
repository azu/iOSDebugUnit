//
//  AZViewController.m
//  DebugUnit
//
//  Created by azu on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AZViewController.h"
#import "AZDebugUnit.h"

@interface AZViewController ()

@end

@implementation AZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"[NSDate+AZFakeDate+AZFakeDate date] = %@", [NSDate date]);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end