//
//  ALSpaceZoneArticleTableViewCell.h
//  ALApp
//
//  Created by xujing on 16/8/8.
//  Copyright © 2016年 AiLi. All rights reserved.
//
@import UIKit;

@interface ALSpaceZoneArticleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *autherNameL;

@property (weak, nonatomic) IBOutlet UIImageView *thumbPathImg;
@property (strong, nonatomic) NSString *keyword;
@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (nonatomic, assign) NSInteger commentCountValue;

@end
