//
//  HWHotTagItemView.m
//  ImitationBeautySay 热门标签子视图
//
//  Created by hw on 2016/12/20.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "HWHotTagItemView.h"

@implementation HWHotTagItemView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        self.layer.cornerRadius = 4;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)createUI{
    
    __weak typeof(self) weakSelf = self;
    
    self.iconView = [[UIImageView alloc] init];
    self.iconView.image = [UIImage imageNamed:@"hotTag"];
    [self addSubview:self.iconView];
    
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.centerX.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(110, 110));
    }];
    
    self.titlesLabel = [[UILabel alloc] init];
    self.titlesLabel.text = @"刺绣";
//    self.titlesLabel.backgroundColor = [UIColor purpleColor];
    self.titlesLabel.textAlignment = NSTextAlignmentRight;
    self.titlesLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.titlesLabel];
    
    [self.titlesLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-10);
        make.bottom.equalTo(weakSelf).offset(-10);
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
