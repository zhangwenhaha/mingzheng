//
//  GGKJProuctListController.m
//  供需
//
//  Created by zw on 16/3/27.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJProuctListController.h"
#import "GGKJProductListTableViewCell.h"
#import "GGKJDataDetaileViewController.h"

@interface GGKJProuctListController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation GGKJProuctListController
static NSString * const cellID = @"product";

- (void)viewDidLoad {
    [super viewDidLoad];
//    UILabel *title = [[UILabel alloc]init];
//    title.text = @"商品列表";
//    title.size = CGSizeMake(100, 100);
//    title.textColor = [UIColor whiteColor];
//    self.navigationItem.titleView = title;
    self.navigationItem.title = @"商品列表";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"搜索" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.size = CGSizeMake(50, 50);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    // 注册cell
    [self.tableview registerNib:[UINib nibWithNibName:NSStringFromClass([GGKJProductListTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    self.tableview.rowHeight = 130;
    self.tableview.sectionFooterHeight = 0;
    self.tableview.sectionHeaderHeight = 0;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.showsVerticalScrollIndicator = NO;
    
    // 初始化顶部视图
    [self setUpTopView];
}

- (void)setUpTopView{
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.width = ZWScreenW / 3;
        btn.height = self.topView.height;
        btn.y = 0;
        btn.x = i * (btn.width);
        
        if (i == 0) [btn setTitle:@"土豆" forState:UIControlStateNormal];
        if (i == 1) [btn setTitle:@"品种" forState:UIControlStateNormal];
        if (i == 2) [btn setTitle:@"地区" forState:UIControlStateNormal];
        
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [self.topView addSubview:btn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 实现Tableview的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GGKJProductListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    return cell;
}

#pragma mark - 实现Tablevie的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[GGKJDataDetaileViewController alloc]init] animated:YES];
   
}
@end
