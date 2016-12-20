//
//  HWClassifyItemView.m
//  ImitationBeautySay 全部分类的子视图
//
//  Created by hw on 2016/12/20.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "HWClassifyItemView.h"

@implementation HWClassifyItemView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = hexColor(0xF4F4F4).CGColor;
    }
    return self;
}

- (void)initUI{
    
    __weak typeof(self) weakSelf = self;
    
    self.iconView = [[UIImageView alloc] init];
    self.iconView.image = [UIImage imageNamed:@"clothes"];
    [self addSubview:self.iconView];
    
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@25);
        make.centerX.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    //感恩价图片
    //oweImageView todo
    
    self.titlesLabel = [[UILabel alloc] init];
    self.titlesLabel.text = @"上衣";
    self.titlesLabel.textAlignment = NSTextAlignmentCenter;
    self.titlesLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.titlesLabel];
    
    [self.titlesLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-17);
        make.centerX.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
