//
//  UITableViewCell+Parallax.m
//  TestParallax
//
//  Created by jingjing on 2017/9/1.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kCenterOffset 30.f
#define HEIGHT_THUMBPATHIMG 200

#import <SDAutoLayout/SDAutoLayout.h>
#import "UITableViewCell+Parallax.h"
#import <objc/runtime.h>

static NSString *cellOffSetYKey = @"cellOffSetYKey";
@interface UITableViewCell()

@end

@implementation UITableViewCell (Parallax)

- (void)setCellOffSetY:(NSNumber *)cellOffSetY{
    objc_setAssociatedObject(self, &cellOffSetYKey, cellOffSetY, OBJC_ASSOCIATION_COPY);
}

- (NSNumber *)cellOffSetY{
    return objc_getAssociatedObject(self, &cellOffSetYKey);
}

- (void)parellaxWithImageView:(UIImageView *)imageView
{

    if (!self.cellOffSetY) {
        self.cellOffSetY = @( [self convertPoint:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5) toView:self.superview].y);
    }
    //cellOffSetY 是这个cell的中心点距离屏幕window的相对位置. 在这里我采用中心点偏移来进行处理视距差效果.
    //当试图中心点变化范围 0 ~ 屏幕高度  而图片的中心点变化范围相对于cell的中心点 向上下移动kCenterOffset 距离 所以得出公式 如下.
    CGFloat centerOffSetY = (2 * kCenterOffset / ScreenHeight) * self.cellOffSetY.integerValue - kCenterOffset;
    NSLog(@"centerOffSetY----%lf",centerOffSetY);
    //为了确保滚动返回不超出图片的大小,导致出现图片衔接出现空白,要确保滚动到最大和最小值.
    centerOffSetY = MAX(-kCenterOffset, centerOffSetY);
    centerOffSetY = MIN(kCenterOffset, centerOffSetY);
    
    /*
    // 滚动时缩小图片效果
     
    imageView.sd_layout.leftEqualToView(self.contentView).offset(-centerOffSetY).rightEqualToView(self.contentView).offset(centerOffSetY).centerYIs(self.contentView.center.y + centerOffSetY).heightIs(self.contentView.bounds.size.height + 2 * kCenterOffset);
     */
     imageView.sd_layout.leftEqualToView(self.contentView).rightEqualToView(self.contentView).centerYIs(self.contentView.center.y + centerOffSetY).heightIs(self.contentView.bounds.size.height + 2 * kCenterOffset);
    [imageView updateLayout];
    
}

@end
