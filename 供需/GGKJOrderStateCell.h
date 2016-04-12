//
//  GGKJOrderStateCell.h
//  供需
//
//  Created by zw on 16/4/6.
//  Copyright © 2016年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGKJOrderStateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *clickCheck;
@property (weak, nonatomic) IBOutlet UIView *topview;
@property (weak, nonatomic) IBOutlet UIView *bottomview;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *yuanBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end
