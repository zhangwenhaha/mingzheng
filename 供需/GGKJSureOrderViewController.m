//
//  GGKJSureOrderViewController.m
//  供需
//
//  Created by zw on 16/4/10.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJSureOrderViewController.h"

@interface GGKJSureOrderViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sureButton;

@end

@implementation GGKJSureOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sureButton.layer.cornerRadius = 15.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
