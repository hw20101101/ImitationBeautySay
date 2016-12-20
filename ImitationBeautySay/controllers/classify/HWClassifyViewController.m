//
//  HWClassifyViewController.m
//  ImitationBeautySay 分类视图控制器
//
//  Created by hw on 2016/12/19.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#define kLabelHeight 45

#import "HWClassifyViewController.h"
#import "HWClassifyItemView.h"
#import "HWHotTagItemView.h"
#import "HWHotTopicItemView.h"

@interface HWClassifyViewController ()<SDCycleScrollViewDelegate, UIScrollViewDelegate, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *classifyCollectionView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation HWClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"分类";
    [self createScrollView];
    [self createAutoScrollView];
    [self createAllClassify];
    [self createHotTag];
    [self createHotTopic];
    self.view.backgroundColor = hexColor(0xF2F5F8);
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //顶部: 广告轮播 (left:15.5 top:10)
    //全部分类: 九宫格(UIImageView + UILabel)
    //热门标签: 九宫格(UIImageView + UILabel)
    //热门话题/热卖推荐: UIScrollView + UIImageView
    //流行/热销/上新: UICollectionView
}

//UIScrollView 可以替换成UICollectionView ?
- (void)createScrollView{
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(320, 2000);
    self.scrollView.backgroundColor = hexColor(0xF2F5F8);
    [self.view addSubview:self.scrollView];
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(66, 0, 0, 0));
    }];
}

#pragma mark - 广告轮播
- (void)createAutoScrollView{
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    CGFloat x = 10;
    CGFloat width = kScreenWidth - x * 2;
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(x, 10, width, 149) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.currentPageDotColor = [UIColor redColor]; // 自定义分页控件小圆标颜色
    [self.scrollView addSubview:cycleScrollView2];
    
    cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
}

#pragma mark - 全部分类
- (void)createAllClassify{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"    全部分类";
    label.textColor = hexColor(0x333333);
    label.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:label];

    __weak typeof(self) weakSelf = self;
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@179);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(kLabelHeight));
    }];
    
    int count = 12;
    int maxCol = 4;
    CGFloat height = 134;
    CGFloat width = kScreenWidth / maxCol;
    CGFloat yMargin = 179 + kLabelHeight;

    for (int i = 0; i < count; i++) {
        
        NSInteger row = i / maxCol;
        NSInteger col = i % maxCol; // 第几列
        CGFloat x = width * col;
        CGFloat y = height * row + yMargin;
        
        HWClassifyItemView *item = [[HWClassifyItemView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        item.tag = i;
        [item addTarget:self action:@selector(classifyItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:item];
        
        if (i == 11) {
            NSLog(@"-->>> maxX:%f", CGRectGetMaxY(item.frame));
        }
    }
}

#pragma mark - 热门标签
- (void)createHotTag{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"    热门标签";
    label.textColor = hexColor(0x333333);
    label.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:label];

    __weak typeof(self) weakSelf = self;
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@646);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(kLabelHeight));
    }];
    
    int count = 6;
    int maxCol = 3;
    CGFloat widthHeight = 110;
    CGFloat yMargin = 646 + kLabelHeight;
    
    for (int i = 0; i < count; i++) {
 
        NSInteger row = i / maxCol;
        NSInteger col = i % maxCol; // 第几列
        CGFloat sideSpacing = (kScreenWidth - widthHeight * maxCol) / 5.f;
        CGFloat imageSpacing = sideSpacing * 1.5;
        CGFloat x = sideSpacing + widthHeight * col + imageSpacing * col;
        CGFloat y = 10 * row + widthHeight * row + yMargin;
        
        HWHotTagItemView *item = [[HWHotTagItemView alloc] initWithFrame:CGRectMake(x, y, widthHeight, widthHeight)];
        item.tag = i;
        [item addTarget:self action:@selector(hotTagItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:item];

//        NSLog(@"-->>> 2 maxX:%@", NSStringFromCGRect(item.frame));
        if (i == 5) {
            NSLog(@"-->>> maxX:%f", CGRectGetMaxY(item.frame));
        }
    }
}

#pragma mark - 热门话题
- (void)createHotTopic{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"    热门话题";
    label.textColor = hexColor(0x333333);
    label.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:label];
    
    __weak typeof(self) weakSelf = self;
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@941);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(kLabelHeight));
    }];
    
    CGFloat width = 140;
    CGFloat height = 85;
    CGFloat yMargin = 941 + kLabelHeight;
    CGFloat xMargin = 5;
    
    for (int i = 0; i < 4; i++) {

        CGFloat x = i * width + xMargin * i;
        HWHotTopicItemView *item = [[HWHotTopicItemView alloc] initWithFrame:CGRectMake(x, yMargin, width, height)];
        item.tag = i;
        [item addTarget:self action:@selector(hotTagItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:item];
        
        if (i == 3) {
            NSLog(@"-->>> maxX:%f", CGRectGetMaxY(item.frame));
        }
    }
}

- (void)classifyItemViewAction:(UIButton *)button{
    
    NSLog(@"-->> tag:%d", button.tag);
}

- (void)hotTagItemViewAction:(UIButton *)button{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
