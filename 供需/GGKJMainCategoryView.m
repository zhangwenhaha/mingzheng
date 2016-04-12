//
//  GGKJMainCategoryView.m
//  供需
//
//  Created by zw on 16/3/22.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJMainCategoryView.h"

@interface GGKJMainCategoryView()
/** 目录按钮 */
@property (weak, nonatomic) IBOutlet UIButton *categoryBtn;


@end

@implementation GGKJMainCategoryView

+ (instancetype)categoryView{
    
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
