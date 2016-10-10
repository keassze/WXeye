//
//  HSZwxEyeView.h
//  WXeye
//
//  Created by 何松泽 on 16/2/17.
//  Copyright © 2016年 HSZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSZwxEyeView : UITableView<UITableViewDelegate>

@property (strong, nonatomic) CAShapeLayer *eyeFirstLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeSecondLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeballLayer;
@property (strong, nonatomic) CAShapeLayer *topEyesocketLayer;
@property (strong, nonatomic) CAShapeLayer *bottomEyesocketLayer;

@property (strong, nonatomic) UIViewController *viewController;

@end
