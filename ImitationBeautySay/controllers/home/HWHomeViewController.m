//
//  HWHomeViewController.m
//  ImitationBeautySay 首页视图控制器
//
//  Created by hw on 2016/12/19.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "HWHomeViewController.h"

@interface HWHomeViewController ()

@end

@implementation HWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    self.view.backgroundColor = hexColor(0xF2F5F8);
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
