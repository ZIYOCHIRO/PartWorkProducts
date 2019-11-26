//
//  FirstNameVerifyView.h
//  AgeLimit
//
//  Created by ruixinyi on 2019/11/23.
//  Copyright © 2019 ruixinyi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    Idverify = 0,
    TimeLimit = 1,
    PayLimit = 2,
    TimeUp = 3
}DBTVerifyViewType;


NS_ASSUME_NONNULL_BEGIN

@interface FirstNameVerifyView : UIView<UITextFieldDelegate>
@property (nonatomic, assign)DBTVerifyViewType viewType;
- (void)config;
@end



NS_ASSUME_NONNULL_END
