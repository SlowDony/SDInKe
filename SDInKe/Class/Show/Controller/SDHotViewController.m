//
//  SDHotViewController.m
//  SDInKe
//
//  Created by slowdony on 2018/1/30.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDHotViewController.h"
#import "SDHotLiveHandle.h"

//热点
@interface SDHotViewController ()

@end

@implementation SDHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self setnetWork];
    // Do any additional setup after loading the view.
}

- (void)setnetWork{
    [SDHotLiveHandle getHotLiveTaskSuccess:^(id obj) {
        NSArray *arr = (NSArray *)obj;
        DLog(@"%@",arr);
    } failed:^(id obj) {
        DLog(@"error:%@",obj);
    }];
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
