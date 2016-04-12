//
//  GGKJPublicServiceCell.m
//  供需
//
//  Created by zw on 16/4/5.
//  Copyright © 2016年 zw. All rights reserved.
//

#import "GGKJPublicServiceCell.h"

@implementation GGKJPublicServiceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setFrame:(CGRect)frame{
    //frame.origin.x = 10;
    //frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 5;
    
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
