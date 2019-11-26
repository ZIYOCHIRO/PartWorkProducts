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
    
    UIButton *firstButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 50)];
    [firstButton setTitle:@"首次验证" forState:UIControlStateNormal];
    firstButton.backgroundColor = [UIColor orangeColor];
    [firstButton addTarget:self action:@selector(showFirstVerify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:firstButton];
    
    UIButton *secondButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
    [secondButton setTitle:@"时间限制" forState:UIControlStateNormal];
    secondButton.backgroundColor = [UIColor orangeColor];
    [secondButton addTarget:self action:@selector(showTimeLimit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secondButton];
    
    UIButton *thirdButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 300, 100, 50)];
    [thirdButton setTitle:@"支付限制" forState:UIControlStateNormal];
    thirdButton.backgroundColor = [UIColor orangeColor];
    [thirdButton addTarget:self action:@selector(showPayLimit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdButton];
    
    UIButton *fourth = [[UIButton alloc]initWithFrame:CGRectMake(20, 400, 100, 50)];
    [fourth setTitle:@"试玩到时" forState:UIControlStateNormal];
    fourth.backgroundColor = [UIColor orangeColor];
    [fourth addTarget:self action:@selector(showTimeUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fourth];
    
}

- (void)showFirstVerify {
    FirstNameVerifyView *firstNameVerifyView = [[FirstNameVerifyView alloc]initWithFrame: [UIScreen mainScreen].bounds];
    firstNameVerifyView.viewType = Idverify;
    [firstNameVerifyView config];
    [self.view addSubview:firstNameVerifyView];
}

- (void)showTimeLimit {
    FirstNameVerifyView *firstNameVerifyView = [[FirstNameVerifyView alloc]initWithFrame: [UIScreen mainScreen].bounds];
    firstNameVerifyView.viewType = TimeLimit;
    [firstNameVerifyView config];
    [self.view addSubview:firstNameVerifyView];
}

- (void)showPayLimit {
    FirstNameVerifyView *firstNameVerifyView = [[FirstNameVerifyView alloc]initWithFrame: [UIScreen mainScreen].bounds];
    firstNameVerifyView.viewType = PayLimit;
    [firstNameVerifyView config];
    [self.view addSubview:firstNameVerifyView];
}

- (void)showTimeUp {
    FirstNameVerifyView *firstNameVerifyView = [[FirstNameVerifyView alloc]initWithFrame: [UIScreen mainScreen].bounds];
    firstNameVerifyView.viewType = TimeUp;
    [firstNameVerifyView config];
    [self.view addSubview:firstNameVerifyView];
}


@end
