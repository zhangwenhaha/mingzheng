//
//  GGKJPublicdetaile.m
//  供需
//
//  Created by zw on 16/4/8.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJPublicdetaile.h"

@interface GGKJPublicdetaile()


@end

@implementation GGKJPublicdetaile



+ (instancetype)detaile{
    
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
