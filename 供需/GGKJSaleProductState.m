//
//  GGKJSaleProductState.m
//  供需
//
//  Created by zw on 16/4/6.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJSaleProductState.h"

@implementation GGKJSaleProductState

- (void)awakeFromNib{
    self.size = CGSizeMake(0, 100);
    self.backgroundColor = ZWRGBColor(58, 162, 245);
}

+ (instancetype)saleproductStateView{
    
return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
