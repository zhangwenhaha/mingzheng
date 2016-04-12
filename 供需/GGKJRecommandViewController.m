//
//  GGKJRecommandViewController.m
//  供需
//
//  Created by zw on 16/3/30.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJRecommandViewController.h"
#import "GGKJCategoryTableViewCell.h"

@interface GGKJRecommandViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

static NSString *const cellID = @"reproduct";
@implementation GGKJRecommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.recommTableview.rowHeight = 70;
    
    // 注册cell
    [self.recommTableview registerNib:[UINib nibWithNibName:NSStringFromClass([GGKJCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
}

#pragma mark - datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GGKJCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (indexPath.row % 3 == 0) {
        cell.imageView.image = [UIImage imageNamed:@"05"];
        cell.subTextLabel.text = @"土豆";
    }
    if (indexPath.row % 3 == 1  ) {
        cell.imageView.image = [UIImage imageNamed:@"04"];
        cell.subTextLabel.text = @"大白菜";
    }
    if (indexPath.row % 3 == 2) {
        cell.imageView.image = [UIImage imageNamed:@"03"];
        cell.subTextLabel.text = @"辣椒";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
