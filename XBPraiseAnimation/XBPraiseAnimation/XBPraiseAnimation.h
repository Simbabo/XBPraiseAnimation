//
//  XBPraiseAnimation.h
//  XBPraiseAnimation
//
//  Created by 许鑫博 on 2019/1/29.
//  Copyright © 2019年 XXB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XBPraiseAnimation : NSObject

/**
 * 动画对象大小 默认(25,25)
 */
@property (nonatomic ,assign) CGSize imageSize;

/**
 * 动画移动高度 默认(300)
 */
@property (nonatomic ,assign) CGFloat animationH;

/**
 * 动画左右幅度 以起点位置为参照点 默认50
 */
@property (nonatomic ,assign) CGFloat leftSpacing;
@property (nonatomic ,assign) CGFloat rightSpacing;

/**
 * 动画速度 默认 5
 */
@property (nonatomic ,assign) CGFloat speed;


/**
 * 初始化
 *
 * @param imageArray 动画的图片数组
 * @param view 展示层
 * @param point 动画起点位置
 * return XBPraiseAnimation
 */
-(instancetype)initWithImageArray:(NSArray<UIImage *>*)imageArray onView:(UIView *)view point:(CGPoint)point;

/**
 * 开始动画
 *
 * @param count 展示对象数量
 */
-(void)animate:(NSInteger)count;
@end

