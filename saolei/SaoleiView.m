//
//  SaoleiView.m
//  saolei
//
//  Created by lxk on 2018/10/17.
//  Copyright © 2018 lxk. All rights reserved.
//

#import "SaoleiView.h"
#import "LeiView.h"
//行列数
#define row 16
//雷的总数
#define lei 100

#define ktag 1001
@implementation SaoleiView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.leiNum = lei;
        [self createUI];
        
    }
    return self;
}
-(void)createUI{
    
    for (int i = 0; i<row * row; i++) {
        LeiView *a = [[LeiView alloc]initWithFrame:CGRectMake(self.frame.size.width/row * (i%row), self.frame.size.height/row * (i/row), self.frame.size.width/row, self.frame.size.height/row)];
        
        [self addSubview:a];
        a.tag = ktag + i;
        __weak SaoleiView *kself = self;
        a.posuiBlcok = ^(LeiView * clickLeiView) {
            NSInteger tempTag = clickLeiView.tag - ktag;
            
            if (tempTag % row != 0) {
                LeiView *temp = [kself viewWithTag:clickLeiView.tag - 1];
                if (!temp.hasLei) {
                    [temp posui];
                    [temp jixuxunhuan];
                }
            }
            if (tempTag / row != 0) {
                LeiView *temp = [kself viewWithTag:clickLeiView.tag - row];
                if (!temp.hasLei) {
                    [temp posui];
                    [temp jixuxunhuan];
                }
            }
            if (tempTag % row != row-1) {
                LeiView *temp = [kself viewWithTag:clickLeiView.tag + 1];
                if (!temp.hasLei) {
                    [temp posui];
                    [temp jixuxunhuan];
                }
            }
            if (tempTag / row != row - 1) {
                LeiView *temp = [kself viewWithTag:clickLeiView.tag + row];
                if (!temp.hasLei) {
                    [temp posui];
                    [temp jixuxunhuan];
                }
            }
            [self checkSuccess];
        };
        a.failBlock = ^{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"轰隆隆炸死了" message:nil delegate:self cancelButtonTitle:@"重新来" otherButtonTitles:nil, nil];
            [alert show];
            self.hasShowAlert = NO;
            for (UIView *a in self.subviews) {
                if ([a isKindOfClass:[LeiView class]]) {
                    [((LeiView*)a).zhezhaoView removeFromSuperview];
                }
            }
        };
        
    }
   
    while (self.leiNum > 0) {
        LeiView * a = [self viewWithTag:ktag+arc4random()%(row * row)];
        if (a.hasLei) {
            
        }else{
            a.hasLei = YES;
            a.leiNumLabel.text = @"💣";
            self.leiNum--;
        }
    }
   
    for (LeiView *a in self.subviews) {
        int leiNum = 0;
        NSInteger tempTag = a.tag - ktag;
        if (a.hasLei) {
            
        }else{
    
            for (int i = 0; i < 9; i++) {
                NSInteger aTag = a.tag - row - 1 + i / 3 * row + i % 3;
                if (tempTag % row == 0) {
                    if (aTag == a.tag - 1 || aTag == a.tag - row - 1 || aTag == a.tag + row - 1) {
                        aTag = -1;
                    }
                }
                if (tempTag / row == 0) {
                    if (aTag == a.tag - row || aTag == a.tag - row - 1 || aTag == a.tag - row + 1) {
                        aTag = -1;
                    }
                }
                if (tempTag % row == row-1) {
                    if (aTag == a.tag + 1 || aTag == a.tag - row + 1 || aTag == a.tag + row + 1) {
                        aTag = -1;
                    }
                }
                if (tempTag / row == row - 1) {
                    if (aTag == a.tag + row || aTag == a.tag + row - 1 || aTag == a.tag +row + 1) {
                        aTag = -1;
                    }
                }
                if (aTag != -1) {
                    LeiView *temp = [self viewWithTag:aTag];
                    if (temp.hasLei) {
                        leiNum++;
                    }
                }
            }
        }
        if (leiNum > 0) {
            a.leiNumLabel.text = [NSString stringWithFormat:@"%d",leiNum];
        }
    }
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    //重新开始
    for (UIView *a in self.subviews) {
        if ([a isKindOfClass:[LeiView class]]) {
            [a removeFromSuperview];
        }
    }
    self.leiNum = lei;
    [self createUI];
    self.hasShowAlert = NO;
}
//检测是不是完事了
-(void)checkSuccess{
    NSInteger i = 0;
    for (UIView *a in self.subviews) {
        if ([a isKindOfClass:[LeiView class]]) {
            if (!((LeiView*)a).isPosui) {
                i++;
            }
        }
    }
    if (i == lei) {
        if (self.hasShowAlert) {
            return;
        }
        //完成了
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"恭喜你成功了" message:nil delegate:self cancelButtonTitle:@"重新来" otherButtonTitles:nil, nil];
        [alert show];
        self.hasShowAlert = YES;
    }else{
        return;
    }
}

@end
