//
//  GGKJTwoViewController.m
//  供需
//
//  Created by zw on 16/4/10.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJTwoViewController.h"
#import "GGKJPublicServiceCell.h"
#import "GGKJtestViewController.h"

@interface GGKJTwoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *topview;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
static NSString *const cellID = @"PublicService";
@implementation GGKJTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加搜索栏
    [self setUpTopView];
    
    // 初始化表格
    self.tableview.rowHeight = 110;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableview registerNib:[UINib nibWithNibName:NSStringFromClass([GGKJPublicServiceCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
}

- (void)setUpTopView{
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.width = ZWScreenW / 3;
        btn.height = self.topview.height;
        btn.y = 0;
        btn.x = i * (btn.width);
        
        if (i == 0) [btn setTitle:@"全部分类" forState:UIControlStateNormal];
        if (i == 1) [btn setTitle:@"全国" forState:UIControlStateNormal];
        if (i == 2) [btn setTitle:@"智能排序" forState:UIControlStateNormal];
        
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [self.topview addSubview:btn];
    }
}

#pragma mark - 实现tableview的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GGKJPublicServiceCell *cell = [self.tableview dequeueReusableCellWithIdentifier:cellID];
    
    if (indexPath.row % 3 == 0) {
        cell.headImageView.image = [UIImage imageNamed:@"c2"];
        cell.Headtitle.text = @"大众超市";
        cell.texttitle.text = @"从外表看，这是一间典型的中国连锁超市。满满当当的货架塞满了各种食品、日用品。不过，当你拿起一件包装完好的商品时，里面却是空的";
    }
    
    if (indexPath.row % 3 == 1) {
        cell.headImageView.image = [UIImage imageNamed:@"c3"];
        cell.Headtitle.text = @"旺中旺超市";
        cell.texttitle.text = @"徐震说，这个超市就是想给来访者带来一波三折的体验；满满当当的货架令人充实欣喜、众多商品选择使人犹豫不决、而最终“空”的真相则引人深思。我们试图以艺术商品的形式，打破艺术与商品间看似泾渭分明的界线，在影射商业力量强大的同时，也探究资本对文化交流产生的独特作用";

    }
    if (indexPath.row % 3 == 2) {
        cell.headImageView.image = [UIImage imageNamed:@"c4"];
        cell.Headtitle.text = @"万达超市";
        cell.texttitle.text = @"相比老年人，年轻人对徐震超市的接受度要开放得多。一位“70后”女性饶有兴致地看了所有的商品说：“我就在附近工作，一会吃午饭时，我会和同事们分享，这也会让我们反思购物的意义嘛，很有趣。”一位“80后”逛了超市后说，“这是一家卖空的超市，我想起一则广告语：酒干倘卖无！";
    }
    cell.Headtitle.textColor = [UIColor blackColor];
    cell.texttitle.textColor = [UIColor blackColor];
    [cell.stateBtn setTitle:@"即将开始" forState:UIControlStateNormal];
    [cell.stateBtn setBackgroundColor:ZWRGBColor(1, 146, 46)];
    return cell;
}

#pragma mark - 实现数据源的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[[GGKJtestViewController alloc]init] animated:YES];
    
}

@end
