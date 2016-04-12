//
//  GGKJfirstViewController.m
//  供需
//
//  Created by zw on 16/4/10.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJfirstViewController.h"
#import "GGKJPublicServiceCell.h"
#import "GGKJtestViewController.h"

@interface GGKJfirstViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *topview;

@end

static NSString *const cellID = @"PublicService";
@implementation GGKJfirstViewController

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
    
    if (indexPath.row == 0) {
        cell.timetitle.text = @"2016-04-11";
        cell.oldGet.text = @"已抢6份";
        cell.lastshengyu.text = @"共200份";
    }
    if (indexPath.row == 1) {
        cell.timetitle.text = @"2016-04-10";
        cell.oldGet.text = @"已抢88份";
        cell.lastshengyu.text = @"共500份";

    }
    if (indexPath.row == 2) {
        cell.timetitle.text = @"2016-04-09";
        cell.oldGet.text = @"已抢0份";
        cell.lastshengyu.text = @"共100份";
    }
    if (indexPath.row == 3) {
        cell.timetitle.text = @"2016-04-08";
        cell.oldGet.text = @"已抢66份";
        cell.lastshengyu.text = @"共999份";
    }
    if (indexPath.row == 4) {
        cell.timetitle.text = @"2016-04-02";
        cell.oldGet.text = @"已抢85份";
        cell.lastshengyu.text = @"共100份";
    }
    if (indexPath.row == 5) {
        cell.timetitle.text = @"2016-04-01";
        cell.oldGet.text = @"已抢17份";
        cell.lastshengyu.text = @"共17份";
    }
    if (indexPath.row == 6) {
        cell.timetitle.text = @"2016-03-23";
        cell.oldGet.text = @"已抢99份";
        cell.lastshengyu.text = @"共100份";
    }
    if (indexPath.row == 7) {
        cell.timetitle.text = @"2016-03-18";
        cell.oldGet.text = @"已抢37份";
        cell.lastshengyu.text = @"共100份";
    }
    if (indexPath.row == 8) {
        cell.timetitle.text = @"2016-03-16";
        cell.oldGet.text = @"已抢256份";
        cell.lastshengyu.text = @"共10000份";
    }
    if (indexPath.row % 3 == 0) {
        cell.headImageView.image = [UIImage imageNamed:@"c1"];
        cell.texttitle.text = @"庆云佳德龙超市惠佳分店8月11日盛大开业，开业期间凡一次性购物满100元送50元超市抵扣券，满100送50力度空前机会难得。";
    }
    
    if (indexPath.row % 3 == 1) {
        cell.headImageView.image = [UIImage imageNamed:@"t0"];
        cell.texttitle.text = @"超市特举行大型“满送让利”促销活动。一次性购物满58元加一元可获赠四件礼品；满98元加一元可获赠六件礼品；满168元加一元可获赠八件礼品。 ";
    }
    if (indexPath.row % 3 == 2) {
        cell.headImageView.image = [UIImage imageNamed:@"t2"];
        cell.texttitle.text = @"年货大街琳琅满目，应有尽有，蔬菜生鲜天天低价，日日新鲜。礼品多多，优惠多多，机不可失，时不再来，心动不如行动，欢迎前来抢购!";
    }    return cell;
}

#pragma mark - 实现数据源的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[[GGKJtestViewController alloc]init] animated:YES];
    
}

@end
