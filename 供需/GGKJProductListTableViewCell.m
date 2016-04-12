//
//  GGKJProductListTableViewCell.m
//  供需
//
//  Created by zw on 16/3/27.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJProductListTableViewCell.h"

@implementation GGKJProductListTableViewCell

- (void)awakeFromNib {
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
