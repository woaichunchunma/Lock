//
//  AniView.h
//  QSyihz
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 yihuazhuan. All rights reserved.
//


#define CenterImage   [UIImage imageNamed:@"an1"]
#define LeftImage     [UIImage imageNamed:@"an_left1"]
#define RightImage    [UIImage imageNamed:@"an_right1"]
#define SubLeftImage  [UIImage imageNamed:@"jtleft"]
#define SubRightImage [UIImage imageNamed:@"jtright"]

#define CenterImageH  [UIImage imageNamed:@"an1o"]
#define LeftImageH    [UIImage imageNamed:@"an_left2"]
#define RightImageH   [UIImage imageNamed:@"an_right2"]

#define CenterImageS  [UIImage imageNamed:@"go"]
#define LeftImageS    [UIImage imageNamed:@"an_left3"]
#define RightImageS   [UIImage imageNamed:@"an_right3"]


#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
@protocol AniViewDelegate <NSObject>

- (void)selecet:(BOOL)isLeft;
@end

@interface AniView : UIView
@property (nonatomic, assign) id <AniViewDelegate> delegate;



@end
