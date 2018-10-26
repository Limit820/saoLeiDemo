//
//  SaoleiView.h
//  saolei
//
//  Created by lxk on 2018/10/17.
//  Copyright © 2018 lxk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaoleiView : UIView<UIAlertViewDelegate>
@property (nonatomic, assign) int leiNum;
@property (nonatomic, assign) BOOL hasShowAlert;
@end

NS_ASSUME_NONNULL_END
