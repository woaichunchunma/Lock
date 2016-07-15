//
//  ViewController.m
//  Lock
//
//  Created by apple on 16/7/6.
//  Copyright © 2016年 QS. All rights reserved.
//


#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

// RGB颜色

#define QSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//随机色
#define QSArcColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]

#import "ViewController.h"
#import "UIView+Extension.h"
#import "AniView.h"

@interface ViewController ()<AniViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QSArcColor;
    
    //创建
    AniView *aniView = [[AniView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 120, ScreenWidth, 120)];
    //设置代理
    aniView.delegate = self;
    [self.view addSubview:aniView];
}

#pragma mark - AniViewDelegate
/**
 *  代理
 *
 *  @param isLeft YES 左划    NO 右划
 */
- (void)selecet:(BOOL)isLeft {
    NSString *str = @"左划调用";
    if (!isLeft) {
        str = @"右划调用";
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:str message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

@end
