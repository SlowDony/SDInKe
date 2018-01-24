//
//  SDTabBarViewController.m
//  SDInKe
//
//  Created by slowdony on 2018/1/24.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDTabBarViewController.h"
#import "SDTabBar.h"
#import "SDBaseNavigationController.h"
@interface SDTabBarViewController ()
<SDTabBarDelegate>

@property (nonatomic,strong)  SDTabBar *tabbar;

@end

@implementation SDTabBarViewController

#pragma mark - lazy
- (SDTabBar *)tabbar{
    if (!_tabbar){
        _tabbar = [[SDTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49,SCREEN_WIDTH , 49)];
        _tabbar.delegate = self;
    }
    return _tabbar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
    [self.view addSubview:self.tabbar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupViewControllers{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"SDMeViewController",@"SDShowViewController"]];
    for (int i = 0 ; i<arr.count; i++) {
        NSString *vcName = arr[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        SDBaseNavigationController * navc = [[SDBaseNavigationController alloc]initWithRootViewController:vc];
        [arr replaceObjectAtIndex:i withObject:navc];
    }
    self.viewControllers = arr;
}

#pragma mark - SDTabBarDelegate
- (void)tabbar:(SDTabBar *)tabbar withBtn:(TabBarType)tabbarType{
    
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
