//
//  HWClassifyItemView.h
//  ImitationBeautySay 全部分类的子视图
//
//  Created by hw on 2016/12/20.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWClassifyItemView : UIButton

/**
 主图片
 */
@property (nonatomic, strong) UIImageView *iconView;

/**
 感恩价图片
 */
@property (nonatomic, strong) UIImageView *oweImageView;

/**
 标题
 */
@property (nonatomic, strong) UILabel *titlesLabel;

@end
