//
//  XBPraiseAnimation.m
//  XBPraiseAnimation
//
//  Created by 许鑫博 on 2019/1/29.
//  Copyright © 2019年 XXB. All rights reserved.
//

#import "XBPraiseAnimation.h"

@interface VZPraiseImage : UIImageView <CAAnimationDelegate>
@property (nonatomic ,assign) CGFloat speed;
@property (nonatomic ,assign) CGFloat animateH;
@property (nonatomic ,assign) CGFloat minX;
@property (nonatomic ,assign) CGFloat maxX;
@end
@implementation VZPraiseImage
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _speed = 5;
        _animateH = 300;
    }
    return self;
}

-(void)animate
{
    
    CGFloat min = _minX;
    CGFloat random = _maxX - _minX;
    CGFloat animateDuration = arc4random_uniform(3)+_speed;
    self.alpha = 0;
    CABasicAnimation *scaleAnimate =[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimate.duration = 0.2;
    scaleAnimate.fromValue = @0.2;
    scaleAnimate.toValue = @1;
    
    CAKeyframeAnimation *xAnimate = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    xAnimate.duration = animateDuration;
    xAnimate.values = @[@(self.layer.position.x),@(arc4random_uniform(random)+min),@(arc4random_uniform(random)+min),@(arc4random_uniform(random)+min)];
    
    CABasicAnimation *yAnimate =[CABasicAnimation animationWithKeyPath:@"position.y"];
    yAnimate.duration = animateDuration;
    yAnimate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    yAnimate.fromValue = @(self.frame.origin.y);
    yAnimate.toValue = @(self.frame.origin.y-(arc4random_uniform(50)+_animateH));
    
    CABasicAnimation *opacityAnimate = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimate.duration = animateDuration+1;
    opacityAnimate.fromValue = @1;
    opacityAnimate.toValue = @0;
    opacityAnimate.delegate = self;
    
    xAnimate.fillMode = kCAFillModeForwards;
    xAnimate.removedOnCompletion = NO;
    
    yAnimate.fillMode = kCAFillModeForwards;
    yAnimate.removedOnCompletion = NO;
    
    opacityAnimate.fillMode = kCAFillModeForwards;
    opacityAnimate.removedOnCompletion = NO;
    
    scaleAnimate.fillMode = kCAFillModeForwards;
    scaleAnimate.removedOnCompletion = NO;
    
    [self.layer addAnimation:xAnimate forKey:nil];
    [self.layer addAnimation:yAnimate forKey:nil];
    [self.layer addAnimation:opacityAnimate forKey:nil];
    [self.layer addAnimation:scaleAnimate forKey:nil];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.hidden = YES;
    [self removeFromSuperview];
    [self.layer removeAllAnimations];
}
@end


@interface XBPraiseAnimation()
@property (nonatomic ,strong) NSArray<UIImage *>* imageArray;
@property (nonatomic ,weak) UIView *view;
@property (nonatomic ,assign) CGPoint point;
@end
@implementation XBPraiseAnimation
-(instancetype)initWithImageArray:(NSArray<UIImage *>*)imageArray onView:(UIView *)view point:(CGPoint)point{
    self = [super init];
    if (self) {
        _imageArray = imageArray;
        _view = view;
        _point = point;
        _imageSize = CGSizeMake(25, 25);
        _speed = 5;
        _animationH = 300.0;
        _leftSpacing = 50.0;
        _rightSpacing = 50.0;
    }
    return self;
}

-(void)animate:(NSInteger)count{
    if (count == 0) count = 1;
    for (int i = 0; i < count; i++) {
        int random = (int)[_imageArray count];
        NSInteger index = arc4random_uniform(random);
        UIImage *image = _imageArray[index];
        VZPraiseImage *praise = [[VZPraiseImage alloc] initWithImage:image];
        praise.frame = CGRectMake(_point.x, _point.y, _imageSize.width, _imageSize.height);
        praise.animateH = _animationH;
        praise.speed = _speed;
        praise.minX = _point.x - _leftSpacing;
        praise.maxX = CGRectGetMaxX(praise.frame) + _rightSpacing;
        [_view addSubview:praise];
        [praise animate];
    }
}


@end
