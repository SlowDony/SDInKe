//
//  SDLiveViewController.m
//  SDInKe
//
//  Created by slowdony on 2018/1/27.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDLiveViewController.h"

/**
 直播
 */
@interface SDLiveViewController ()

@end

@implementation SDLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    imageView.image = [UIImage imageNamed:@"bg_zbfx"];
    [self.view addSubview:imageView];
    
    //
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 20, 40, 40);
    [backBtn setImage:[UIImage imageNamed:@"launch_close"] forState:UIControlStateNormal];
    [backBtn  addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: backBtn];
    
}

#pragma mark - action
- (void)backBtn:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
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
