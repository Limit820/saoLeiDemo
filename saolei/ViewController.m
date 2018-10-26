//
//  ViewController.m
//  saolei
//
//  Created by lxk on 2018/10/17.
//  Copyright © 2018 lxk. All rights reserved.
//

#import "ViewController.h"
#import "SaoleiView.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SaoleiView *a = [[SaoleiView alloc]initWithFrame:CGRectMake(0, 100, ScreenW, ScreenW)];
    [self.view addSubview:a];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
