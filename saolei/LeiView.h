//
//  LeiView.h
//  saolei
//
//  Created by lxk on 2018/10/17.
//  Copyright © 2018 lxk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeiView : UIView
@property(nonatomic, assign) BOOL hasLei;
@property(nonatomic, strong) UILabel *leiNumLabel;
@property(nonatomic, copy) void (^posuiBlcok)(LeiView *);
@property(nonatomic, assign) BOOL isPosui;
@property(nonatomic, strong) UIView *backView;
@property(nonatomic, strong) UIView *zhezhaoView;
@property(nonatomic, assign) BOOL isHasHuidiao;
@property(nonatomic, copy) void (^failBlock)();
-(void)posui;//破碎的方法
-(void)jixuxunhuan;
@end

NS_ASSUME_NONNULL_END
