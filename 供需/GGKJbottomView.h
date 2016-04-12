//
//  GGKJbottomView.h
//  供需
//
//  Created by zw on 16/3/28.
//  Copyright © 2016年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGKJbottomView : UIView
@property (weak, nonatomic) IBOutlet UIButton *pictureBtn;
@property (weak, nonatomic) IBOutlet UIButton *videoBtn;
@property (weak, nonatomic) IBOutlet UIView *pictureview;
@property (weak, nonatomic) IBOutlet UIView *videoview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *PictureViewLeftMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *videoViewLeftMargin;

+ (instancetype)bottomview;

@end
