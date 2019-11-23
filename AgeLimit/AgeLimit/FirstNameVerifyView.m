//
//  FirstNameVerifyView.m
//  AgeLimit
//
//  Created by ruixinyi on 2019/11/23.
//  Copyright © 2019 ruixinyi. All rights reserved.
//

#import "FirstNameVerifyView.h"

@interface FirstNameVerifyView ()
{
    UIView *blackView;
    UIImageView *backImageView;
    UILabel *topLabel;
    UILabel *mediumLabel;
    UILabel *bottomLabel;
    
    UIButton *goVerifyButton;
    UIButton *goPlayButton;
    
    UITextField *idNumberTextField;
    UIButton *goNextButton;
    
    CGFloat backImageVieww;
    CGFloat backImageViewh;
    CGFloat buttonw;
    CGFloat buttonh;
    
}

@end

@implementation FirstNameVerifyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [self config];
    }
    
    return self;
}

- (void)config{
    
    backImageVieww = MIN(self.bounds.size.width, self.bounds.size.height)*465/540;
    if (backImageVieww >= 350.0f) {
        backImageVieww = 350.0f;
    }
    backImageViewh = backImageVieww*490/465;
    buttonw = backImageVieww*360/465;
    buttonh = backImageViewh*70/490;
    
    
    backImageView = [[UIImageView alloc]initWithFrame: CGRectMake((CGRectGetWidth(self.frame) - backImageVieww)/2, (CGRectGetHeight(self.frame) - backImageViewh)/2, backImageVieww, backImageViewh)];
    backImageView.image = [UIImage imageNamed:@"firstAgeVerifyBackImage"];
    backImageView.userInteractionEnabled = YES;
    [self addSubview:backImageView];
    
    topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, backImageVieww, backImageViewh*80/490)];
    topLabel.textColor = [UIColor colorWithRed:11/255.0 green:86/255.0 blue:111/255.0 alpha:0.8];
    topLabel.text = @"实名认证";
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.font = [UIFont boldSystemFontOfSize:24];
    [backImageView addSubview:topLabel];
    
    mediumLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, backImageViewh*80/490, backImageVieww - 20, backImageViewh*140/490)];
    mediumLabel.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
    mediumLabel.text = @"文化部规定 \n游戏用户必须进行实名认证";
    mediumLabel.font = [UIFont boldSystemFontOfSize:16];
    mediumLabel.textAlignment = NSTextAlignmentCenter;
    mediumLabel.numberOfLines = 2;
    mediumLabel.adjustsFontSizeToFitWidth = YES;
    [backImageView addSubview:mediumLabel];
    
    goVerifyButton = [UIButton buttonWithType: UIButtonTypeCustom];
    goVerifyButton.frame = CGRectMake((backImageVieww - buttonw)/2, backImageViewh*220/490, buttonw, buttonh);
    [goVerifyButton setBackgroundImage:[UIImage imageNamed:@"goVerifyImage"] forState:UIControlStateNormal];
    [goVerifyButton setTitle:@"去认证" forState:UIControlStateNormal];
    goVerifyButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [goVerifyButton addTarget:self action:@selector(goVerify) forControlEvents:UIControlEventTouchUpInside];
    [backImageView addSubview:goVerifyButton];
    
    
    goPlayButton = [UIButton buttonWithType: UIButtonTypeCustom];
    goPlayButton.frame = CGRectMake( (backImageVieww - buttonw)/2, backImageViewh*310/490, buttonw, buttonh);
    [goPlayButton setBackgroundImage:[UIImage imageNamed:@"goPlayImage"] forState:UIControlStateNormal];
    [goPlayButton setTitle:@"体验试玩" forState:UIControlStateNormal];
    goPlayButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [goPlayButton addTarget:self action:@selector(goPlay) forControlEvents:UIControlEventTouchUpInside];
    [backImageView addSubview:goPlayButton];
    
    bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,  backImageViewh*380/490, backImageVieww - 20, backImageViewh*90/490)];
    bottomLabel.textColor = [UIColor colorWithRed:148/255.0 green:120/255.0 blue:147/255.0 alpha:1];
    bottomLabel.text = @"体验试玩1小时后必须通过实名认证 \n才能继续游戏";
    bottomLabel.font = [UIFont boldSystemFontOfSize:14];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.numberOfLines = 2;
    [backImageView addSubview:bottomLabel];
    
}

- (void)goVerify {
    // 删除视图
    [goVerifyButton removeFromSuperview];
    [goPlayButton removeFromSuperview];
    [bottomLabel removeFromSuperview];
    
    // 添加视图
    
    idNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake((backImageVieww - backImageVieww*405/465)/2, backImageViewh*230/490, backImageVieww*405/465, backImageViewh*60/490)];
    idNumberTextField.placeholder = @"请输入您的身份证号";
   
    [idNumberTextField setBackground:[UIImage imageNamed:@"textFieldImage"]];
    // idNumberTextField.keyboardType = UIKeyboardTypeNumberPad,
    [backImageView addSubview:idNumberTextField];
    
    
    
    
    goNextButton = [UIButton buttonWithType: UIButtonTypeCustom];
    goNextButton.frame = CGRectMake( (backImageVieww - buttonw)/2, backImageViewh*350/490, buttonw, buttonh);
    [goNextButton setBackgroundImage:[UIImage imageNamed:@"goNextGrayImage"] forState:UIControlStateNormal];
    [goNextButton setTitle:@"下一步" forState:UIControlStateNormal];
    goNextButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [goNextButton addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [backImageView addSubview:goNextButton];
    
    
}

- (void)goPlay {
    [self removeFromSuperview];
}

- (void)goNext {
    
}
@end
