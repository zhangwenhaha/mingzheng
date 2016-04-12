//
//  GGKJwiiOrderViewController.m
//  供需
//
//  Created by zw on 16/4/1.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJwiiOrderViewController.h"
#import "GGKJOrderTopview.h"
#import "GGKJOrderBottomview.h"
#import "GGKJCheckOrderController.h"

@interface GGKJwiiOrderViewController ()


@end

@implementation GGKJwiiOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"预定订单";
    
    UIScrollView *scrollview = [[UIScrollView alloc]init];
    scrollview.frame = CGRectMake(0, 0, ZWScreenW, ZWScreenH);
    
    GGKJOrderTopview *topview = [GGKJOrderTopview ordertopview];
    topview.frame = CGRectMake(0, 0, ZWScreenW, 220);
    
    [scrollview addSubview:topview];
    
    
    
    GGKJOrderBottomview *bottomview = [GGKJOrderBottomview orderbottomview];
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    image.frame = CGRectMake(0, 0, bottomview.width, bottomview.height);
    for (UIButton *btn in bottomview.subviews) {
        if (btn.tag == 11) {
            [btn addTarget:self action:@selector(CheckOrderclick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [bottomview insertSubview:image atIndex:0];
    bottomview.frame = CGRectMake(0, CGRectGetMaxY(topview.frame) + 10, ZWScreenW, 320);
    
    [scrollview addSubview:bottomview];
    
    scrollview.contentSize = CGSizeMake(0, CGRectGetMaxY(bottomview.frame) + 44);
    
    [self.view addSubview:scrollview];
}

- (void)CheckOrderclick{
    
    [self.navigationController pushViewController:[[GGKJCheckOrderController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
