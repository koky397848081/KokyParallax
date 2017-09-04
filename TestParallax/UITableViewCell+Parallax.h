//
//  UITableViewCell+Parallax.h
//  TestParallax
//
//  Created by jingjing on 2017/9/1.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UITableViewCell (Parallax)

@property (nonatomic,strong)NSNumber *cellOffSetY;/**< cell相对于window的偏移量x */

- (void)parellaxWithImageView:(UIImageView *)imageView;

@end
