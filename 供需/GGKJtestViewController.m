//
//  GGKJtestViewController.m
//  供需
//
//  Created by zw on 16/4/8.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJtestViewController.h"
#import "GGKJPublicdetaile.h"
#import "GGKJSureOrderViewController.h"
@interface GGKJtestViewController ()

@end

@implementation GGKJtestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"赠品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    //self.contentView = contentView;
    contentView.backgroundColor = ZWRGBColor(223, 223, 223);
    contentView.frame = self.view.bounds;
    //contentView.pagingEnabled = YES;
    contentView.scrollsToTop = YES;
    // contentView.delegate = self;
    [self.view insertSubview:contentView atIndex:0];
    
    GGKJPublicdetaile *detaile = [GGKJPublicdetaile detaile];
    detaile.width = self.view.width;
    
    for (UIView *pictureview in detaile.subviews) {
        
        if (pictureview.tag == 1) {
            NSArray *imageNames = @[@"c1",
                                    @"t1",
                                    @"t0"
                                     // 本地图片请填写全名
                                    ];
            
            SDCycleScrollView *sdcleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:pictureview.frame imageNamesGroup:imageNames];
            sdcleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
            sdcleScrollView.currentPageDotColor = [UIColor whiteColor];
            
            [pictureview addSubview:sdcleScrollView];
            
        }
    }
    
    for (UIWebView *webview in detaile.subviews) {
        
        if (webview.tag == 2) {
            
            [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
            ZWLog(@"111");
        }
    }
    
    for (UIButton *btn  in detaile.subviews) {
        
        if (btn.tag == 3) {
            
            [btn addTarget:self action:@selector(getclick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [contentView addSubview:detaile];
    
    contentView.contentSize = CGSizeMake(0, detaile.height);
//    NSArray *imageNames = @[@"t0",
//                            @"t1",
//                            @"t2",
//                            @"04",
//                            @"05" // 本地图片请填写全名
//                            ];
//    
//    SDCycleScrollView *sdcleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 74, ZWScreenW , ZWScreenW * 0.3) imageNamesGroup:imageNames];
//    sdcleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
//    sdcleScrollView.currentPageDotColor = [UIColor whiteColor];
//    
//    [detaile.pictureview addSubview:sdcleScrollView];
    
    [self.view addSubview:contentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getclick{
    [self.navigationController pushViewController:[[GGKJSureOrderViewController alloc]init] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
