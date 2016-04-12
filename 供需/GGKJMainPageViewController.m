//
//  GGKJMainPageViewController.m
//  供需
//
//  Created by zw on 16/3/21.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJMainPageViewController.h"
#import "ZWSquareButton.h"
#import "GGKJMainCategoryView.h"
#import "GGKJCategotyViewController.h"
#import "GGKJNeabyViewController.h"
#import "GGKJcellview.h"
#import "GGKJRecommandViewController.h"
#import "GGKJPublicServiceViewController.h"
#import "GGKJMyCenterViewController.h"

@interface GGKJMainPageViewController ()<UIScrollViewDelegate>

/** 底部的所有内容 */
@property (nonatomic,weak) UIScrollView *contentView;

@property (nonatomic,strong) GGKJMainCategoryView *categoryView;

/** 指示器的view */
@property (nonatomic,strong) UIView *indicatorView;

@property (nonatomic,strong) UIButton *titleBtn;

@property (nonatomic,strong) UIScrollView *subScrollview;

@property (nonatomic,strong) UIView *titleview;
@end

@implementation GGKJMainPageViewController
/**
 * 让状态颜色变为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    ZWLog(@"111");
    return UIStatusBarStyleLightContent;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 出事化子控制器
    [self setupChildVC];
    
    // 初始化导航栏
    [self setUpNav];
    
    self.view.backgroundColor = ZWRGBColor(206,206,206);
    
    [self setUpcontentview];
    
}

/**
 * 初始化导航栏
 */
- (void)setUpNav{
    
    // 初始化导航栏中间视图
//    GGKJSearchBar *searchBar = [[GGKJSearchBar alloc]init];
//    self.navigationItem.titleView = searchBar;
    self.navigationController.navigationBar.barTintColor = ZWGlobalNavBg;
    
    
//    UISearchBar *search = [[UISearchBar alloc]init];
//    search.placeholder = @"请输入要搜索的内容";
//    self.navigationItem.titleView = search;
//    search.tintColor = [UIColor greenColor];
    self.navigationItem.title = @"明珍";

    
    // 设置导航栏左边的按钮
    UIBarButtonItem *catergoryItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highimage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    UIBarButtonItem *scanItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highimage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    self.navigationItem.rightBarButtonItem = scanItem;
    
    self.navigationItem.leftBarButtonItem = catergoryItem;
}


- (void)setupChildVC{
    GGKJRecommandViewController *buyer = [[GGKJRecommandViewController alloc]init];
    buyer.title = @"需求动态";
    
    [self addChildViewController:buyer];
    
    GGKJRecommandViewController *saler = [[GGKJRecommandViewController alloc]init];
    saler.title = @"供应动态";
    
    [self addChildViewController:saler];
    
}

- (void)setUpcontentview{
    
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    self.contentView = contentView;
     contentView.backgroundColor = [UIColor whiteColor];
    contentView.frame = self.view.bounds;
     //contentView.pagingEnabled = YES;
    // contentView.delegate = self;
    [self.view insertSubview:contentView atIndex:0];
    
    NSArray *imageNames = @[@"g4",
                            @"g1",
                            @"g3",
                            @"g2",
                            @"g0"// 本地图片请填写全名
                            ];
    
    SDCycleScrollView *sdcleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 74, ZWScreenW , ZWScreenW * 0.3) imageNamesGroup:imageNames];
    sdcleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    sdcleScrollView.currentPageDotColor = [UIColor whiteColor];
    sdcleScrollView.autoScrollTimeInterval = 2.0f;
    sdcleScrollView.currentPageDotColor = [UIColor clearColor];
    sdcleScrollView.pageDotColor = [UIColor clearColor];
    
    [contentView addSubview:sdcleScrollView];
    
    // 添加按钮
    [self createSquares:8];
    
    // 添加第一个控制器view
    //[self scrollViewDidEndScrollingAnimation:contentView];
    
    // 添加TableView视图;
    GGKJMainCategoryView *categoryView = [GGKJMainCategoryView categoryView];
    
    
    self.categoryView = categoryView;
    categoryView.x = 10;
    CGFloat btnY = (ZWScreenW / 4 - 30) * 2 + 30;
    categoryView.y =  64 + ZWScreenW * 0.3 + btnY;
    categoryView.width = ZWScreenW - 10 * 2;
    categoryView.height = 80;
    
    for (UIButton *btn in categoryView.subviews) {
        if (btn.tag == 6) {
            [btn addTarget:self action:@selector(pushCategory) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (btn.tag == 2) {
            [btn addTarget:self action:@selector(gongyi) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (btn.tag == 1 || btn.tag == 3 || btn.tag == 4 || btn.tag == 5) {
            [btn addTarget:self action:@selector(pushCategory) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    [contentView addSubview:categoryView];
    
    // 推荐模块视图
    UIView *recommand = [[UIView alloc]init];
    
    //recommand.backgroundColor = [UIColor redColor];
    recommand.x = 0;
    recommand.y = CGRectGetMaxY(self.categoryView.frame) + 10;
    recommand.width = ZWScreenW;
    recommand.height = 50;
    recommand.backgroundColor = [UIColor orangeColor];
    
    // 创建标题视图
    UIView *titleview = [[UIView alloc]init];
    titleview.frame = CGRectMake(0, 0, recommand.width, 50);
    
    UIImageView *titleBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    titleBg.frame = titleview.frame;
    [titleview addSubview:titleBg];
    
    [recommand addSubview:titleview];
    self.titleview = titleview;
    // 创建指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor greenColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.x = 0;
    indicatorView.y = titleview.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    CGFloat w = titleview.width / self.childViewControllers.count;
    CGFloat h = titleview.height;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UIButton *titleBtn = [[UIButton alloc]init];
        titleBtn.tag = i;
        titleBtn.height = h;
        titleBtn.width = w;
        titleBtn.x = w * i;
        titleBtn.backgroundColor = ZWRGBColor(61, 115, 55);
        UIViewController *vc = self.childViewControllers[i];
        [titleBtn setTitle:vc.title forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        titleBtn.titleLabel.font  = [UIFont systemFontOfSize:18];
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleview addSubview:titleBtn];
        
        // 默认点击了第一个按钮
        if (i == 0) {
            titleBtn.enabled = NO;
            self.titleBtn = titleBtn;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [titleBtn.titleLabel sizeToFit];
            indicatorView.centerX = titleBtn.centerX  - 35;
            indicatorView.width = titleBtn.titleLabel.width;
            /* 第二种方法 */
//                        self.indicatorView.centerX = titleBtn.centerX - 14;
//                        self.indicatorView.width = [titles[i] sizeWithAttributes:@{NSFontAttributeName : titleBtn.titleLabel.font}].width;
        }
    }

    [titleview addSubview:indicatorView];
    
    
    // 创建滚动视图
//    UIScrollView *subScroll = [[UIScrollView alloc]init];
//    //subScroll.backgroundColor = [UIColor redColor];
//    subScroll.frame = CGRectMake(0, CGRectGetMaxY(titleview.frame), recommand.width, recommand.height);
//    subScroll.pagingEnabled = YES;
//    subScroll.delegate = self;
//    
//    [recommand insertSubview:subScroll atIndex:0];
//    subScroll.contentSize = CGSizeMake(MAXFLOAT , MAXFLOAT );
    //self.subScrollview = subScroll;
    [contentView addSubview:recommand];
    
    // 创建底部视图
    GGKJcellview *cellview = [GGKJcellview cellview];
    cellview.frame = CGRectMake(0, CGRectGetMaxY(recommand.frame), ZWScreenW, 200);
    cellview.backgroundColor = ZWRGBColor(223, 223, 223);
    
    [contentView addSubview:cellview];
    
    
    contentView.contentSize = CGSizeMake(0, CGRectGetMaxY(cellview.frame) + 44);
    
     //[self scrollViewDidEndScrollingAnimation:self.subScrollview];
}

#pragma mark -<UIScrollViewDelegate>

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    // 让标签执行动画
    
    
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;// 设置控制器view的y值为0（默认为20）
    vc.view.height = scrollView.height;// 设置控制器view的height的值为整个屏的高度
    
    [scrollView addSubview:vc.view];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titleview.subviews[index]];
    ZWLogFunc;
    
}


/**
 * 添加目录控制器视图
 */
- (void)pushCategory{
   
    GGKJCategotyViewController *categoryVc = [[GGKJCategotyViewController alloc]init];
    [self.navigationController pushViewController:categoryVc animated:YES];
    }

/**
 * 添加公益模块
 */
- (void)gongyi{
    [self.navigationController pushViewController:[[GGKJPublicServiceViewController alloc]init] animated:YES];
}
/**
 * 创建方块
 */
- (void)createSquares:(NSInteger)array {
    
    // 一行最多多少列
    int maxcols = 4;
    
    // 宽度和高度
    CGFloat buttonW = ZWScreenW / maxcols ;
    CGFloat buttonH = buttonW  - 30;
    
    for (int i = 0; i <(int)array ;i++) {
        
        // 创建button
        ZWSquareButton *button = [[ZWSquareButton alloc]init];
        
        // 添加点击事件
//        [button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        button.square = square;
        if (i == 0) {
            [button setTitle:@"发布" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        }else if (i == 1){
            [button setTitle:@"需求" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"mine-icon-recentHot"] forState:UIControlStateNormal];
        }else if (i == 2){
            [button setTitle:@"供应" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"mine-icon-preview"] forState:UIControlStateNormal];
        }else if (i == 3){
            [button setTitle:@"附近" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"mine_icon_nearby"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(dingwei) forControlEvents:UIControlEventTouchUpInside];
        }else if (i == 4){
            [button setTitle:@"赠品" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"mine-my-post"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(gongyi) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (i == 5){
            [button setTitle:@"分类" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"mine-icon-manhua"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(pushCategory) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (i == 6){
            [button setTitle:@"签到" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"mine-icon-search"] forState:UIControlStateNormal];
        }else if (i == 7){
            [button setTitle:@"个人中心" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"mine-icon-more"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(mycenter) forControlEvents:UIControlEventTouchUpInside];
        }
        
        int col = i % maxcols;
        int row = i / maxcols;
        
        button.x = col * buttonW;
        button.y = row * buttonH + 74 + 10 + ZWScreenW * 0.3;
        button.width = buttonW;
        button.height = buttonH;
        
        [self.contentView addSubview:button];
        
        // self.contentView.height = CGRectGetMaxY(button.frame) + 10;
    }
    
   
    // 重绘
    // [self.contentView setNeedsDisplay];
    
}

// 方块定位功能
- (void)dingwei{
    
    [self.navigationController pushViewController:[[GGKJNeabyViewController alloc]init] animated:YES];
}

- (void)tagClick{
    
}

- (void)mycenter{
    self.tabBarController.selectedIndex = 3;
}

- (void)titleClick:(UIButton *)button{
        // 修改按钮的状态
        self.titleBtn.enabled = YES;
        button.enabled = NO;
        self.titleBtn = button;
        
        // 动画
        [UIView animateWithDuration:0.25 animations:^{
            self.indicatorView.centerX = button.centerX;
            self.indicatorView.width = button.titleLabel.width;
        }];
        
//        // 滚动
//        CGPoint offset = self.contentView.contentOffset;
//        offset.x = button.tag  * self.contentView.width;
//        [self.contentView setContentOffset:offset animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
