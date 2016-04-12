//
//  GGKJViewController.m
//  供需
//
//  Created by zw on 16/3/20.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJViewController.h"
#import "ZWNavigationController.h"
#import "GGKJMainPageViewController.h"
#import "GGKJAboutMingZhengController.h"
#import "GGKJMyCenterViewController.h"

@interface GGKJViewController ()

@end

@implementation GGKJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 利用appearance属性 统一修改uitabbar中字体的颜色和大小；
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setUpChildVc:[[GGKJMainPageViewController alloc]init] title:@"首页" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setUpChildVc:[[UIViewController alloc]init] title:@"商机" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setUpChildVc:[[UIViewController alloc]init] title:@"聊天" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setUpChildVc:[[GGKJMyCenterViewController alloc]init] title:@"我的" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    [self setUpChildVc:[[GGKJAboutMingZhengController alloc]init] title:@"关于明珍" image:@"tabBar_new_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
}

// 建立一个初始化子控制器的方法
- (void)setUpChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)Image selectedImage:(NSString *)selectedImage{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:Image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    ZWNavigationController *naVc = [[ZWNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:naVc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
