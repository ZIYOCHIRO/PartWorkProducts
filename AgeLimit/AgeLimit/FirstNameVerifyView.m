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
    UIImageView *warningImageView;
    UILabel *warningLabel;
    UIButton *warningButton;
    UILabel *warningBottomLabel;
    
    UIButton *goVerifyButton;
    UIButton *goPlayButton;
    
    UITextField *idNumberTextField;
    UIButton *goNextButton;
    UIButton *reInputButton;
    UIImageView *resultImageView;
    UILabel *resultLabel;
    
    CGFloat backImageVieww;
    CGFloat backImageViewh;
    CGFloat buttonw;
    CGFloat buttonh;
    NSInteger inputTimes;
    
    
}

@end

@implementation FirstNameVerifyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        UITapGestureRecognizer *tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
        [tapBackground setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tapBackground];
    }
    
    return self;
}

- (void)config{
    
    // 公用参数
    inputTimes = 0;
    backImageVieww = MIN(self.bounds.size.width, self.bounds.size.height)*465/540;
    if (backImageVieww >= 350.0f) {
        backImageVieww = 350.0f;
    }
    backImageViewh = backImageVieww*490/465;
    buttonw = backImageVieww*360/465;
    buttonh = backImageViewh*70/490;
    
    // 公用背景
    backImageView = [[UIImageView alloc]initWithFrame: CGRectMake((CGRectGetWidth(self.frame) - backImageVieww)/2, (CGRectGetHeight(self.frame) - backImageViewh)/2, backImageVieww, backImageViewh)];
    backImageView.image = [UIImage imageNamed:@"firstAgeVerifyBackImage"];
    backImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [backImageView addGestureRecognizer:tapBackground];
    [self addSubview:backImageView];
    
    // 公用标题
    topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, backImageVieww, backImageViewh*80/490)];
    topLabel.textColor = [UIColor colorWithRed:11/255.0 green:86/255.0 blue:111/255.0 alpha:0.8];
    topLabel.text = @"实名认证";
    topLabel.shadowColor = [UIColor grayColor];
    topLabel.shadowOffset = CGSizeMake(1, 1);
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.font = [UIFont boldSystemFontOfSize:24];
    [backImageView addSubview:topLabel];
    
    // 中间标题
    mediumLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, backImageViewh*85/490, backImageVieww - 20, backImageViewh*130/490)];
    mediumLabel.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
    NSString *string = @"相关部门规定 \n游戏用户必须进行实名认证";
    mediumLabel.font = [UIFont boldSystemFontOfSize:17];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 8.0; // 设置行间距
    paraStyle.alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    [attrString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, string.length)];
    mediumLabel.attributedText = attrString;
    mediumLabel.numberOfLines = 2;
    mediumLabel.adjustsFontSizeToFitWidth = YES;
    
    
    // 去认证按钮
    goVerifyButton = [UIButton buttonWithType: UIButtonTypeCustom];
    goVerifyButton.frame = CGRectMake((backImageVieww - buttonw)/2, backImageViewh*220/490, buttonw, buttonh);
    [goVerifyButton setBackgroundImage:[UIImage imageNamed:@"goVerifyImage"] forState:UIControlStateNormal];
    [goVerifyButton setTitle:@"去认证" forState:UIControlStateNormal];
    goVerifyButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [goVerifyButton addTarget:self action:@selector(goVerify) forControlEvents:UIControlEventTouchUpInside];

    
    // 体验试玩按钮
    goPlayButton = [UIButton buttonWithType: UIButtonTypeCustom];
    goPlayButton.frame = CGRectMake( (backImageVieww - buttonw)/2, backImageViewh*310/490, buttonw, buttonh);
    [goPlayButton setBackgroundImage:[UIImage imageNamed:@"goPlayImage"] forState:UIControlStateNormal];
    [goPlayButton setTitle:@"体验试玩" forState:UIControlStateNormal];
    goPlayButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [goPlayButton addTarget:self action:@selector(goPlay) forControlEvents:UIControlEventTouchUpInside];
  
    // 底部标签
    bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,  backImageViewh*380/490, backImageVieww - 20, backImageViewh*90/490)];
    bottomLabel.textColor = [UIColor colorWithRed:148/255.0 green:120/255.0 blue:147/255.0 alpha:1];
    bottomLabel.text = @"体验试玩1小时后必须通过实名认证 \n才能继续游戏";
    bottomLabel.font = [UIFont boldSystemFontOfSize:14];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.numberOfLines = 2;
    
    // 警告图片
    warningImageView = [[UIImageView alloc]initWithFrame: CGRectMake((backImageVieww - backImageViewh*80/490)/2, backImageViewh*130/490, backImageViewh*80/490, backImageViewh*80/490)];
    warningImageView.image = [UIImage imageNamed:@"warning"];
 
    
    // 警告提示
    warningLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, backImageViewh*205/490, backImageVieww,backImageViewh*135/490 )];
    warningLabel.textAlignment = NSTextAlignmentCenter;
    warningLabel.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
    
    // 警告按钮
    warningButton = [UIButton buttonWithType: UIButtonTypeCustom];
    warningButton.frame = CGRectMake( (backImageVieww - buttonw)/2, backImageViewh*355/490, buttonw, buttonh);
    [warningButton setBackgroundImage:[UIImage imageNamed:@"goVerifyImage"] forState:UIControlStateNormal];
    warningButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    

    // 身份证号textfield
    idNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake((backImageVieww - backImageVieww*405/465)/2, backImageViewh*230/490, backImageVieww*405/465, backImageViewh*60/490)];
    idNumberTextField.delegate = self;
    CGRect frame = idNumberTextField.frame;
    frame.size.width = backImageViewh*80/490;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    idNumberTextField.leftView = leftView;
    idNumberTextField.placeholder = @"请输入您的身份证号";
    idNumberTextField.font = [UIFont systemFontOfSize:14];
    idNumberTextField.leftViewMode = UITextFieldViewModeAlways;
    idNumberTextField.returnKeyType = UIReturnKeyDone;
    [idNumberTextField setBackground:[UIImage imageNamed:@"textFieldImage"]];
    
    
    // 下一步按钮
    goNextButton = [UIButton buttonWithType: UIButtonTypeCustom];
    goNextButton.frame = CGRectMake( (backImageVieww - buttonw)/2, backImageViewh*355/490, buttonw, buttonh);
    [goNextButton setBackgroundImage:[UIImage imageNamed:@"goNextGrayImage"] forState:UIControlStateNormal];
    [goNextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [goNextButton setBackgroundImage:[UIImage imageNamed:@"goVerifyImage"] forState:UIControlStateSelected];
    goNextButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    // 底部到时警告标签
    warningBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, backImageViewh*420/490, backImageVieww, backImageViewh*65/490)];
    warningBottomLabel.textAlignment = NSTextAlignmentCenter;
    warningBottomLabel.textColor = [UIColor colorWithRed:235/255.0 green:42/255.0 blue:42/255.0 alpha:1];
    warningBottomLabel.font = [UIFont systemFontOfSize:12];
    warningBottomLabel.text = @"体验试玩已达1小时，请实名认证之后继续游戏";
    
    
    if (self.viewType == Idverify) {
        
        [backImageView addSubview:mediumLabel];
        [backImageView addSubview:goVerifyButton];
        [backImageView addSubview:goPlayButton];
        [backImageView addSubview:bottomLabel];
        
    } else if (self.viewType == TimeLimit) {
        topLabel.text = @"未成年人限时规定";
       
        warningLabel.numberOfLines = 2;
        NSString *string = @"您的游戏时间已达到XX分钟 \n为了您的健康 请适当休息 改日再继续";
        warningLabel.font = [UIFont boldSystemFontOfSize:15];
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        paraStyle.lineSpacing = 8.0; // 设置行间距
        paraStyle.alignment = NSTextAlignmentCenter;
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
        [attrString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, string.length)];
        warningLabel.attributedText = attrString;
        warningLabel.adjustsFontSizeToFitWidth = YES;
         [backImageView addSubview:warningImageView];
        
        [backImageView addSubview:warningLabel];
        [warningButton setTitle:@"退出游戏" forState:UIControlStateNormal];
        [warningButton addTarget:self action:@selector(exitGame) forControlEvents:UIControlEventTouchUpInside];
        [backImageView addSubview:warningButton];
        
    } else if (self.viewType == PayLimit) {
        topLabel.text = @"未成年人消费保护";
        [backImageView addSubview:warningImageView];
        warningLabel.text = @"本游戏禁止未成年人充值付费";
        warningLabel.font = [UIFont boldSystemFontOfSize:18];
        
        [backImageView addSubview:warningLabel];
        [warningButton setTitle:@"我知道了" forState:UIControlStateNormal];
        [warningButton addTarget:self action:@selector(goPlay) forControlEvents:UIControlEventTouchUpInside];
        [backImageView addSubview:warningButton];
    } else if (self.viewType == TimeUp) {
        [backImageView addSubview:mediumLabel];
        [backImageView addSubview:idNumberTextField];
        [backImageView addSubview:goNextButton];
        [backImageView addSubview:warningBottomLabel];
    }
    
}

// 去认证界面
- (void)goVerify {
    // 删除视图
    if ([backImageView.subviews containsObject:goVerifyButton] && [backImageView.subviews containsObject:goPlayButton] && [backImageView.subviews containsObject:bottomLabel]) {
        [goVerifyButton removeFromSuperview];
        [goPlayButton removeFromSuperview];
        [bottomLabel removeFromSuperview];
    }
    // 添加视图
    idNumberTextField.text = @"";
    [backImageView addSubview:idNumberTextField];
    [backImageView addSubview:goNextButton];
 
    
    
}

// 体验试玩
- (void)goPlay {
    [self removeFromSuperview];
}

// 退出游戏
- (void)exitGame {
    exit(0); // 正常退出
}


// 输入限制, 输入18位之后不让输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == idNumberTextField) {
        
        if ([string isEqualToString:@"\n"]) {//按下return
            [textField resignFirstResponder];
            // 验证“下一步”是否亮起
            [self checkGoNext];
            return NO;
        }
        
        if ([string isEqualToString:@" "]) {//按下return
            return NO;
        }
        if (string.length == 0) {
            return YES;
        }
        NSString *myDotNumbers = @"0123456789Xx";
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:myDotNumbers] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if (!basicTest) {
            return NO;
        }
        //没有小数点
        if ((textField.text.length + string.length - range.length) > 8) {  //达到最大位数
            return NO;
        }
    }
    return YES;
}

// 隐藏键盘
- (void)dismissKeyboard:(id)sender {
    [self endEditing:YES];
    [backImageView endEditing:YES];
    
    
    [self checkGoNext];
    
}

// 检查"下一步按钮是否亮起来"
- (void)checkGoNext {
    if (idNumberTextField.text.length > 0) {
        [goNextButton setSelected:YES];
         [goNextButton addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [goNextButton setSelected:NO];
    }
    
}

// 点击下一步，认证结果界面
- (void)goNext {
    NSLog(@"go next");
    
    // 输入次数 + 1
    inputTimes += 1;
    // 删除Textfield
    if ([backImageView.subviews containsObject:idNumberTextField] && [backImageView.subviews containsObject:goNextButton]) {
        [idNumberTextField removeFromSuperview];
        [goNextButton removeFromSuperview];
    }
    
    if ([backImageView.subviews containsObject:warningBottomLabel]) {
        [warningBottomLabel removeFromSuperview];
    }

    // 增加一个UIImageView + 一个UILabel
    
    resultImageView = [[UIImageView alloc]initWithFrame: CGRectMake((backImageVieww - backImageViewh*80/490)/2, backImageViewh*205/490, backImageViewh*80/490, backImageViewh*80/490)];
    [backImageView addSubview:resultImageView];
    
    resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, backImageViewh*285/490, backImageVieww,backImageViewh*45/490 )];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    [backImageView addSubview:resultLabel];
    
    reInputButton = [UIButton buttonWithType: UIButtonTypeCustom];
    reInputButton.frame = CGRectMake( (backImageVieww - buttonw)/2, backImageViewh*355/490, buttonw, buttonh);
    [reInputButton setBackgroundImage:[UIImage imageNamed:@"goPlayImage"] forState:UIControlStateNormal];
    [reInputButton setBackgroundImage:[UIImage imageNamed:@"goVerifyImage"] forState:UIControlStateSelected];
    reInputButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [backImageView addSubview:reInputButton];
    
    if ([self checkIdNumberResult]) {
        resultImageView.frame = CGRectMake(backImageVieww*110/465, backImageViewh*215/490, backImageViewh*80/490, backImageViewh*80/490);
        resultLabel.frame = CGRectMake(CGRectGetMaxX(resultImageView.frame), backImageViewh*215/490, backImageVieww*185/490, backImageViewh*80/490);
        
        [resultImageView setImage:[UIImage imageNamed:@"verifySuccess"]];
        resultLabel.textColor = [UIColor colorWithRed:26/255.0 green:164/255.0 blue:249/255.0 alpha:1];
        resultLabel.text = @"认证成功";
        resultLabel.font = [UIFont boldSystemFontOfSize:24];
        
     
        [reInputButton setSelected:YES];
        [reInputButton setTitle:@"前往游戏" forState:UIControlStateNormal];
        [reInputButton addTarget:self action:@selector(goPlay) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [resultImageView setImage:[UIImage imageNamed:@"verifyFail"]];
        resultLabel.textColor = [UIColor colorWithRed:255/255.0 green:75/255.0 blue:100/255.0 alpha:1];
        resultLabel.text = @"您输入的身份证号有误";
        resultLabel.font = [UIFont systemFontOfSize:15];
        
        [reInputButton setSelected:NO];
        [reInputButton setTitle:@"重新输入" forState:UIControlStateNormal];
        [reInputButton addTarget:self action:@selector(reInput) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

// 实名认证规则
- (BOOL)checkIdNumberResult {
    // 1. 是否是18位
    if (idNumberTextField.text.length != 8) {
        return NO;
    }
    
    // 2. 年月日限制 -- 限制年龄为：大于3岁小于100岁
    NSArray<NSNumber *> *daysInfo = @[@31, @29, @31, @30, @31, @30, @31, @31, @30, @31, @30, @31];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear = [[formatter stringFromDate:date] integerValue];
    NSInteger inputYear =  [[idNumberTextField.text substringWithRange:NSMakeRange(0, 4)] integerValue];
    NSInteger inputMonth = [[idNumberTextField.text substringWithRange:NSMakeRange(4, 2)] integerValue];
    NSInteger inputDay = [[idNumberTextField.text substringWithRange:NSMakeRange(6, 2)] integerValue];

    if (inputYear <= currentYear - 100 || inputYear >= currentYear - 3) {
        return NO;
    }
    
    if (inputMonth <= 0 || inputMonth > 12 ) {
        return NO;
    }
     
    
    if (inputDay <= 0 || inputDay > 31) {
        return NO;
    }
    
    if (inputDay > [daysInfo[inputMonth - 1] integerValue]) {
        return NO;
    }

    
    // 3. 数字限制（最后一位可能为 X）-- 在输入时已经完成限制
    
    // 4. 强制第一次错误，要求再输入一次
    if (inputTimes < 2) {
        return NO;
    }
    
    return YES;
}

- (void)reInput {
    // 移除一些视图
    if ([backImageView.subviews containsObject:resultImageView] &&[backImageView.subviews containsObject:resultLabel] && [backImageView.subviews containsObject:reInputButton]) {
        [resultImageView removeFromSuperview];
        [resultLabel removeFromSuperview];
        [reInputButton removeFromSuperview];
    }

    [self goVerify];
    
}
@end
