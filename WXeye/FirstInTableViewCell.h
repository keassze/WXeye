//
//  FirstInTableViewCell.h
//  WXeye
//
//  Created by 何松泽 on 16/2/17.
//  Copyright © 2016年 HSZ. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *cellNibName_FirstInTableViewCell = @"FirstInTableViewCell";

@interface FirstInTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *praiseLabel;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UILabel *cityLabel;
@property(nonatomic,strong)UIImageView *cityImageView;
@property(nonatomic,weak)UIViewController * superController;

-(void)setDataForItem:(NSString *)country
         countryImage:(UIImage *)image
            praiseNum:(NSString *)prasie
           commentNum:(NSString *)comment;
-(void)setCityImage:(NSString *)fileName;

@end
