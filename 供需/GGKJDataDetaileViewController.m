//
//  GGKJDataDetaileViewController.m
//  供需
//
//  Created by zw on 16/3/28.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJDataDetaileViewController.h"
#import "GGKJTopView.h"
#import "GGKJbottomView.h"
#import "GGKJwiiOrderViewController.h"

@interface GGKJDataDetaileViewController ()
@property (weak, nonatomic) IBOutlet UIView *barbottomview;

@property (nonatomic,strong) GGKJbottomView *bottomview;

@property (nonatomic,strong) UIScrollView *contentView;

@property (weak, nonatomic) IBOutlet UIButton *willOrder;

@end

@implementation GGKJDataDetaileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"土豆";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 加载预定订单页
    [self.willOrder addTarget:self action:@selector(orderPage) forControlEvents:UIControlEventTouchUpInside];
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
     self.contentView = contentView;
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.frame = CGRectMake(0, 0, ZWScreenW, ZWScreenH);
    // contentView.pagingEnabled = YES;
    
     [self.view addSubview:contentView];
    
    
    // 添加topview
    GGKJTopView *topview = [GGKJTopView topview];
    NSArray *imageNames = @[@"01",
                            @"02",
                            @"03",
                            @"04",
                            @"05" // 本地图片请填写全名
                            ];
    
    SDCycleScrollView *sdcleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ZWScreenW, topview.pictureView.height) imageNamesGroup:imageNames];
    sdcleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    sdcleScrollView.currentPageDotColor = [UIColor whiteColor];
    
    [topview.pictureView addSubview:sdcleScrollView];

    
    topview.frame = CGRectMake(0, 64, ZWScreenW, 300);
    
    [contentView addSubview:topview];
    
    GGKJbottomView *bootomview = [GGKJbottomView bottomview];
    self.bottomview = bootomview;
    bootomview.frame = CGRectMake(0, 384, ZWScreenW, 500);
    [bootomview.pictureBtn addTarget:self action:@selector(pictureBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [bootomview.videoBtn addTarget:self action:@selector(videoBtnclick) forControlEvents:UIControlEventTouchUpInside];
    
    bootomview.pictureBtn.layer.cornerRadius = 8;
    bootomview.videoBtn.layer.cornerRadius = 8;
    
    [contentView addSubview:bootomview];
    
    [self pictureBtnclick];
    
    [self.view insertSubview:self.barbottomview aboveSubview:contentView];
    // contentView.delegate = self;
   }

/**
 * 实现预定订单的页面加载
 */
- (void)orderPage{
    [self.navigationController pushViewController:[[GGKJwiiOrderViewController alloc]init] animated:YES];
}

// 实现图片点击的方法
- (void)pictureBtnclick{
    if (self.bottomview.videoViewLeftMargin.constant != 0) {
        self.bottomview.videoViewLeftMargin.constant = 0;
        self.bottomview.PictureViewLeftMargin.constant = 0;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    self.contentView.contentSize = CGSizeMake(0, 1570);
    
    if (self.bottomview.pictureview.subviews.count != 0) return;
    
    CGFloat height = 200;
    CGFloat width = ZWScreenW;
    CGFloat x = 0;
    int pictures = 4;
   
    for (int i = 0; i < pictures; i++) {
        UIImageView *picture = [[UIImageView alloc]init];
        picture.image = [UIImage imageNamed:[NSString stringWithFormat:@"t%d",i]];
        picture.x = x;
        picture.y = i * (height + 10);
        picture.height = height;
        picture.width = width;
        [self.bottomview.pictureview addSubview:picture];
        if (i == (pictures - 1)) {
            self.bottomview.pictureview.height = CGRectGetMaxY(picture.frame) + 10 ;
        }
    }
}

// 实现视频点击的方法
- (void)videoBtnclick{
    if (self.bottomview.PictureViewLeftMargin.constant == 0) {
        self.bottomview.videoViewLeftMargin.constant = - self.view.width;
        self.bottomview.PictureViewLeftMargin.constant = - self.view.width;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    self.contentView.contentSize = CGSizeMake(0, 1150);
    
    if (self.bottomview.videoview.subviews.count != 0) return;
    ZWLog(@"%lu",self.bottomview.videoview.subviews.count);

    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, ZWScreenW, 400);
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"t3"]];
    image.frame = view.frame;
    
    [view addSubview:image];
    
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video-play"]];
    image2.centerX = view.centerX;
    image2.centerY = view.centerY;
    image2.size = CGSizeMake(71, 71);
    
    [view addSubview:image2];

    [self.bottomview.videoview addSubview:view];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
