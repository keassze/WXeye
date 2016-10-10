//
//  FirstInTableViewCell.m
//  WXeye
//
//  Created by 何松泽 on 16/2/17.
//  Copyright © 2016年 HSZ. All rights reserved.
//

#import "FirstInTableViewCell.h"

@implementation FirstInTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _cityImageView = [self viewWithTag:1];
    _cityLabel = [self viewWithTag:2];
    _commentLabel = [self viewWithTag:3];
    _praiseLabel = [self viewWithTag:4];
}

-(void)setDataForItem:(NSString *)country countryImage:(UIImage *)image praiseNum:(NSString *)prasie commentNum:(NSString *)comment
{
    
    _cityLabel.text = country;
    [_cityImageView setImage:image];
    _commentLabel.text = comment;
    _praiseLabel.text = prasie;
}

-(void)setCityImage:(NSString *)fileName
{
    NSString *backgroudpath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
    UIImage  *backgroudImage = [UIImage imageWithContentsOfFile:backgroudpath];
    [_cityImageView setImage:backgroudImage];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
