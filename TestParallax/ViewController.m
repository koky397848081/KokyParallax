//
//  ViewController.m
//  TestParallax
//
//  Created by jingjing on 2017/9/1.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#import "ViewController.h"
#import "ALSpaceZoneArticleTableViewCell.h"
#import "UITableViewCell+Parallax.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    __weak IBOutlet UITableView *_mainTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"ALSpaceZoneArticleTableViewCell";
    ALSpaceZoneArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        
        [tableView registerNib:[UINib nibWithNibName:@"ALSpaceZoneArticleTableViewCell" bundle:nil] forCellReuseIdentifier:@"ALSpaceZoneArticleTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ALSpaceZoneArticleTableViewCell"];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0;
}

#pragma mark
#pragma mark UIScrollerViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    for (ALSpaceZoneArticleTableViewCell *cell in [_mainTableView visibleCells]) {
        CGFloat offY = [cell convertPoint:CGPointMake(cell.bounds.size.width * 0.5, cell.bounds.size.height * 0.5) toView:self.view].y;
        cell.cellOffSetY = @(offY);
        [cell parellaxWithImageView:cell.thumbPathImg];
    }
}

@end
