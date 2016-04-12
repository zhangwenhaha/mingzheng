//
//  GGKJcellview.m
//  供需
//
//  Created by zw on 16/3/31.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJcellview.h"

@implementation GGKJcellview

+ (instancetype)cellview{
    
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
