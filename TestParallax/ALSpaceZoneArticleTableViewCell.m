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


@end

@implementation ALSpaceZoneArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _titleL.text = @"华丽丽的标题文字";
    _thumbPathImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"img%ld",random()%6 +1 ]];
    
}

@end
