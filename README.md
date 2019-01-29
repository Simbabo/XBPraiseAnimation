# XBPraiseAnimation
## 简易、轻量级、基于基础动画的直播点赞动画实现  

1.初始化对象,设置点赞动画图片数组、起点位置与显示层  
<NSArray <UIImage *>* imageArray = @[[UIImage imageNamed:@"praise_sprite_0"],  
                                    [UIImage imageNamed:@"praise_sprite_1"],  
                                    [UIImage imageNamed:@"praise_sprite_2"],  
                                    [UIImage imageNamed:@"praise_sprite_3"],  
                                    [UIImage imageNamed:@"praise_sprite_4"]];  
XBPraiseAnimation *praiseAnimation = [[XBPraiseAnimation alloc] initWithImageArray:imageArray onView:self.view point:CGPointMake(btn_1.frame.origin.x, btn_1.frame.origin.y)];  >

2.调节动画速度  
praiseAnimation.speed = 5;  

3.调节动画左右摆动幅度  
praiseAnimation.leftSpacing = 50;  
praiseAnimation.rightSpacing = 50;  

4.调节动画高度  
praiseAnimation.animationH = 300;  

5.调节显示对象大小  
praiseAnimation.imageSize = CGRectMark(25,25);  

6.开始启动动画,可设置同事展示数量  
[praiseAnimation animate:2];
