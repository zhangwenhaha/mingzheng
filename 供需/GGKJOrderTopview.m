//
//  GGKJOrderTopview.m
//  供需
//
//  Created by zw on 16/4/1.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJOrderTopview.h"

@implementation GGKJOrderTopview

+ (instancetype)ordertopview{

    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
