# Lock
一个仿安卓解锁的demo

# How to use

     1.将“aniView”拖到自己的工程中
     2.在ViewController中添加如下代码即可
     //创建
     AniView *aniView = [[AniView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 120, ScreenWidth, 120)];
     //设置代理
     aniView.delegate = self;
     [self.view addSubview:aniView];
      3.代理
      - (void)selecet:(BOOL)isLeft {
     NSString *str = @"左划调用";
     if (!isLeft) {
         str = @"右划调用";
     }
      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:str message:nil delegate:nil cancelButtonTitle:nil  otherButtonTitles:@"确定", nil];
     [alertView show];
     }


# 演示图片
![image](https://github.com/woaichunchunma/Lock/blob/master/yanshi.gif)
