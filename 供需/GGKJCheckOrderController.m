//
//  GGKJCheckOrderController.m
//  供需
//
//  Created by zw on 16/4/4.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJCheckOrderController.h"
#import "GGKJOrderStateCell.h"
#import "GGKJOrderStateDetaileController.h"

@interface GGKJCheckOrderController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *OrderTableview;

@property (nonatomic,strong) GGKJOrderStateCell *OScell;
@end

@implementation GGKJCheckOrderController

static NSString *const cellID = @"CheckOrder";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.OrderTableview.rowHeight = 60;
    self.OrderTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.OrderTableview.scrollEnabled = NO;
    
    
    [self.OrderTableview registerNib:[UINib nibWithNibName:NSStringFromClass([GGKJOrderStateCell self]) bundle:nil] forCellReuseIdentifier:cellID];
}


#pragma mark - 实现tableview的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GGKJOrderStateCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (indexPath.row == 0) {
        cell.topview.hidden = YES;
        cell.titleLabel.text = @"已提交订单";
        [cell.yuanBtn setImage:[UIImage imageNamed:@"green-1"] forState:UIControlStateNormal];
    }
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"买家处理订单中";
        cell.timeLabel.text = @"**-**-**";

    }
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"已接受订单";
        cell.timeLabel.text = @"**-**-**";

    }
    if (indexPath.row == 3) {
        
        cell.titleLabel.text = @"暂无动态";
        cell.clickCheck.hidden = NO;
        cell.clickCheck.layer.cornerRadius = 10;
        [cell.clickCheck addTarget:self action:@selector(OrderClick) forControlEvents:UIControlEventTouchUpInside];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 4) {
        cell.timeLabel.text = @"**-**-**";

        cell.titleLabel.text = @"交货";
    }
    if (indexPath.row == 5) {
        cell.timeLabel.text = @"**-**-**";

        cell.bottomview.hidden = YES;
        cell.titleLabel.text = @"完成订单";
    }
    
    
    return  cell;
}

- (void)OrderClick{
    [self.navigationController pushViewController:[[GGKJOrderStateDetaileController alloc]init] animated:YES];
}
#pragma mark - 实现tableview的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 3) {
        
        [self OrderClick];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
