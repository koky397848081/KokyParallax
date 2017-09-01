//
//  ALSpaceZoneArticleTableViewCell.m
//  ALApp
//
//  Created by xujing on 16/8/8.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kCenterOffset 30.f
#define HEIGHT_THUMBPATHIMG 200

#import "ALSpaceZoneArticleTableViewCell.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface ALSpaceZoneArticleTableViewCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *autherLayoutX;

@end

@implementation ALSpaceZoneArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _autherNameL.text = @"阅读：3 · 评论：4";
    _titleL.text = @"华丽丽的标题文字";
    _thumbPathImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"img%ld",random()%6 +1 ]];
    
}

-(void)setCellOffSetY:(CGFloat)cellOffSetY
{
    _cellOffSetY = cellOffSetY;
    //cellOffSetY 是这个cell的中心点距离屏幕window的相对位置. 在这里我采用中心点偏移来进行处理视距差效果.
    //当试图中心点变化范围 0 ~ 屏幕高度  而图片的中心点变化范围相对于cell的中心点 向上下移动kCenterOffset 距离 所以得出公式 如下.
    CGFloat centerOffSetY = (2 * kCenterOffset / ScreenHeight) * cellOffSetY - kCenterOffset;
    //为了确保滚动返回不超出图片的大小,导致出现图片衔接出现空白,要确保滚动到最大和最小值.
    centerOffSetY = MAX(-kCenterOffset, centerOffSetY);
    centerOffSetY = MIN(kCenterOffset, centerOffSetY);
    
   _thumbPathImg.sd_layout.leftEqualToView(self.contentView).rightEqualToView(self.contentView).centerYIs(self.contentView.center.y + centerOffSetY).heightIs(self.contentView.bounds.size.height + 2 * kCenterOffset);
    [_thumbPathImg updateLayout];
    
}


@end
