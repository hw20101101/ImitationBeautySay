//
//  HWTabBarController.m
//  ImitationBeautySay
//
//  Created by hw on 2016/12/19.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "HWTabBarController.h"
#import "HWHomeViewController.h"
#import "HWClassifyViewController.h"
#import "HWCartViewController.h"
#import "HWMeViewController.h"
#import "ZTTabBar.h"

@interface HWTabBarController ()<ZTTabBarDelegate>

@end

@implementation HWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self addChildVc:[[HWHomeViewController alloc] init] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_homeHL"];
    [self addChildVc:[[HWClassifyViewController alloc] init] title:@"分类" image:@"tabbar_classify" selectedImage:@"tabbar_classifyHL"];
    [self addChildVc:[[HWCartViewController alloc] init] title:@"购物车" image:@"tabbar_cart" selectedImage:@"tabbar_cartHL"];
    [self addChildVc:[[HWMeViewController alloc] init] title:@"我" image:@"tabbar_me" selectedImage:@"tabbar_meHL"];
    
    ZTTabBar *tabBar = [[ZTTabBar alloc] init];
    tabBar.delegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:tabBar forKey:@"tabBar"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: RGBColor(123, 123, 123)} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]} forState:UIControlStateSelected];
    //    childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
    // 为子控制器包装导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
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
