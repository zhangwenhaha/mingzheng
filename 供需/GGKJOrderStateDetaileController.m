//
//  GGKJOrderStateDetaileController.m
//  供需
//
//  Created by zw on 16/4/6.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJOrderStateDetaileController.h"
#import "GGKJCheckStateTableViewCell.h"
#import "GGKJSaleProductState.h"

@interface GGKJOrderStateDetaileController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *OrderState;

@end

static NSString *cellID = @"productState";
@implementation GGKJOrderStateDetaileController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"订单动态";
    
    
    //stateView.size = CGSizeMake(ZWScreenW, 200);
    
    // tableview的初始化
    self.OrderState.rowHeight = 100;
    
    // 注册cell
    [self.OrderState registerNib:[UINib nibWithNibName:NSStringFromClass([GGKJCheckStateTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
}

#pragma mark - 实现tableview的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GGKJCheckStateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.headImageView.layer.cornerRadius = 25;
    
    if (indexPath.row == 0) {
        cell.topview.hidden = NO;
        GGKJSaleProductState *stateView = [GGKJSaleProductState saleproductStateView];
        //stateView.headimage.layer.cornerRadius = 5;
        stateView.size = CGSizeMake(0, 100);
        stateView.backgroundColor = ZWRGBColor(58, 162, 245);
        self.OrderState.tableHeaderView = stateView;
    }
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]init];
    label.text = @"最新动态";
    return label;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
