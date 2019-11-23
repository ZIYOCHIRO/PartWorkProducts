//
//  ViewController.m
//  AgeLimit
//
//  Created by ruixinyi on 2019/11/22.
//  Copyright © 2019 ruixinyi. All rights reserved.
//

#import "ViewController.h"
#import "FirstNameVerifyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FirstNameVerifyView *firstNameVerifyView = [[FirstNameVerifyView alloc]initWithFrame: [UIScreen mainScreen].bounds];
    [self.view addSubview:firstNameVerifyView];
}


@end
