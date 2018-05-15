//
//  SDHotViewController.m
//  SDInKe
//
//  Created by slowdony on 2018/1/30.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDHotViewController.h"
#import "SDHotLiveHandle.h"
#import "SDLiveTableView.h"
#import "SDLiveModel.h"
#import "SDPlayerViewController.h"
//热点
@interface SDHotViewController ()
<SDBaseTableViewDelegate>

@property (nonatomic,strong)  SDLiveTableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation SDHotViewController

#pragma mark - lazy
-(SDLiveTableView *)tableView{
    if(!_tableView){
        _tableView = [[SDLiveTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationStatusBarHeight-kNavigationBarHeight) style:UITableViewStylePlain];
        _tableView.baseDelegate = self;
    }
    return _tableView;
}
-(NSMutableArray *)dataArr{
    if(!_dataArr){
        _dataArr = [NSMutableArray array];
        
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setnetWork];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void)setnetWork{
    [SDHotLiveHandle getHotLiveTaskSuccess:^(id obj) {
        NSArray *arr = (NSArray *)obj;
        DLog(@"%@",arr);
        self.dataArr = [NSMutableArray arrayWithArray:arr];
        self.tableView.dataArray = self.dataArr;
        [self.tableView reloadData];
    } failed:^(id obj) {
        DLog(@"error:%@",obj);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SDBaseTableViewDelegate
-(void)tableView:(id)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SDPlayerViewController *playerVC = [[SDPlayerViewController alloc]init];
    playerVC.hidesBottomBarWhenPushed = YES;
    playerVC.liveModel = self.dataArr[indexPath.row];
    [self.navigationController pushViewController:playerVC animated:YES];
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
