//
//  GGKJbottomView.m
//  供需
//
//  Created by zw on 16/3/28.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJbottomView.h"

@implementation GGKJbottomView

+ (instancetype)bottomview{
    
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
