//
//  GGKJPublicServiceViewController.m
//  供需
//
//  Created by zw on 16/4/5.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJPublicServiceViewController.h"
#import "GGKJPublicServiceCell.h"
#import "GGKJtestViewController.h"
#import "GGKJfirstViewController.h"
#import "GGKJTwoViewController.h"
#import "GGKJThreeViewController.h"

@interface GGKJPublicServiceViewController ()
@property (nonatomic,strong) UIViewController *first;
@property (nonatomic,strong) UIViewController *two;
@property (nonatomic,strong) UIViewController *three;

@end

@implementation GGKJPublicServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航条的titleView内容
    
    UISegmentedControl *segContontrol = [[UISegmentedControl alloc] initWithItems:@[@"正在进行",@"即将开始",@"已经结束"]];
    //segContontrol.momentary = YES;
    // 设置UISegmentedControl选中的图片
//    [segContontrol setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//    // 正常的图片
//    [segContontrol setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segContontrol setTintColor:[UIColor whiteColor]];
    // 设置选中的文字颜色
    [segContontrol setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    segContontrol.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segContontrol;
    [segContontrol addTarget:self action:@selector(dosegment:) forControlEvents:UIControlEventValueChanged];
    
    // 添加子控制器
    GGKJfirstViewController *first = [[GGKJfirstViewController alloc]init];
    self.first = first;
    [self addChildViewController:first];
    
    GGKJTwoViewController *two = [[GGKJTwoViewController alloc]init];
    self.two = two;
    [self addChildViewController:two];
    
    GGKJThreeViewController *three = [[GGKJThreeViewController alloc]init];
    self.three = three;
    [self addChildViewController:three];
    
    // 默认添加第一正在进行的cell
    [self dosegment:segContontrol];

}

- (void)dosegment:(UISegmentedControl *)seg{
    NSInteger Index = seg.selectedSegmentIndex;
    switch (Index) {
        case 0:
            self.first.view.frame=self.view.frame;
            [self.view addSubview:self.first.view];
            [self.first didMoveToParentViewController:self];
            break;
        case 1:
            self.two.view.frame=self.view.frame;
            [self.view addSubview:self.two.view];
            [self.two didMoveToParentViewController:self];
            break;
        default:
            self.three.view.frame=self.view.frame;
            [self.view addSubview:self.three.view];
            [self.three didMoveToParentViewController:self];
            break;
    }
}
@end
