//
//  ViewController.m
//  XBPraiseAnimation
//
//  Created by 许鑫博 on 2019/1/29.
//  Copyright © 2019年 XXB. All rights reserved.
//
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "XBPraiseAnimation.h"

@interface ViewController ()
@property (nonatomic ,strong) XBPraiseAnimation *praiseAnimation_1;
@property (nonatomic ,strong) XBPraiseAnimation *praiseAnimation_2;
@property (nonatomic ,strong) XBPraiseAnimation *praiseAnimation_3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton *btn_1 = [[UIButton alloc] initWithFrame:CGRectMake(30, ScreenHeight - 100, 25, 25)];
    [btn_1 setImage:[UIImage imageNamed:@"player_praise_s"] forState:UIControlStateNormal];
    btn_1.backgroundColor = [UIColor clearColor];
    [btn_1 addTarget:self action:@selector(btn_1_Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_1];
    
    UIButton *btn_2 = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2 - 25/2, ScreenHeight - 100, 25, 25)];
    [btn_2 setImage:[UIImage imageNamed:@"player_praise_s"] forState:UIControlStateNormal];
    btn_2.backgroundColor = [UIColor clearColor];
    [btn_2 addTarget:self action:@selector(btn_2_Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_2];
    
    UIButton *btn_3 = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 25 - 30, ScreenHeight - 100, 25, 25)];
    [btn_3 setImage:[UIImage imageNamed:@"player_praise_s"] forState:UIControlStateNormal];
    btn_3.backgroundColor = [UIColor clearColor];
    [btn_3 addTarget:self action:@selector(btn_3_Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_3];
    
    //设置点赞图片数组
    NSArray <UIImage *>* imageArray = @[[UIImage imageNamed:@"praise_sprite_0"],
                                        [UIImage imageNamed:@"praise_sprite_1"],
                                        [UIImage imageNamed:@"praise_sprite_2"],
                                        [UIImage imageNamed:@"praise_sprite_3"],
                                        [UIImage imageNamed:@"praise_sprite_4"]];
    
    //初始化点赞动画对象
    self.praiseAnimation_1 = [[XBPraiseAnimation alloc] initWithImageArray:imageArray onView:self.view point:CGPointMake(btn_1.frame.origin.x, btn_1.frame.origin.y)];
    self.praiseAnimation_2 = [[XBPraiseAnimation alloc] initWithImageArray:imageArray onView:self.view point:CGPointMake(btn_2.frame.origin.x, btn_2.frame.origin.y)];
    self.praiseAnimation_3 = [[XBPraiseAnimation alloc] initWithImageArray:imageArray onView:self.view point:CGPointMake(btn_3.frame.origin.x, btn_3.frame.origin.y)];
    
    //调节左右移动边距
    self.praiseAnimation_1.leftSpacing = 10;
    self.praiseAnimation_1.rightSpacing = 60;
    
    self.praiseAnimation_2.leftSpacing = 50;
    self.praiseAnimation_2.rightSpacing = 50;
    
    self.praiseAnimation_3.leftSpacing = 60;
    self.praiseAnimation_3.rightSpacing = 10;
}

-(void)btn_1_Click{
    [self.praiseAnimation_1 animate:2];
}

-(void)btn_2_Click{
    [self.praiseAnimation_2 animate:2];
}

-(void)btn_3_Click{
    [self.praiseAnimation_3 animate:2];
}


@end
