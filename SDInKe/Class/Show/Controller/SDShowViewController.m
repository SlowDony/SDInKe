//
//  SDShowViewController.m
//  SDInKe
//
//  Created by slowdony on 2018/1/25.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDShowViewController.h"

#import "SDFocusViewController.h"
#import "SDHotViewController.h"
#import "SDNearViewController.h"
#import "SDShowTopView.h"
@interface SDShowViewController ()
<UIScrollViewDelegate>
@property (nonatomic,strong)  UIScrollView *mainScrollView;
@property (nonatomic,strong)  SDNearViewController *nearVC;
@property (nonatomic,strong)  SDHotViewController *hotVC;
@property (nonatomic,strong)  SDFocusViewController *focusVC;
@property (nonatomic,strong)  SDShowTopView *showTopView;
@end

@implementation SDShowViewController

#pragma mark - lazy


-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
        _mainScrollView.delegate = self;
        _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3,SCREEN_HEIGHT-50);
        _mainScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        _mainScrollView.backgroundColor = [UIColor clearColor];
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces =NO;
    }
    return _mainScrollView;
}
/**
 附近
 */
-(SDNearViewController *)nearVC{
    
    if (!_nearVC){
        _nearVC = [[SDNearViewController alloc]init];
        [self addChildViewController:_nearVC];
        _nearVC.view.frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50);
    }
    return _nearVC;
}

/**
 热门
 */
-(SDHotViewController *)hotVC{
    
    if (!_hotVC){
        _hotVC = [[SDHotViewController alloc]init];
        [self addChildViewController:_hotVC];
        _hotVC.view.frame =CGRectMake(SCREEN_WIDTH,0 , SCREEN_WIDTH, SCREEN_HEIGHT-50);
    }
    return _hotVC;
}

/**
 关注
 */
-(SDFocusViewController *)focusVC{
    
    if (!_focusVC){
        _focusVC = [[SDFocusViewController alloc]init];
        [self addChildViewController:_focusVC];
        _focusVC.view.frame =CGRectMake(SCREEN_WIDTH*2,0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    }
    return _focusVC;
}

-(SDShowTopView *)showTopView{
    if (!_showTopView) {
        NSArray *arr = @[@"附近",@"热门",@"关注"];
        _showTopView = [[SDShowTopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-100, 44)];
        _showTopView.selectIndex = 1;
        _showTopView.btnsArr =[NSMutableArray arrayWithArray:arr];
        KWeakself
        _showTopView.selectBtnBlock = ^(UIButton *selectBtn) {
            CGFloat index = (selectBtn.tag-1000)*SCREEN_WIDTH;
            CGPoint point = CGPointMake(index, 0);
            [weakSelf.mainScrollView setContentOffset:point animated:NO];
        };
    }
    return _showTopView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView =self.showTopView;
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.nearVC.view];
    [self rightButtonWithImage:[UIImage imageNamed:@"title_button_more"] action:@selector(rightBtnClick:) onTarget:self];
    [self leftButtonWithImage:[UIImage imageNamed:@"global_search"] action:@selector(leftBtnClick:) onTarget:self];
    // Do any additional setup after loading the view.
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x ==SCREEN_WIDTH){
        [self.mainScrollView addSubview:self.hotVC.view];
    }else if (scrollView.contentOffset.x ==SCREEN_WIDTH*2){
        
        [self.mainScrollView addSubview:self.focusVC.view];
    }
}
//scrollview 减速停止时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat i = self.mainScrollView.contentOffset.x/SCREEN_WIDTH;
    self.showTopView.selectIndex = i;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (void)rightBtnClick:(UIButton *)sender
{
    DLog(@"右按钮");
}
- (void)leftBtnClick:(UIButton *)sender
{
    DLog(@"左按钮");
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
