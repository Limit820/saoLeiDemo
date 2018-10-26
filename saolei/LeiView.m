//
//  LeiView.m
//  saolei
//
//  Created by lxk on 2018/10/17.
//  Copyright © 2018 lxk. All rights reserved.
//

#import "LeiView.h"

@implementation LeiView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 0.5;
    
    UIView *backView = [[UIView alloc]initWithFrame:self.bounds];
    [self addSubview:backView];
    self.backView = backView;
    
    UILabel *a = [[UILabel alloc]initWithFrame:self.bounds];
    [self addSubview:a];
    self.leiNumLabel = a;
    a.textAlignment = NSTextAlignmentCenter;
    a.textColor = [UIColor grayColor];
    
    UIView *zhezhaoView = [[UIView alloc]initWithFrame:self.bounds];
    [self addSubview:zhezhaoView];
    zhezhaoView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0 alpha:1];
    self.zhezhaoView = zhezhaoView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickToNext)];
    [self addGestureRecognizer:tap];
    
    
    
}
-(void)clickToNext{
    if (self.hasLei) {
        NSLog(@"game over");
        if (self.failBlock) {
            self.failBlock();
        }
       
    }else{
        if (self.posuiBlcok) {
            self.posuiBlcok(self);
        }
        [self posui];
    }
}
-(void)jixuxunhuan{
    if (!self.isHasHuidiao) {
        
        self.isHasHuidiao = YES;
        if (self.posuiBlcok) {
            self.posuiBlcok(self);
        }
    }else{
        return;
    }
    
}
//没lei显示
-(void)posui{
    if (!self.isPosui) {
        [self.zhezhaoView removeFromSuperview];
        self.isPosui = YES;
    }else{
        return;
    }
    
}

@end
