//
//  GGKJCategotyViewController.m
//  供需
//
//  Created by zw on 16/3/23.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJCategotyViewController.h"
#import "GGKJCategoryTableViewCell.h"
#import "GGKJProuctListController.h"

@interface GGKJCategotyViewController ()<UITableViewDataSource,UITableViewDelegate>
/** 主tableView */
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
/** 副tableview */
@property (weak, nonatomic) IBOutlet UITableView *assistantTableview;

@end

static NSString * const McellID = @"main";
static NSString * const AcellID = @"assistant";
@implementation GGKJCategotyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"目录";
//    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    
    // 设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.mainTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.assistantTableview.contentInset = self.mainTableView.contentInset;
//    self.assistantTableview.rowHeight = 70;

    // 注册cell
    [self.assistantTableview registerNib:[UINib nibWithNibName:NSStringFromClass([GGKJCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:AcellID];
    
    self.assistantTableview.rowHeight = 100;
    self.assistantTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
   
}

#pragma mark - 实现Tableview的数据源方法
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) return 9;
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.mainTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:McellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:McellID];
        }
        if (indexPath.row == 0)
            cell.textLabel.text = [NSString stringWithFormat:@"蔬菜"];
        if (indexPath.row == 1)
            cell.textLabel.text = [NSString stringWithFormat:@"水果"];
        if (indexPath.row == 2)
            cell.textLabel.text = [NSString stringWithFormat:@"粮油"];
        if (indexPath.row == 3)
            cell.textLabel.text = [NSString stringWithFormat:@"食用菌"];
        if (indexPath.row == 4)
            cell.textLabel.text = [NSString stringWithFormat:@"蔬菜"];
        if (indexPath.row == 5)
            cell.textLabel.text = [NSString stringWithFormat:@"禽兽蛋肉"];
        if (indexPath.row == 6)
            cell.textLabel.text = [NSString stringWithFormat:@"苗木"];
        if (indexPath.row == 7)
            cell.textLabel.text = [NSString stringWithFormat:@"水产"];
        if (indexPath.row == 8)
            cell.textLabel.text = [NSString stringWithFormat:@"公益"];
        
        return cell;
    }else{
        GGKJCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AcellID];
        
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
    
}

#pragma mark - 实现TableViewdelegate的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[[GGKJProuctListController alloc]init] animated:YES];
}
@end
