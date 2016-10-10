//
//  HSZwxEyeView.m
//  WXeye
//
//  Created by 何松泽 on 16/2/17.
//  Copyright © 2016年 HSZ. All rights reserved.
//

#import "HSZwxEyeView.h"
#import "UIColor+Colors.h"

@implementation HSZwxEyeView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.delegate = (id)self;
        
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self setupAnimation];
        [self setBackgroundColor:[UIColor blackColor]];
        
        [self.layer addSublayer:_eyeFirstLightLayer];
        [self.layer addSublayer:_eyeSecondLightLayer];
        [self.layer addSublayer:_eyeballLayer];
        [self.layer addSublayer:_topEyesocketLayer];
        [self.layer addSublayer:_bottomEyesocketLayer];
    }
    return self;
}

- (void)setupAnimation {
    self.eyeFirstLightLayer.lineWidth = 0.f;
    self.eyeSecondLightLayer.lineWidth = 0.f;
    self.eyeballLayer.opacity = 0.f;
    self.bottomEyesocketLayer.strokeStart = 0.5f;
    self.bottomEyesocketLayer.strokeEnd = 0.5f;
    self.topEyesocketLayer.strokeStart = 0.5f;
    self.topEyesocketLayer.strokeEnd = 0.5f;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat flag = scrollView.frame.origin.y * 2.f;
    if (scrollView.contentOffset.y < -flag) {
        if (_eyeFirstLightLayer.lineWidth < 5.f) {
            _eyeFirstLightLayer.lineWidth += 1.f;
            _eyeSecondLightLayer.lineWidth += 1.f;
        }
    }
    if (scrollView.contentOffset.y < -flag-20){
        if (_eyeballLayer.opacity < 1.f) {
            _eyeballLayer.opacity += 0.1f;
        }
    }
    if (scrollView.contentOffset.y < -flag-40){
        
        if (_topEyesocketLayer.strokeEnd < 1.f &&_topEyesocketLayer.strokeStart > 0.f) {
            _topEyesocketLayer.strokeEnd += 0.1f;
            _topEyesocketLayer.strokeStart -= 0.1f;
            _bottomEyesocketLayer.strokeStart -= 0.1f;
            _bottomEyesocketLayer.strokeEnd += 0.1f;
        }
    }
    if (scrollView.contentOffset.y > -flag-40){
        if (_topEyesocketLayer.strokeEnd > 0.5f &&_topEyesocketLayer.strokeStart < 0.5f) {
            _topEyesocketLayer.strokeEnd -= 0.1f;
            _topEyesocketLayer.strokeStart += 0.1f;
            _bottomEyesocketLayer.strokeStart += 0.1f;
            _bottomEyesocketLayer.strokeEnd -= 0.1f;
        }
    }
    if (scrollView.contentOffset.y > -flag-20) {
        if (_eyeballLayer.opacity >= 0.f) {
            _eyeballLayer.opacity -= 0.1f;
        }
    }
    if (scrollView.contentOffset.y > -flag) {
        if (_eyeFirstLightLayer.lineWidth > 0.f) {
            _eyeFirstLightLayer.lineWidth -= 1.f;
            _eyeSecondLightLayer.lineWidth -= 1.f;
        }
    }
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    _viewController = [[UIViewController alloc]init];
    if (scrollView.contentOffset.y < -120) {
        [UIView animateWithDuration:1.5f animations:^{
//            [self setCenter:CGPointMake(self.center.x, [UIScreen mainScreen].bounds.size.height+[UIScreen mainScreen].bounds.size.height/2)];
            [scrollView setContentOffset:CGPointMake(0,[UIScreen mainScreen].bounds.size.height)];
        } completion:^(BOOL finished) {
//            [self setCenter:CGPointMake(self.center.x, [UIScreen mainScreen].bounds.size.height+[UIScreen mainScreen].bounds.size.height/2)];
        }];
    }
}

#pragma mark eyeSharp
- (CAShapeLayer *)eyeFirstLightLayer {
    if (!_eyeFirstLightLayer) {
        _eyeFirstLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, 0);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:CGRectGetWidth(self.frame) * 0.025
                                                        startAngle:(230.f / 180.f) * M_PI
                                                          endAngle:(265.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeFirstLightLayer.borderColor = [UIColor clearColor].CGColor;
        _eyeFirstLightLayer.lineWidth = 1.f;
        _eyeFirstLightLayer.path = path.CGPath;
        _eyeFirstLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeFirstLightLayer.strokeColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:128/255.0 alpha:1.0].CGColor;
    }
    return _eyeFirstLightLayer;
}

- (CAShapeLayer *)eyeSecondLightLayer {
    if (!_eyeSecondLightLayer) {
        _eyeSecondLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, 0);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:CGRectGetWidth(self.frame) * 0.025
                                                        startAngle:(211.f / 180.f) * M_PI
                                                          endAngle:(220.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeSecondLightLayer.borderColor = [UIColor clearColor].CGColor;
        _eyeSecondLightLayer.lineWidth = 5.f;
        _eyeSecondLightLayer.path = path.CGPath;
        _eyeSecondLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeSecondLightLayer.strokeColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:128/255.0 alpha:1.0].CGColor;
    }
    return _eyeSecondLightLayer;
}

- (CAShapeLayer *)eyeballLayer {
    if (!_eyeballLayer) {
        _eyeballLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, 0);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:CGRectGetWidth(self.frame) * 0.05
                                                        startAngle:(0.f / 180.f) * M_PI
                                                          endAngle:(360.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeballLayer.borderColor = [UIColor clearColor].CGColor;
        _eyeballLayer.lineWidth = 1.f;
        _eyeballLayer.path = path.CGPath;
        _eyeballLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeballLayer.strokeColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:128/255.0 alpha:1.0].CGColor;
        _eyeballLayer.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return _eyeballLayer;
}

- (CAShapeLayer *)topEyesocketLayer {
    if (!_topEyesocketLayer) {
        _topEyesocketLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, 0);
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake((CGRectGetWidth(self.frame)/2-50), 0)];
        [path addQuadCurveToPoint:CGPointMake((CGRectGetWidth(self.frame)/2+50), 0)
                     controlPoint:CGPointMake(CGRectGetWidth(self.frame) / 2, center.y - center.y - 50)];
        _topEyesocketLayer.borderColor = [UIColor clearColor].CGColor;
        _topEyesocketLayer.lineWidth = 1.f;
        _topEyesocketLayer.path = path.CGPath;
        _topEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _topEyesocketLayer.strokeColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:128/255.0 alpha:1.0].CGColor;
    }
    return _topEyesocketLayer;
}

- (CAShapeLayer *)bottomEyesocketLayer {
    if (!_bottomEyesocketLayer) {
        _bottomEyesocketLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, 0);
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake((CGRectGetWidth(self.frame)/2-50), 0)];
        [path addQuadCurveToPoint:CGPointMake((CGRectGetWidth(self.frame)/2+50), 0)
                     controlPoint:CGPointMake(CGRectGetWidth(self.frame) / 2, center.y + center.y + 50)];
        _bottomEyesocketLayer.borderColor = [UIColor clearColor].CGColor;
        _bottomEyesocketLayer.lineWidth = 1.f;
        _bottomEyesocketLayer.path = path.CGPath;
        _bottomEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomEyesocketLayer.strokeColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:128/255.0 alpha:1.0].CGColor;
    }
    return _bottomEyesocketLayer;
}

@end
